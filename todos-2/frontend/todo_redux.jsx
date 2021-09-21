import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// Phase 1: Logging
const addLoggingToDispatch = store => {
  const OGDispatch = store.dispatch

  return (action) => {
    console.log(store.getState());
    console.log(action);
    OGDispatch(action);
    console.log(store.getState());
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  // Phase 1: Logging
  store.dispatch = addLoggingToDispatch(store);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
