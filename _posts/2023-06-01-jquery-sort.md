---
title: JQuery Sort
comments: true
layout: base
description: Try simple table with JQuery Sort
permalink: /frontend/jquery
tags: [javascript]
---
<head>
    <!-- JQuery -->
    <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <!-- Bootstrap -->
    <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    <style>
        #flaskTable th:first-child {
            width: 75px;
        }
        #flaskTable td:not(:first-child) {
          width: 150px;
        }
    </style>

</head>

<table id="flaskTable" class="table table-striped nowrap" style="width:100%">
    <thead id="flaskHead">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>DOB</th>
            <th>Age</th>
        </tr>
    </thead>
    <tbody id="flaskBody"></tbody>
</table>

<script>
  $(document).ready(function() {
    fetch('https://flask.nighthawkcodingsociety.com/api/users/', { mode: 'cors' })
    .then(response => {
      if (!response.ok) {
        throw new Error('API response failed');
      }
      return response.json();
    })
    .then(data => {
      for (const row of data) {
        $('#flaskBody').append('<tr><td>' + 
            row.id + '</td><td>' + 
            row.name + '</td><td>' + 
            row.dob + '</td><td>' + 
            row.age + '</td></tr>');
      }
      $("#flaskTable").DataTable();
    })
    .catch(error => {
      console.error('Error:', error);
    });
  });
</script>


