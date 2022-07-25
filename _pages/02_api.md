---
layout: default
permalink: /api/overview
title: API
---

{% include nav_data.html %}

<div>

    <div style="float: left; margin: 0px 10px 10px 0px;">
        <a href="https://en.wikipedia.org/wiki/Web_API">
            <img atl="Wikipedia Web API" src="{{site.baseurl}}/images/webapi.png" title=""
            width="200">
        </a>
    </div>
    <div>
        <hr>
        <p>
            A Web API is an application programming interface typically for a web browser.  Non-changing or Static Endpoints are used in interacting with the server-side Web APIs.  RESTful Web APIs use HTTP methods to access resources via URL parameters, and use JSON for transmitting text between client and server.
            <ul>
                <li>Server.  In these examples, we will be using Python to define REST APIs. Python tools are very popular for building RESTful APIs</li>
                <ul> 
                    <li>REST: Representational State Transfer.  A set of guidelines on how to architect a network-connected software system.</li>
                    <li>Client-server: One guideline is a client and server must be decoupled from each other, allowing each to develop independently.</li>
                    <li>Layered system: The client may access the resources on the server indirectly through other layers such as a proxy or using authentication. This will be clarified by application and security requirements.</li>
                </ul>

                <li>Client.  avaScript is the frontend language used to consume data from the Python defined REST APIs. Fetch will be used to make HTTP requests, as well as handle HTTP response.  There are four basic HTTP methods, they align with Create, Read, Update, Delete (CRUD).</li>
                <ul> 
                    <li>GET => Retrieve/Read data</li>
                    <li>POST => Create data</li>
                    <li>PUT => Update data</li>
                    <li>DELETE => Delete data</li>
                </ul>

                <li>REST endpoints will have similarity from application to application.  In planning APIs, for a Users system you can anticipate key methods.  The Users RESTful APIs would likely contain these endpoints.</li>
                <ul> 
                    <li>GET: /users => Get a list of users</li>
                    <li>GET: /users(id) => Get a single user</li>
                    <li>POST: /users => Create a new user</li>
                    <li>PUT: /users(id) => Update a user</li>
                    <li>DELETE: /users(id) => Delete a user</li>
                </ul>

                <li>Once a RESTful API receives and processes an HTTP request, it will return an HTTP response. Included in this response is an HTTP status code.  Common status codes are shown.</li>
                <ul> 
                    <li>200 => OK, this response will then have the promise of JSON data</li>
                    <li>400 => Bad Request</li>
                    <li>404 => Not Found</li>
                    <li>500 => Internal Server Error (aka bug)</li>
                </ul>

            </ul>
        </p>
        <hr>
    </div>

</div>


### Sample Code in this Sub Menu
> HTML, CSS, and JavaScript are the front-end of the API.  Python and Api libraries are used for RESTful API definition. APIs save a lot of time between developers, as exchange of data has expectations and standards.  Learning APIs is a highly recommended step for every developer trying to break into the world of tech.
- Covid19: RapiAPI example.
- Jokes: Introduction to Python RESTful API library.  A list is used to make data persistent as long as Web Server is active.
- Users: Continues with RESTful API library, but now establish data persistence through the use of a database.