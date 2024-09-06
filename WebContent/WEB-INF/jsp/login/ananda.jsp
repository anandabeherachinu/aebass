<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Keyboard Design</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        #keyboard {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 5px;
            max-width: 300px;
            margin: 20px auto;
        }

        .key {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
            cursor: pointer;
        }

        #textbox {
            margin: 10px;
            padding: 5px;
        }
    </style>
</head>
<body>

    <div id="keyboard">
        <% for (int i = 1; i <= 9; i++) { %>
            <div class="key" onclick="appendToTextbox('<%= i %>')"><%= i %></div>
        <% } %>
        <div class="key" onclick="appendToTextbox('0')">0</div>
    </div>

    <input type="text" id="textbox" readonly>

    <script>
        function appendToTextbox(value) {
            document.getElementById('textbox').value += value;
        }
    </script>

</body>
</html>
