---
title: Database from JavaScript
layout: default
description: A view of a JSON data defined in JavaScript.
image: /images/database.png
categories: [C4.7, C7.0, C8.1, C8.6]
tags: [javascript, view]
---

<p>View of User data</p>

<table>
  <thead>
  <tr>
    <th>Name</th>
    <th>ID</th>
  </tr>
  </thead>
  <tbody id="table">
    <!-- javascript generated data -->
  </tbody>
</table>

<script>

// Static data
const data = [
  {
    name: "John Doe",
    email: "johndoe@example.com"
  },
  {
    name: "Jane Doe",
    email: "janedoe@example.com"
  }
];

// prepare HTML result container for new output
const table = document.getElementById("table");
data.forEach(user => {
    // tr and td build out for each row
    const tr = document.createElement("tr");
    const name = document.createElement("td");
    const id = document.createElement("td");
    // data is specific to the API
    name.innerHTML = user.name; 
    id.innerHTML = user.email; 
    // add HTML to container
    tr.appendChild(name);
    tr.appendChild(id);
    table.appendChild(tr);
});

</script>
