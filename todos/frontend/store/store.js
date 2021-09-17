import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import { applyMiddleware } from 'redux';
import thunkMiddleware from '../middleware/thunk_middleware';

const configureStore = (state = {}) => {
    return createStore(
        rootReducer,
        state,
        applyMiddleware(thunkMiddleware)
    );
};

export default configureStore;
