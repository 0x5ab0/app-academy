import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import { applyMiddleware } from 'redux';

// Phase 3: Redux applyMiddleware
const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
  console.log(action);
  next(action);
  console.log(store.getState());
};

// Bonus Phase: Add an extra middleware!
const sillyMiddleware = store => next => action => {
  console.log("Silly");
  next(action);
};

const configureStore = (preloadedState = {}) => {
  const store = createStore(
    rootReducer,
    preloadedState,

    // Phase 3: Redux applyMiddleware + Bonus
    applyMiddleware(addLoggingToDispatch, sillyMiddleware)
  );
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

export default configureStore;
