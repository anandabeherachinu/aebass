<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Modal Trigger</title>
  <style>
    /* Style for the modal */
    #myModal {
      display: none;
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      padding: 20px;
      background-color: #fff;
      border: 1px solid #ccc;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
  </style>
</head>
<body>

<!-- Textbox -->
<input type="text" id="myInput" oninput="checkInputLength()">

<!-- Modal -->
<div id="myModal">
  <p>Modal content goes here.</p>
</div>

<script>
  function checkInputLength() {
    // Get the input value
    var input = document.getElementById("myInput").value;

    // Check if the input length is 12 characters
    if (input.length === 12) {
      // If it is, display the modal
      document.getElementById("myModal").style.display = "block";
    } else {
      // If not, hide the modal
      document.getElementById("myModal").style.display = "none";
    }
  }
</script>

</body>
</html>