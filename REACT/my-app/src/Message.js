import React, {  useState } from "react"; 

function Message() {
    const [message, setMessage] = useState("Hello al react");
    return (
        <div>
            <h2>{message}</h2>
            <button onClick={() => setMessage("gracias por aprender React")}>Actualizar Mensaje</button>
        </div>
    );

}
export default Message;