import { createStore } from 'redux';
import reducer from './reducer';

const store = createStore(reducer);

const selectLocation = (city, jobs) => ({
    type: 'SWITCH_LOCATION',
    city,
    jobs
});

window.selectLocation = selectLocation;

export default store;
