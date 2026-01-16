function EventExample() {
    alert("Button clicked!");

    return (
        <div>
            <button onClick={() => alert("Button clicked!")}>Click Me</button>
        </div>
    );
}

export default EventExample;