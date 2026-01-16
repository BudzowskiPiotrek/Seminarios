import React from "react";

function UserList({  }) {
    const users = ['mary', 'john', 'susan'];

    return (
        <ul>
            {users.map((user, index) => (
                <li key={index}>{user}</li>
            ))}
        </ul>
    );
}

export default UserList;