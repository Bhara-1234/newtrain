<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/taglib.tld" prefix="tag" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Train Ticket Booking</title>
    <style>
        body {
            background-color: skyblue;
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
        }

        h1 {
            color: navy;
        }

        label {
            display: inline-block;
            width: 100px;
            text-align: right;
            margin-right: 10px;
        }

        select, input {
            width: 200px;
            padding: 5px;
            margin: 5px;
        }

        #table {
            margin: 0 auto;
            width: 70%;
            text-align: center;
        }

        table {
            width: 100%;
        }

        th, td {
            padding: 10px;
        }

        button {
            padding: 10px 20px;
            background-color: navy;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: darkblue;
        }
    </style>
</head>

<body>
    <h1>Ticket Bookings</h1>
    <label for="from">From:</label>
    <select id="from">
        <tag:drop table="bb_train" column="from_station" />
    </select>

    <label for="to">To:</label>
    <select id="to">
        <tag:drop table="bb_train" column="to_station" />
    </select>
    <button id="b" onclick="Serach()">Search</button>

    <div>
        <label for="trains">Trains:</label>
        <select id="trains">
            <tag:drop table="bb_train" column="train_info" />
        </select>
    </div>

    <div>
        <label for="class">Class:</label>
        <select id="class">
            <option>select</option>
            <option>AC</option>
            <option>Sleeper</option>
            <option>General</option>
        </select>
    </div>

    <div>
        <label for="date">On:</label>
        <input type="date" id="date">
    </div>

    <div>
        <label for="name">Name:</label>
        <input type="text" id="name">
        <label for="gender">Gender:</label>
        <input type="text" id="gender">
        <label for="age">Age:</label>
        <input type="text" id="age">
        <button id="add" onclick="Add()">Add</button>
    </div>

    <table id="table" border="1">
        <thead>
            <tr>
                <th>Name</th>
                <th>Gender</th>
                <th>Age</th>
                <th>Remove</th>
            </tr>
        </thead>
        <tbody id="tbody"></tbody>
    </table>

    <button id="book" onclick="Book()">Book Ticket</button>

    <script>
        var pass = "";

        function Book() {
            var from = document.getElementById("from").value;
            var to = document.getElementById("to").value;
            var train = document.getElementById("trains").value;
            var clas = document.getElementById("class").value;
            var date = document.getElementById("date").value;
            var tic = "from=" + from + "&to=" + to + "&train=" + train + "&class=" + clas + "&date=" + date;
            const xhr = new XMLHttpRequest();
            xhr.open('GET', 'BookingServlet?' + tic + pass, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    const data = xhr.responseText;
                    document.body.innerHTML = data;
                    console.log(data);
                }
            }
            xhr.send();
        }

        function Serach() {
            const xhr = new XMLHttpRequest();
            var to = document.getElementById('to').value;
            var from = document.getElementById('from').value;
            xhr.open('GET', 'Trains?from=' + from + '&to=' + to, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    const data = JSON.parse(xhr.responseText);
                    Trains(data);
                }
            }
            xhr.send();
        }

        function Trains(data) {
            const from = document.getElementById('trains');
            data.forEach(function (item) {
                const op = document.createElement('option');
                op.textContent = item.Train;
                from.appendChild(op);
            });
        }

        function Add() {
            var t = document.getElementById("table");
            var tb = document.getElementById("tbody");
            var tr = document.createElement("tr");
            var td1 = document.createElement("td");
            var td2 = document.createElement("td");
            var td3 = document.createElement("td");
            var td4 = document.createElement("td");
            var n = document.getElementById("name").value;
            var g = document.getElementById("gender").value;
            var a = document.getElementById("age").value;
            td1.textContent = (n);
            td2.textContent = (g);
            td3.textContent = (a);
            tr.appendChild(td1);
            tr.appendChild(td2);
            tr.appendChild(td3);

            var btn = document.createElement("button");
            btn.textContent = "remove";
            td4.appendChild(btn);
            tr.appendChild(td4);
            tb.appendChild(tr);
            t.append(tb);
            btn.addEventListener('click', function () {
                var t = this.parentNode.parentNode;
                t.innerHTML = "";
            });

            pass += "&name=" + n + "&gender=" + g + "&age=" + a;
        }
    </script>
</body>

</html>
