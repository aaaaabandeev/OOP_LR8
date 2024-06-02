
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<script type="module">
    let request = new XMLHttpRequest();
    request.open("GET", "Users.json");

    request.responseType = "json";
    request.send();

    request.onload = function() {
        let response = request.response;
        fillTable(response);
    }
    function fillTable(response) {
        let tbody = document.querySelector("tbody");;
        response.forEach(object => {
            let newUser = document.createElement("tr");
            let user_firstname = object["user_firstname"];
            let user_lastname = object["lastname"];
            let group = object["group"];
            let age = object["age"];
            let subject = object["subject"];
            newuser.innerHTML =
                '<th scope="row" class="text-start">' + user_firstname +
                '</th><td class="text-body-secondary">' + user_lastname +
                '</td><td class="text-body-secondary">' + group +
                '</td><td class="text-body-secondary">' + age +
                '</td><td class="text-body-secondary">' + subject + '</td>';

            tbody.appendChild(newUser);
        });
    }
</script>

<div class="container py-3">
    <header>


        <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
            <h1 class="block-text__title">Users</h1>

        </div>
    </header>
    <main>
        <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
            <p>
                <button type="button" class="w-100 btn btn-lg btn-primary" onclick="location.href='${pageContext.request.contextPath}/Users_table'">START</button>
            </p>
        </div>

        <div class="table-responsive">
            <table class="table text-center">
                <thead>
                <tr>
                    <th style="width: 34%;">Name</th>
                    <th style="width: 34%;">sort</th>
                    <th style="width: 22%;">color</th>
                    <th style="width: 22%;">Live</th>
                    <th style="width: 22%;">red_book</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row" class="text-start">Иван</th>
                    <td class="text-body-secondary">Иванов</td>
                    <td class="text-body-secondary">1</td>
                    <td class="text-body-secondary">20</td>
                    <td class="text-body-secondary">математика</td>
                </tr>
                </tbody>
            </table>
        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
