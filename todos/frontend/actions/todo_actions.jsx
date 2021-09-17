import * as TodoAPIUtil from '../util/todo_api_util';

export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
export const REMOVE_TODO = 'REMOVE_TODO';

// Sync actions
export const receiveTodos = (todos) => ({
    type: RECEIVE_TODOS,
    todos
});

export const receiveTodo = (todo) => ({
    type: RECEIVE_TODO,
    todo
});

export const removeTodo = (todo) => ({
    type: REMOVE_TODO,
    todo
});

// Async actions
export const fetchTodos = () => dispatch => (
    TodoAPIUtil.fetchTodos().then(todos => dispatch(receiveTodos(todos)))
);

export const createTodo = todo => dispatch => (
    TodoAPIUtil.createTodo(todo).then(
            todo => { dispatch(receiveTodo(todo)); dispatch(clearErrors())},
            err => dispatch(receiveErrors(err.responseJSON))
        )
);