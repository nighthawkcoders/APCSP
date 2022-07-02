---
layout: page
title: About Us
permalink: /about/
---

<table>
  <thead>
  <tr>
    <th>Name</th>
    <th>Role</th>
    <th>Profile</th>
    <th>Issues</th>
    <th>Commits</th>
  </tr>
  </thead>
  <tbody id="users">
  <tr>
    <td>John Mortensen</td>
    <td>Teacher</td>
    <td><a href="https://github.com/jm1021" target="_blank">Profile</a></td>
    <td><a href="https://github.com/nighthawkcoders/APCSA/issues/assigned/jm1021" target="_blank">Issues</a></td>
    <td><a href="https://github.com/nighthawkcoders/APCSA/commits?author=jm1021" target="_blank">Commits</a></td>
  </tr>
  <tr>
    <td>Tigran Arkelov</td>
    <td>Student</td>
    <td><a href="https://github.com/Tigran7" target="_blank">Profile</a></td>
    <td><a href="https://github.com/nighthawkcoders/APCSA/issues/assigned/Tigran7" target="_blank">Issues</a></td>
    <td><a href="https://github.com/nighthawkcoders/APCSA/commits?author=Tigran7" target="_blank">Commits</a></td>
  </tr>
  </tbody>
</table>

<script>   
    // fetch the record from the database for a chosen userid
    //url for Read API
    const url='http://cors.io/?https://csp.nighthawkcodingsociety.com/crud_api/read/'
    console.log(url);
    const requestOptions = {
        method: 'GET',
        mode: 'cors', // no-cors, *cors, same-origin
    };
    //Async fetch API call to the database
    fetch(url, requestOptions).then(response => {
        // prepare HTML search result container for new output
        const resultContainer = document.getElementById("users");
        // check for errors
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
        // response contains valid result
        response.json().then(data => {
            console.log(data);
            //create a table row for the new user
            for (let row in data) {
              const tr = document.createElement("tr");

              for (let key in row) {
                  if (key !== 'query') {
                      //create a cell for each key
                      const td = document.createElement("td");
                      td.innerHTML = data[key];
                      //add each cell to the table row
                      tr.appendChild(td);
                  }
              }
              // append the row to the table
              resultContainer.appendChild(tr);
            }
            
        })
    })
</script>
