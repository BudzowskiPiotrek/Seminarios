import JSXExample from './JSXExample';
import Message from './Message';
import User from './User';
import Product from './Product';
import EventExample from './EventExample';
import ClassEvent from './ClassEvent';
import ChildButton from './ChildButton';
import ConditionalExample from './ConditionalExample';
import UserList from './UserList';




function App() {
  function showMessage() {
    alert("Button clicked from App component!");
  }

  return (
    <div>
      <h1>Ejercicio Reack: Component, Props y State</h1>
      <JSXExample />
      <User name="Juan Perez" />
      <Message />
      <Product name="Laptop" price={1200} />
      <EventExample />
      <ClassEvent />
      <ChildButton handleClick={showMessage} />
      <ConditionalExample />
      <UserList />



    </div>
  );
}

export default App;