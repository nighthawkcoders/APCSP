---
title: Database CRUD Operations
layout: default
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
    <th>User</th>
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

<script>
  // prepare HTML result container for new output
  const resultContainer = document.getElementById("result");

  // prepare fetch options
  const url = "https://flask.nighthawkcodingsociety.com/api/users";
  const options = {
    method: 'GET', // *GET, POST, PUT, DELETE, etc.
    mode: 'cors', // no-cors, *cors, same-origin
    cache: 'default', // *default, no-cache, reload, force-cache, only-if-cached
    credentials: 'omit', // include, *same-origin, omit
    headers: {
      'Content-Type': 'application/json'
      // 'Content-Type': 'application/x-www-form-urlencoded',
    },
  };

  // fetch the API
  fetch(url, options)
      // response is a RESTful "promise" on any successful fetch
    .then(response => {
      // check for response errors
      if (response.status !== 200) {
          const errorMsg = 'Database response error: ' + response.status;
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
            // tr and td element id's to build out for each row
            const tr = document.createElement("tr");
            const uid = document.createElement("td");
            const name = document.createElement("td");
            const posts = document.createElement("td")
            const dob = document.createElement("td");
            const age = document.createElement("td");
          

            // obtain data that is specific to the API
            uid.innerHTML = data[row].uid; 
            name.innerHTML = data[row].name; 
            posts.innerHTML = data[row].posts.length;
            dob.innerHTML = data[row].dob; 
            age.innerHTML = data[row].age; 

            // add HTML to container
            tr.appendChild(uid);
            tr.appendChild(name);
            tr.appendChild(posts);
            tr.appendChild(dob);
            tr.appendChild(age);

            resultContainer.appendChild(tr);
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
</script>
