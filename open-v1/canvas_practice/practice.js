document.addEventListener("DOMContentLoaded", function(){
    const canvasEl = document.getElementById('mycanvas');
    canvasEl.width = 500;
    canvasEl.height = 500;

    const ctx = canvasEl.getContext('2d');
    ctx.fillStyle = 'blue';
    ctx.fillRect(0, 0, 500, 500);

    ctx.beginPath();
    ctx.arc(250, 250, 30, 0, 2*Math.PI, true);
    ctx.strokeStyle = 'orange';
    ctx.lineWidth = 10;
    ctx.stroke();

    ctx.fillStyle = 'yellow';
    ctx.fill();
});
