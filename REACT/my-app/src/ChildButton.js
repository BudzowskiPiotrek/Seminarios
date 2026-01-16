import React from "react";
function ChildButton(props) {
    return (
        <button onClick={props.handleClick}>
            Click Me
        </button>
    );
}
export default ChildButton;