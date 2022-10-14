---
title: Fetch of Python data using RapidAPI
layout: default
description: An introductory example of talking to Backend Python application serving 3rd Party API.  Fetching data and formatting results is a way to visuals information, in this case Covid19 statistics across the Globe. 
permalink: /data/covid
image: /images/rapidapi.png
categories: [C7.0]
tags: [javascript, fetch, dom, getElementID, appendChild]
week: 8
type: pbl
---

{% include nav_data.html %}

[Review Frontend Code](https://raw.githubusercontent.com/nighthawkcoders/APCSP/master/_posts/2022-07-10-PBL-rapidapi.md), [Review Backend Code](https://github.com/nighthawkcoders/flask_portfolio/blob/main/api/covid.py)

<!-- HTML table fragment for page -->
<table>
  <thead>
  <tr>
    <th>Time</th>
    <th>All-time Cases</th>
    <th>Recorded Deaths</th>
    <th>Active Cases</th>
  </tr>
  </thead>
  <tbody>
    <td id="time"></td>
    <td id="total_cases"></td>
    <td id="total_deaths"></td>
    <td id="active_cases"></td>
  </tbody>
</table>

<table>
  <thead>
  <tr>
    <th>Country</th>
    <th>All-time Cases</th>
    <th>Recorded Deaths</th>
    <th>Active Cases</th>
  </tr>
  </thead>
  <tbody id="result">
    <!-- generated rows -->
  </tbody>
</table>

<!-- Script is layed out in a sequence (no function) and will execute when page is loaded -->
<script>
  // prepare HTML result container for new output
  const resultContainer = document.getElementById("result");

  // prepare fetch options
  const url = "https://flask.nighthawkcodingsociety.com/api/covid/";
  const headers = {
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
  fetch(url, headers)
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
          console.log(data.world_total)

          // World Data
          document.getElementById("time").innerHTML = data.world_total.statistic_taken_at;
          document.getElementById("total_cases").innerHTML = data.world_total.total_cases;
          document.getElementById("total_deaths").innerHTML = data.world_total.total_deaths;
          document.getElementById("active_cases").innerHTML = data.world_total.active_cases;

          // Country data
          for (const row of data.countries_stat) {
            console.log(row);

            // tr for each row
            const tr = document.createElement("tr");
            // td for each column
            const name = document.createElement("td");
            const cases = document.createElement("td");
            const deaths = document.createElement("td");
            const active = document.createElement("td");

            // data is specific to the API
            name.innerHTML = row.country_name;
            cases.innerHTML = row.cases; 
            deaths.innerHTML = row.deaths; 
            active.innerHTML = row.active_cases; 

            // this builds td's into tr
            tr.appendChild(name);
            tr.appendChild(cases);
            tr.appendChild(deaths);
            tr.appendChild(active);

            // add HTML to container
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
