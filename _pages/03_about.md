---
layout: page
title: About Us
permalink: /about/
---

<table>
  <thead>
  <tr>
    <th>Name</th>
    <th>ID</th>
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
  // const url = "https://csp.nighthawkcodingsociety.com/crud_api/read/";
  const url = "https://csa.nighthawkcodingsociety.com/api/person/all";
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
            const name = document.createElement("td");
            const id = document.createElement("td");

            name.innerHTML = data[row].name; 
            id.innerHTML = data[row].email; 

            tr.appendChild(name);
            tr.appendChild(id);
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
