import { useState } from "react";

function ConditionalExample() {
    const [idLoggedin, setIdLoggedin] = useState(false);
    return (
        <div>
            {idLoggedin ? (
                <p>¡Bienvenido de nuevo!</p>
            ) : (
                <p>Por favor, inicia sesión.</p>
            )}
            <button onClick={() => setIdLoggedin(!idLoggedin)}>
                {idLoggedin ? "Cerrar sesión" : "Iniciar sesión"}
            </button>
        </div>
    );  
}

export default ConditionalExample;  