import { Component } from "react";
import

class UpdateExample extends Component {
    constructor(props) {
        super(props);
        this.state = {
            count: 0
        };    
    }  
    componentDidUpdate(prevProps, prevState) { 
        if(prevState.count !== this.state.count) {
            console.log(`Count updated to: ${this.state.count}`);
        }
    }

    render() {
        return (
            <div>
                <h2>Update Example</h2>
                <p>Count: {this.state.count}</p>
                <button onClick={() => this.setState({ count: this.state.count + 1 })}>
                    Increment Count
                </button>
            </div>
        );
    }   
}

export default UpdateExample;