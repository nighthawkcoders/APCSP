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
  const options = {
	method: 'GET',
	headers: {
		'X-RapidAPI-Key': 'bea0fa2ff5msh7f14bf69be38ca6p175482jsn6c4988114560',
		'X-RapidAPI-Host': 'covid-19-tracking.p.rapidapi.com'
	}
  };

  //Async fetch API
  fetch('https://covid-19-tracking.p.rapidapi.com/v1/usa', options).then(response => {
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
      .catch(err => console.error(err));
  })
</script>
