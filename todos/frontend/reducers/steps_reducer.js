import { 
    RECEIVE_STEPS,
    RECEIVE_STEP,
    REMOVE_STEP,
    receiveSteps,
    receiveStep,
    removeStep } from '../actions/step_actions';

// Just for testing. Remove later.
window.receiveSteps = receiveSteps;
window.receiveStep = receiveStep;
window.removeStep = removeStep;

const initialState =  {
  1: {
    title: "walk to store",
    done: false,
    todo_id: 1
  },
  2: {
    title: "buy soap",
    done: false,
    todo_id: 1
  },
  3: {
    title: "walk to park",
    done: false,
    todo_id: 3
  },
  4: {
    title: "play with dog",
    done: false,
    todo_id: 2
  }
};

const stepsReducer = (state = initialState, action) => {
    Object.freeze(state);
    let nextState = {};

    switch (action.type) {
        case RECEIVE_STEPS:
            action.steps.forEach(step => {
                nextState[step.id] = step;
            });
            return nextState;
        case RECEIVE_STEP:
            const newStep = { [action.step.id]: action.step };
            return Object.assign({}, state, newStep);
        case REMOVE_STEP:
            nextState = Object.assign({}, state);
            delete nextState[action.step.id];
            return nextState;
        default:
            return state;
    };
};

export default stepsReducer;
