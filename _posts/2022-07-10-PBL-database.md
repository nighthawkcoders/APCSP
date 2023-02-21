---
title: Database CRUD Operations
layout: base
description: An advanced example of do database operation asynchronously between JavaScript and Backend Database.
permalink: /data/database
image: /images/database.png
categories: [C4.7, C7.0, C8.1, C8.6]
tags: [javascript, fetch, get, post, put]
---

{% include nav_data.html %}

<p>Database API</p>

<table>
  <thead>
  <tr>
    <th>User ID</th>
    <th>Name</th>
    <th>Posts</th>
    <th>DOB</th>
    <th>Age</th>
  </tr>
  </thead>
  <tbody id="result">
    <!-- javascript generated data -->
  </tbody>
</table>

<p>Create API</p>

<form action="javascript:create_user()">
    <p><label>
        User ID:
        <input type="text" name="uid" id="uid" required>
    </label></p>
    <p><label>
        Name:
        <input type="text" name="name" id="name" required>
    </label></p>
    <p><label>
        Password:
        <input type="password" name="password" id="password" required>
        Verify Password:
        <input type="password" name="passwordV" id="passwordV" required>
    </label></p>
    <p><label>
        Birthday:
        <input type="date" name="dob" id="dob">
    </label></p>
    <p>
        <button>Create</button>
    </p>
</form>

<script>
  // prepare HTML result container for new output
  const resultContainer = document.getElementById("result");
  // prepare URL's to allow easy switch from deployment and localhost
  var url = "https://flask.nighthawkcodingsociety.com/api/users"
  //url = "http://localhost:8086/api/users"
  

  const create_fetch = url + '/create';
  const read_fetch = url + '/';

  // Load users on page entry
  read_users();


  // Display User Table, data is fetched from Backend Database
  function read_users() {
    // prepare fetch options
    const read_options = {
      method: 'GET', // *GET, POST, PUT, DELETE, etc.
      mode: 'cors', // no-cors, *cors, same-origin
      cache: 'default', // *default, no-cache, reload, force-cache, only-if-cached
      credentials: 'omit', // include, *same-origin, omit
      headers: {
        'Content-Type': 'application/json'
      },
    };

    // fetch the data from API
    fetch(read_fetch, read_options)
      // response is a RESTful "promise" on any successful fetch
      .then(response => {
        // check for response errors
        if (response.status !== 200) {
            const errorMsg = 'Database read error: ' + response.status;
            console.log(errorMsg);
            const tr = document.createElement("tr");
            const td = document.createElement("td");
            td.innerHTML = errorMsg;
            tr.appendChild(td);
            resultContainer.appendChild(tr);
            return;
        }
        // valid response will have json data
        response.json().then(data => {
            console.log(data);
            for (let row in data) {
              console.log(data[row]);
              add_row(data[row]);
            }
        })
    })
    // catch fetch errors (ie ACCESS to server blocked)
    .catch(err => {
      console.error(err);
      const tr = document.createElement("tr");
      const td = document.createElement("td");
      td.innerHTML = err;
      tr.appendChild(td);
      resultContainer.appendChild(tr);
    });
  }

  function create_user(){
    //Validate Password (must be 6-20 characters in len)
    //verifyPassword("click");
    const body = {
        uid: document.getElementById("uid").value,
        name: document.getElementById("name").value,
        password: document.getElementById("password").value,
        dob: document.getElementById("dob").value
    };
    const requestOptions = {
        method: 'POST',
        body: JSON.stringify(body),
        headers: {
            "content-type": "application/json",
            'Authorization': 'Bearer my-token',
        },
    };

    // URL for Create API
    // Fetch API call to the database to create a new user
    fetch(create_fetch, requestOptions)
      .then(response => {
        // trap error response from Web API
        if (response.status !== 200) {
          const errorMsg = 'Database create error: ' + response.status;
          console.log(errorMsg);
          const tr = document.createElement("tr");
          const td = document.createElement("td");
          td.innerHTML = errorMsg;
          tr.appendChild(td);
          resultContainer.appendChild(tr);
          return;
        }
        // response contains valid result
        response.json().then(data => {
            console.log(data);
            //add a table row for the new/created userid
            add_row(data);
        })
    })
  }

  function add_row(data) {
    const tr = document.createElement("tr");
    const uid = document.createElement("td");
    const name = document.createElement("td");
    const posts = document.createElement("td")
    const dob = document.createElement("td");
    const age = document.createElement("td");
  

    // obtain data that is specific to the API
    uid.innerHTML = data.uid; 
    name.innerHTML = data.name; 
    posts.innerHTML = data.posts.length;
    dob.innerHTML = data.dob; 
    age.innerHTML = data.age; 

    // add HTML to container
    tr.appendChild(uid);
    tr.appendChild(name);
    tr.appendChild(posts);
    tr.appendChild(dob);
    tr.appendChild(age);

    resultContainer.appendChild(tr);
  }

</script>
