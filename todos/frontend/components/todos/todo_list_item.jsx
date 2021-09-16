import React from 'react';
import TodoDetailView from './todo_detail_view';

class TodoListItem extends React.Component {
    constructor(props) {
        super(props);

        this.handleDelete = this.handleDelete.bind(this);
        this.handleUpdate = this.handleUpdate.bind(this);
    }

    handleDelete(e) {
        e.preventDefault();
        const todo = this.props.todo;
        this.props.removeTodo(todo);
    }

    handleUpdate(e) {
        e.preventDefault();
        const todo = this.props.todo;
        this.toggle(todo);
    }

    toggle(todo) {
        todo.done = todo.done ? false : true;
        this.props.receiveTodo(todo);
    }

    render() {
        const todo = this.props.todo;

        return (
            <li>
                <div>
                    <h3>{ todo.title }</h3>
                </div>
                <TodoDetailView todo={todo} />
                <button onClick={this.handleDelete}>Delete</button>
                <button onClick={this.handleUpdate}>{ todo.done ? 'Done' : 'Pending' }</button>
            </li>
        );
    }
};

export default TodoListItem;