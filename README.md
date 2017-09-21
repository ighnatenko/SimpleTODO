<h1>Task manager</h1>
    <p>I'm a person who passionate about my own productivity. I want to manage my tasks and projects more effectively. I need a simple tool that supports me in controlling my task-flow</p>

<h3>Functional requirements</h3>
    <ul>
        <li>I want to be able to create/update/delete projects</li>
        <li>I want to be able to add tasks to my project</li>
        <li>I want to be able to update/delete tasks</li>
        <li>I want to be able to prioritize tasks into a project</li>
        <li>I want to be able to choose deadline for my task </li>
        <li>I want to be able to mark a task as 'done'</li>
    </ul>

<h3>Technical requirements</h3>
    <ul>
        <li> It should be a WEB application</li>
        <li>For the client side must be used: HTML, CSS (any libs as Twitter Bootstrap, Blueprint ...), JavaScript (any libs as jQuery, Prototype ...)</li>
        <li>For a server side any language as Ruby, PHP, Python, JavaScript, C#, Java ...</li>
        <li>It should have a client side and server side validation</li>
        <li>It should look like on screens (see attached file ‘rg_test_task_grid.png’).</li>
    </ul>

<h3>Additional functionality</h3>
<ul>
    <li>It should work like one page WEB application and should use AJAX technology, load and submit data without reloading a page.</li>
    <li>It should have user authentication solution and a user should only have access to their own projects and tasks.</li>
    <li>It should have automated tests for the all functionality </li>
</ul>
    
<h2>SQL task</h2>
 
   
<h3>Given tables:</h3>
<ul>
    <li>tasks (id, name, status, project_id) </li>
    <li>projects (id, name)</li>
</ul>

<h3>Write the queries for:</h3>
    <ul>
        <li>
            <p>get all statuses, not repeating, alphabetically ordered</p>
            <h3>SELECT DISTINCT status FROM tasks ORDER BY status ASC</h3>
        </li>
        <li> 
            <p>get the count of all tasks in each project, order by tasks count descending</p>
            <h3>SELECT COUNT(*) FROM tasks GROUP BY project_id ORDER BY COUNT(*) DESC</h3>
        </li>
        <li> 
            <p>get the count of all tasks in each project, order by projects names</p>
            <h3>SELECT projects.name, COUNT(tasks.*)tasks FROM projects, tasks WHERE projects.projects_id = tasks.project_id GROUP BY projects.name ORDER BY projects.name</h3>
        </li>
        <li>
            <p>get the tasks for all projects having the name beginning with “N” letter</p>
            <h3>SELECT * FROM tasks WHERE name LIKE 'N%'</h3>
        </li>
        <li>
            <p>get the list of all projects containing the ‘a’ letter in the middle of the name, and show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id=NULL</p>
            <h3>SELECT projects.name, COUNT(tasks.tasks_id) FROM projects, tasks WHERE projects.name LIKE '%a%' AND projects.projects_id = tasks.project_id GROUP BY projects.name</h3>
        </li>
        <li> 
            <p>get the list of tasks with duplicate names. Order alphabetically</p>
            <h3>SELECT * FROM tasks WHERE name IN (SELECT name FROM tasks GROUP BY name HAVING COUNT(name)>1 ) ORDER BY name ASC</h3>
        </li>
        <li>
            <p>get the list of tasks having several exact matches of both name and status, from the project ‘Garage’. Order by matches count</p>
            <h3>SELECT tasks.* FROM tasks, projects WHERE projects.name = "Garage" AND projects.projects_id = tasks.project_id GROUP BY tasks.name HAVING COUNT(tasks.name) > 1 AND COUNT(tasks.status) > 1 ORDER BY COUNT(tasks.name) AND COUNT(tasks.status)</h3>
        </li>
        <li>
            <p>get the list of project names having more than 10 tasks in status ‘completed’. Order by project_id</p>
            <h3>SELECT name FROM (SELECT projects.name, count(tasks.*) FROM projects, tasks WHERE tasks.status = 'completed' AND projects.projects_id = tasks.project_id GROUP BY projects.name) as count WHERE tasks > 10</h3>
        </li>
    </ul>