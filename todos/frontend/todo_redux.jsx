import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';

// Testing
const store = configureStore();
window.store = store;
import { fetchTodos } from './components/util/todo_api_util'
window.fetchTodos = fetchTodos;

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(<Root store={store}/>, document.getElementById('main'));
});
