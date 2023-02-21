---
title: Database from JavaScript
layout: base
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
    <th>Actions</th>
  </tr>
  </thead>
  <tbody id="table">
    <!-- javascript generated data -->
  </tbody>
</table>

<script>

// Static json
const json = '[{"_name": "Thomas Edison", "_uid": "toby"}, {"_name": "Nicholas Tesla", "_uid": "nick"}, {"_name": "John Mortensen", "_uid": "jm1021"}, {"_name": "Eli Whitney", "_uid": "eli"}, {"_name": "Hedy Lemarr", "_uid": "hedy"}]';

// Convert json string to object
const data = JSON.parse(json);

// prepare HTML result container for new output
const table = document.getElementById("table");
data.forEach(user => {
    // build a row for each user
    const tr = document.createElement("tr");

    // td's to build out each column of data
    const name = document.createElement("td");
    const id = document.createElement("td");
    const action = document.createElement("td");
           
    // add content from user data          
    name.innerHTML = user._name; 
    id.innerHTML = user._uid; 

    // add action for update button
    var updateBtn = document.createElement('input');
    updateBtn.type = "button";
    updateBtn.className = "button";
    updateBtn.value = "Update";
    updateBtn.style = "margin-right:16px";
    updateBtn.onclick = function () {
      alert("Update: " + user._uid);
    };
    action.appendChild(updateBtn);

    // add action for delete button
    var deleteBtn = document.createElement('input');
    deleteBtn.type = "button";
    deleteBtn.className = "button";
    deleteBtn.value = "Delete";
    deleteBtn.style = "margin-right:16px"
    deleteBtn.onclick = function () {
      alert("Delete: " + user._uid);
    };
    action.appendChild(deleteBtn);  

    // add data to row
    tr.appendChild(name);
    tr.appendChild(id);
    tr.appendChild(action);

    // add row to table
    table.appendChild(tr);
});

</script>
