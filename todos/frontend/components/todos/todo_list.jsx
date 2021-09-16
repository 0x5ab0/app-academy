import React from 'react';
import TodoListItem from './todo_list_item';

class TodoList extends React.Component {

    render() {
        const todos = Array.from(this.props.todos);
        const todoItems = todos.map(todo => (
                <TodoListItem
                    key = {`todo-list-item${todo.id}`}
                    todo={todo} />
            )
        );

        return (
            <div>
                <ul>
                    { todoItems }
                </ul>
            </div>            
        );
    }
};

export default TodoList;