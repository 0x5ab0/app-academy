import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

window.store = configureStore();

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <h1>Ready to go.</h1>,
        document.getElementById('main')
    );
});
