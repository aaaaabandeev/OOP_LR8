<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<script type="module">
    let request = new XMLHttpRequest();
    request.open("GET", "users.json");

    request.responseType = "json";
    request.send();

    request.onload = function() {
        let response = request.response;
        fillTable(response);
    }
    function fillTable(response) {
        let tbody = document.querySelector("tbody");
        response.forEach(object => {
            let newUser = document.createElement("tr");
            let user_firstname = object["user_firstname"];
            let user_lastname = object["user_lastname"];
            let group = object["group"];
            let age = object["age"];
            let subject = object["subject"];
            newflower.innerHTML =
                '<th scope="row" class="text-start">' + user_firstname +
                '</th><td class="text-body-secondary">' + lastname +
                '</td><td class="text-body-secondary">' + group +
                '</td><td class="text-body-secondary">' + age +
                '</td><td class="text-body-secondary">' + subject + '</td>';

            tbody.appendChild(newuser);
        });
    }
</script>

<div class="container py-3">
    <header>
        <div class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom"><!--border-bottom-->
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="32" class="me-2" viewBox="0 0 118 94" role="img">
                    <title>user</title>
                    </svg>
                <span class="fs-4">user</span>
            </a>

        </div>
    </header>
    <main>
        <h2 class="display-6 text-center mb-4">Add new User</h2>

        <form class="form_songs" method="post">
            <div class="mb-3">
                <label for="user_firstname" class="form-label">User firstname</label>
                <input type="text" class="form-control" id="user_firstname" name="user_firstname">
            </div>
            <div class="mb-3">
                <label for="user_lastname" class="form-label">Sort</label>
                <input type="text" class="form-control" id="user_lastname" name="user lastname">
            </div>
            <div class="mb-3">
                <label for="group" class="form-label">Color</label>
                <input type="text" class="form-control" id="group" name="group">
            </div>
            <div class="mb-3">
                <label for="age" class="form-label">Live</label>
                <input type="text" class="form-control" id="age" name="age">
            </div>
            <div class="mb-3">
                <label for="subject" class="form-label">Red book</label>
                <input type="text" class="form-control" id="subject" name="subject">
            </div>

            <button id = "myButton" class="btn btn-primary btn-lg" type="submit" onclick="">Add flower</button>

        </form>

        <p>

        </p>

        <div class="table-responsive">
            <table class="table text-center">
                <thead>
                <tr>
                    <th style="width: 34%;">Firstname</th>
                    <th style="width: 34%;">Lastname</th>
                    <th style="width: 22%;">Group</th>
                    <th style="width: 22%;">age</th>
                    <th style="width: 22%;">subject</th>
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

    <footer >
        <div class="row">
            <div class="col-12 col-md">

            </div>
        </div>
    </footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
