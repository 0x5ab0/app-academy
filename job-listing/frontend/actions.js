const selectLocation = (city, jobs) => ({
    type: 'SWITCH_LOCATION',
    city,
    jobs
});

window.selectLocation = selectLocation;

export default selectLocation;