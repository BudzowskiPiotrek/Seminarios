import React from "react";

class ClassEvent extends React.Component {
constructor(props) {
    super(props);
    this.state = {message: "Hola, haz hecho clic en el botón."
    };
    this.handleClick = this.handleClick.bind(this);
}

handleClick = () => {
    this.setState({message: "Botón clickeado!"});
}

render() {
    return (
        <div>
            <p>{this.state.message}</p>
            <button onClick={this.handleClick}>Click Me</button>
        </div>
    );
}
    
}

export default ClassEvent;