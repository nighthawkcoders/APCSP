---
layout: page
title: About Us
permalink: /about/
---
<script>   
    // fetch the record from the database for a chosen userid
    function read_User(){
      const userID = "1";
      //url for Read API
      const url='https://csp.nighthawkcodingsociety.com/crud_api/read/' + userID;
      console.log(url);
      const requestOptions = {
          method: 'GET',
      };
      //Async fetch API call to the database
      fetch(url, requestOptions).then(response => {
          // prepare HTML search result container for new output
          const resultContainer = document.getElementById("result");
          // clean up from previous search
          while (resultContainer.firstChild) {
              resultContainer.removeChild(resultContainer.firstChild);
          }
          // trap error response from Web API
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
              const tr = document.createElement("tr");
              for (let key in data) {
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
          })
      })
    }
</script>

<table onload="read_User()" id="users">
  <thead>
  <tr>
    <th>Name</th>
    <th>Role</th>
    <th>Profile</th>
    <th>Issues</th>
    <th>Commits</th>
  </tr>
  </thead>
  <tbody id="result">
  <tr>
    <td>John Mortensen</td>
    <td>Teacher</td>
    <td><a href="https://github.com/jm1021" target="_blank">Profile</a></td>
    <td><a href="https://github.com/nighthawkcoders/APCSA/issues/assigned/jm1021" target="_blank">Issues</a></td>
    <td><a href="https://github.com/nighthawkcoders/APCSA/commits?author=jm1021" target="_blank">Commits</a></td>
  </tr>
  <tr>
    <td>Bria Gilliam</td>
    <td>Student</td>
    <td><a href="https://github.com/B-G101" target="_blank">Profile</a></td>
    <td><a href="https://github.com/nighthawkcoders/APCSA/issues/assigned/B-G101" target="_blank">Issues</a></td>
    <td><a href="https://github.com/nighthawkcoders/APCSA/commits?author=B-G101" target="_blank">Commits</a></td>
  </tr>
  <tr>
    <td>Allie Xiao</td>
    <td>Student</td>
    <td><a href="https://github.com/xiaoa0" target="_blank">Profile</a></td>
    <td><a href="https://github.com/nighthawkcoders/APCSA/issues/assigned/xiaoa0" target="_blank">Issues</a></td>
    <td><a href="https://github.com/nighthawkcoders/APCSA/commits?author=xiaoa0" target="_blank">Commits</a></td>
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

