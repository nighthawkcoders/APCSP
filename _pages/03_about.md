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
  <tbody id="result">
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
  // prepare HTML result container for new output
  const resultContainer = document.getElementById("result");

  // prepare fetch option
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
  fetch('https://csp.nighthawkcodingsociety.com/api/jokes', options)
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
      // response to json data
      response.json().then(data => {
          console.log(data);
          for (let row in data) {
            const tr = document.createElement("tr");
            const td0 = document.createElement("td");
            td0.innerHTML = row; 
            tr.appendChild(td0);
            const td1 = document.createElement("td1");
            td1.innerHTML = data[row].joke; 
            tr.appendChild(td1);
            resultContainer.appendChild(tr);
          }
      })
  })
  // catch fetch errors
  .catch(err => {
    console.error(err);
    const tr = document.createElement("tr");
    const td = document.createElement("td");
    td.innerHTML = err;
    tr.appendChild(td);
    resultContainer.appendChild(tr);
  });
</script>
