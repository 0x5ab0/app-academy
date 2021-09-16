export const allTodos = ({ todos }) => Object.keys(todos).map(id => todos[id]);

export const stepsByTodoId = ({ steps }, todo_Id) => {
    const stepsByTodoId = [];
    Object.keys(steps).forEach(stepId => {
        const step = steps[stepId];
        if (steps[stepId].todo_Id === todo_Id) stepsByTodoId.push(step)
    })
    return stepsByTodoId; 
};
