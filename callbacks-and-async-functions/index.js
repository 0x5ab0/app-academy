// Simple Timeout

window.setTimeout(function() {
    alert('HAMMERTIME')
}, 5000);

// Timeout with Closure

function hammerTime (time) {
    window.setTimeout(function () {
        alert(`${time} is HAMMER TIME!`);
    });
}