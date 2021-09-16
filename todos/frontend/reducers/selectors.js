// export const allTodos = (state) => ( Object.values(state.todos) );
export const allTodos = ({ todos }) => Object.keys(todos).map(id => todos[id]);
