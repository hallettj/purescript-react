-- | This module defines foreign types and functions which wrap React's functionality.

module React
  ( ReactElement
  , ReactElementImpl(..)
  , ReactElementRaw()
  , ReactComponent()
  , ReactThis()
  , TaggedReactElement(..)
  , TagName()

  , EventHandler()

  , Read()
  , Write()
  , Disallowed()
  , ReadWrite()
  , ReadOnly()

  , ReactState()
  , ReactProps()
  , ReactRefs()

  , Refs()

  , Render()
  , GetInitialState()
  , ComponentWillMount()
  , ComponentDidMount()
  , ComponentWillReceiveProps()
  , ShouldComponentUpdate()
  , ComponentWillUpdate()
  , ComponentDidUpdate()
  , ComponentWillUnmount()

  , ReactSpec()
  , ReactClass()

  , Event()
  , MouseEvent()
  , KeyboardEvent()

  , EventHandlerContext()

  , spec, spec'
  , elements

  , getProps
  , getRefs
  , getChildren

  , readState
  , writeState
  , transformState

  , handle

  , createClass
  , createClassStateless
  , createClassStateless'
  , createElement
  , createElementTagName
  , createFactory
  ) where

import Prelude ( class Apply
               , class Bind
               , class Functor
               , Unit(), (<>), bind, pure, return, unit)

import Control.Monad.Eff (Eff())

import Unsafe.Coerce (unsafeCoerce)

-- | Name of a tag.
type TagName = String

-- | A virtual DOM node, or component.
foreign import data ReactElementRaw :: *

-- | A mounted react component
foreign import data ReactComponent :: *

-- | A reference to a component, essentially React's `this`.
foreign import data ReactThis :: * -> * -> *

-- | An event handler. The type argument represents the type of the event.
foreign import data EventHandler :: * -> *

-- | This phantom type indicates that read access to a resource is allowed.
foreign import data Read :: !

-- | This phantom type indicates that write access to a resource is allowed.
foreign import data Write :: !

-- | An access synonym which indicates that neither read nor write access are allowed.
type Disallowed = () :: # !

-- | An access synonym which indicates that both read and write access are allowed.
type ReadWrite = (read :: Read, write :: Write)

-- | An access synonym which indicates that reads are allowed but writes are not.
type ReadOnly = (read :: Read)

-- | This effect indicates that a computation may read or write the component state.
-- |
-- | The first type argument is a row of access types (`Read`, `Write`).
foreign import data ReactState :: # ! -> !

-- | This effect indicates that a computation may read the component props.
foreign import data ReactProps :: !

-- | This effect indicates that a computation may read the component refs.
-- |
-- | The first type argument is a row of access types (`Read`, `Write`).
foreign import data ReactRefs :: # ! -> !

-- | The type of refs objects.
foreign import data Refs :: *

-- | The type of DOM events.
foreign import data Event :: *

-- | The type of React elements as seen by users of this library.
type ReactElement = ReactElementImpl Unit
data ReactElementImpl a = ReactElement (Array TaggedReactElement) a

data TaggedReactElement = StaticElement ReactElementRaw
                        | DynamicElements (Array ReactElementRaw)

-- | The type of mouse events.
type MouseEvent =
  { pageX :: Number
  , pageY :: Number
  }

-- | The type of keyboard events.
type KeyboardEvent =
  { altKey   :: Boolean
  , ctrlKey  :: Boolean
  , charCode :: Int
  , key      :: String
  , keyCode  :: Int
  , locale   :: String
  , location :: Int
  , metaKey  :: Boolean
  , repeat   :: Boolean
  , shiftKey :: Boolean
  , which    :: Int
  }

-- | A function which handles events.
type EventHandlerContext eff props state result =
  Eff ( props :: ReactProps
      , refs :: ReactRefs ReadOnly
      , state :: ReactState ReadWrite
      | eff
      ) result

-- | A render function.
type Render props state eff =
  ReactThis props state ->
  Eff ( props :: ReactProps
      , refs :: ReactRefs Disallowed
      , state :: ReactState ReadOnly
      | eff
      ) ReactElement

-- | A get initial state function.
type GetInitialState props state eff =
  ReactThis props state ->
  Eff ( props :: ReactProps
      , state :: ReactState Disallowed
      , refs :: ReactRefs Disallowed
      | eff
      ) state

-- | A component will mount function.
type ComponentWillMount props state eff =
  ReactThis props state ->
  Eff ( props :: ReactProps
      , state :: ReactState ReadWrite
      , refs :: ReactRefs Disallowed
      | eff
      ) Unit

-- | A component did mount function.
type ComponentDidMount props state eff =
  ReactThis props state ->
  Eff ( props :: ReactProps
      , state :: ReactState ReadWrite
      , refs :: ReactRefs ReadOnly
      | eff
      ) Unit

-- | A component will receive props function.
type ComponentWillReceiveProps props state eff =
   ReactThis props state ->
   props ->
   Eff ( props :: ReactProps
       , state :: ReactState ReadWrite
       , refs :: ReactRefs ReadOnly
       | eff
       ) Unit

-- | A should component update function.
type ShouldComponentUpdate props state eff =
  ReactThis props state ->
  props ->
  state ->
  Eff ( props :: ReactProps
      , state :: ReactState ReadWrite
      , refs :: ReactRefs ReadOnly
      | eff
      ) Boolean

-- | A component will update function.
type ComponentWillUpdate props state eff =
  ReactThis props state ->
  props ->
  state ->
  Eff ( props :: ReactProps
      , state :: ReactState ReadWrite
      , refs :: ReactRefs ReadOnly
      | eff
      ) Unit

-- | A component did update function.
type ComponentDidUpdate props state eff =
  ReactThis props state ->
  props ->
  state ->
  Eff ( props :: ReactProps
      , state :: ReactState ReadOnly
      , refs :: ReactRefs ReadOnly
      | eff
      ) Unit

-- | A component will unmount function.
type ComponentWillUnmount props state eff =
  ReactThis props state ->
  Eff ( props :: ReactProps
      , state :: ReactState ReadOnly
      , refs :: ReactRefs ReadOnly
      | eff
      ) Unit

-- | A specification of a component.
type ReactSpec props state eff =
  { render :: Render props state eff
  , displayName :: String
  , getInitialState :: GetInitialState props state eff
  , componentWillMount :: ComponentWillMount props state eff
  , componentDidMount :: ComponentDidMount props state eff
  , componentWillReceiveProps :: ComponentWillReceiveProps props state eff
  , shouldComponentUpdate :: ShouldComponentUpdate props state eff
  , componentWillUpdate :: ComponentWillUpdate props state eff
  , componentDidUpdate :: ComponentDidUpdate props state eff
  , componentWillUnmount :: ComponentWillUnmount props state eff
  }

instance functorReactElement :: Functor ReactElementImpl where
  map f (ReactElement es x) = ReactElement es (f x)

instance applyReactElement :: Apply ReactElementImpl where
  apply (ReactElement as f) (ReactElement bs x) = ReactElement (as <> bs) (f x)

instance bindReactElement :: Bind ReactElementImpl where
  bind (ReactElement es x) f =
    case f x of
      ReactElement es' y -> ReactElement (es <> es') y

-- | Create a component specification with a provided state.
spec :: forall props state eff. state -> Render props state eff -> ReactSpec props state eff
spec state = spec' (\_ -> pure state)

-- | Create a component specification with a get initial state function.
spec' :: forall props state eff. GetInitialState props state eff -> Render props state eff -> ReactSpec props state eff
spec' getInitialState renderFn =
  { render: renderFn
  , displayName: ""
  , getInitialState: getInitialState
  , componentWillMount: \_ -> return unit
  , componentDidMount: \_ -> return unit
  , componentWillReceiveProps: \_ _ -> return unit
  , shouldComponentUpdate: \_ _ _ -> return true
  , componentWillUpdate: \_ _ _ -> return unit
  , componentDidUpdate: \_ _ _ -> return unit
  , componentWillUnmount: \_ -> return unit
  }

-- | Produce a dynamic elements value from an array of static or dynamic elements
elements :: Array ReactElement -> ReactElement
elements es = ReactElement [DynamicElements (flat es)] unit
  where
    flat reArray = do
      reactElements <- reArray
      case reactElements of
        ReactElement taggedElements _ -> do
          taggedElement <- taggedElements
          case taggedElement of
            StaticElement   rawElem  -> [rawElem]
            DynamicElements rawElems -> rawElems

-- | React class for components.
foreign import data ReactClass :: * -> *

-- | Read the component props.
foreign import getProps :: forall props state eff. ReactThis props state -> Eff (props :: ReactProps | eff) props

-- | Read the component refs.
foreign import getRefs :: forall props state access eff. ReactThis props state -> Eff (refs :: ReactRefs (read :: Read | access) | eff) Refs

-- | Read the component children property.
foreign import getChildren :: forall props state eff. ReactThis props state -> Eff (props :: ReactProps | eff) (Array ReactElement)

-- | Write the component state.
foreign import writeState :: forall props state access eff. ReactThis props state -> state -> Eff (state :: ReactState (write :: Write | access) | eff) state

-- | Read the component state.
foreign import readState :: forall props state access eff. ReactThis props state -> Eff (state :: ReactState (read :: Read | access) | eff) state

-- | Transform the component state by applying a function.
foreign import transformState :: forall props state eff. ReactThis props state -> (state -> state) -> Eff (state :: ReactState ReadWrite | eff) Unit

-- | Create a React class from a specification.
foreign import createClass :: forall props state eff. ReactSpec props state eff -> ReactClass props

-- | Create a stateless React class.
createClassStateless :: forall props. (props -> ReactElement) -> ReactClass props
createClassStateless = unsafeCoerce

-- | Create a stateless React class with children access.
createClassStateless' :: forall props. (props -> Array ReactElement -> ReactElement) -> ReactClass props
createClassStateless' k = createClassStateless \props -> k props (childrenToArray (unsafeCoerce props).children)

-- | Create an event handler.
foreign import handle :: forall eff ev props state result.  (ev -> EventHandlerContext eff props state result) -> EventHandler ev

foreign import createElementImpl :: forall props. ReactClass props -> props -> ReactElement -> ReactElementRaw

foreign import createElementTagNameImpl :: forall props. TagName -> props -> ReactElement -> ReactElementRaw

-- | Create an element from a React class.
createElement :: forall props. ReactClass props -> props -> ReactElement -> ReactElement
createElement cp p e = wrapReactElementRaw (createElementImpl cp p e)

-- | Create an element from a tag name.
createElementTagName :: forall props. TagName -> props -> ReactElement -> ReactElement
createElementTagName cp p e = wrapReactElementRaw (createElementTagNameImpl cp p e)

wrapReactElementRaw :: ReactElementRaw -> ReactElement
wrapReactElementRaw e = ReactElement [StaticElement e] unit

-- | Create a factory from a React class.
foreign import createFactory :: forall props. ReactClass props -> props -> ReactElement

-- | Internal representation for the children elements passed to a component
foreign import data Children :: *

-- | Internal conversion function from children elements to an array of React elements
foreign import childrenToArray :: Children -> Array React.ReactElement
