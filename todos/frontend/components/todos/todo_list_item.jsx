import React from 'react';

class TodoListItem extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        const todo = this.props.todo;

        return (
            <li>
                <div>
                    <h3>{ todo.title }</h3>
                </div>
            </li>    
        );
    }
};

export default TodoListItem;