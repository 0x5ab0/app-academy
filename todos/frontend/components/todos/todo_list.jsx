import React from 'react';

import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
    componentDidMount() {
        this.props.requestTodos();
    }

    render() {
        // const { todos, createTodo } = this.props;
        const todos = this.props.todos;
        const createTodo = this.props.createTodo;
        const receiveTodo = this.props.receiveTodo;
        
        const todoItems = todos.map(todo => (
                <TodoListItem
                    key = {`todo-list-item${todo.id}`}
                    todo={todo}
                    receiveTodo={ receiveTodo } />
            )
        );

        return (
            <div>
                <ul>
                    { todoItems }
                </ul>
                <TodoForm createTodo={ createTodo } />
            </div>            
        );
    }
};

export default TodoList;