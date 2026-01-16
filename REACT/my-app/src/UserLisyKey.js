import React from "react";

function UserListKey({ users }) {
    const userList =  [{ id: 1, name: 'mary' },
        { id: 2, name: 'john' }, 
        { id: 3, name: 'susan' }];
    return (
        <ul>
            {userList.map((user) => (
                <li key={user.id}>{user.name}</li>
            ))}
        </ul>
    );

}