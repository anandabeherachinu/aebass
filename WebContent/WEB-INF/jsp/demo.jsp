<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    #pie-chart {
      width: 200px;
      height: 200px;
      border-radius: 50%;
      position: relative;
    }

    .slice {
      position: absolute;
      width: 100%;
      height: 100%;
      clip: rect(0, 100px, 200px, 0);
      transform: rotate(0deg);
      transition: transform 1s;
      transform-origin: 50% 50%;
    }

    .slice:nth-child(1) { background-color: #3498db; }
    .slice:nth-child(2) { background-color: #e74c3c; }
    .slice:nth-child(3) { background-color: #2ecc71; }
    .slice:nth-child(4) { background-color: #f39c12; }
  </style>
</head>
<body>
  <div id="pie-chart">
    <div class="slice" style="transform: rotate(0deg);"></div>
    <div class="slice" style="transform: rotate(90deg);"></div>
    <div class="slice" style="transform: rotate(180deg);"></div>
    <div class="slice" style="transform: rotate(270deg);"></div>
  </div>

  <script>
    const data = [25, 30, 20, 25]; // Percentages for each slice

    const pieChart = document.getElementById('pie-chart');
    const slices = document.querySelectorAll('.slice');

    let startAngle = 0;

    data.forEach((percentage, index) => {
      const rotateAngle = startAngle + (percentage / 100) * 360;

      slices[index].style.transform = `rotate(${rotateAngle}deg)`;
      startAngle = rotateAngle;
    });
  </script>
</body>
</html>
