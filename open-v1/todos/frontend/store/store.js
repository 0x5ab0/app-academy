import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import thunkMiddleware from '../middleware/thunk_middleware';

const configureStore = (initialState = {}) => {
    return createStore(
        rootReducer,
        initialState,
        applyMiddleware(thunkMiddleware)
    );
};

export default configureStore;
