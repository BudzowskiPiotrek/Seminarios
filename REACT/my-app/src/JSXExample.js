function JSXExample() {
    const name = ['Carlos', 'Ana', 'Luis'];
    const year = new Date().getFullYear();

    return (
        <div>
            <p>Componente Funcional</p>
            <h2>{name[0]}</h2>
        </div>
    );
}

export default JSXExample;