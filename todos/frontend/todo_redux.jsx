import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';

const store = configureStore();

// import allTodos from './reducers/selectors';
// window.allTodos = allTodos(store.getState());

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(<Root store={store}/>, document.getElementById('main'));
});
