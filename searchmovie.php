

<style>
    @import "http://fonts.googleapis.com/css?family=Montserrat:300,400,700";
    .rwd-table {
        margin: 1em 0;
        min-width: 300px;
    }
    .rwd-table tr {
        border-top: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
    }
    .rwd-table th {
        display: none;
    }
    .rwd-table td {
        display: block;
    }
    .rwd-table td:first-child {
        padding-top: .5em;
    }
    .rwd-table td:last-child {
        padding-bottom: .5em;
    }
    .rwd-table td:before {
        content: attr(data-th) ": ";
        font-weight: bold;
        width: 6.5em;
        display: inline-block;
    }
    @media (min-width: 480px) {
        .rwd-table td:before {
            display: none;
        }
    }
    .rwd-table th, .rwd-table td {
        text-align: left;
    }
    @media (min-width: 480px) {
        .rwd-table th, .rwd-table td {
            display: table-cell;
            padding: .25em .5em;
        }
        .rwd-table th:first-child, .rwd-table td:first-child {
            padding-left: 0;
        }
        .rwd-table th:last-child, .rwd-table td:last-child {
            padding-right: 0;
        }
    }

    :root {
        background-color: #2e4049;
        color: white;
    }

    body {
        padding: 0 2em;
        font-family: Montserrat, sans-serif;
        -webkit-font-smoothing: antialiased;
        text-rendering: optimizeLegibility;
        color: #444;
        background: #2e4049;
    }

    h1 {
        margin: 60px 0;
        font-size: 3em;
        color: tomato;
        text-shadow: 0 1px 0 #ea553a, 0 3px 0 #b72b12, 0 7px 0 #420900, 0 5px 10px #0b3f3b, 0 5px 11px #ff546a, 0 0 20px tomato;
    }

    a {
        color: tomato;
    }
    div {
        color: tomato;
        font-size: 2em;
    }
    .rwd-table {
        background: #202d33;
        color: #fff;
        border-top: 2px solid tomato;
        border-radius: .4em;
        overflow: hidden;
    }
    .rwd-table tr {
        border-color: #46637f;
    }
    .rwd-table th, .rwd-table td {
        margin: .5em 1em;
    }
    @media (min-width: 480px) {
        .rwd-table th, .rwd-table td {
            padding: 1em !important;
        }
    }
    .rwd-table th, .rwd-table td:before {
        color: tomato;
    }
</style>

<?php
/**
 * Created by PhpStorm.
 * User: Burak
 * Date: 5/20/2017
 * Time: 7:00 PM
 */

$db = mysqli_connect('localhost', 'root', '', 'movies');

$moviename = $_POST['movieInput'];
if($moviename == ""){
    echo "No Movie Found<br>";
}
else {

    //Prepare the query
    $sql = "SELECT person.personname, person.surname
            FROM movie, acts, actor, person
            WHERE person.personid = actor.actorid
            AND actor.actorid = acts.actorid
            AND acts.movieid = movie.movieid
            AND movie.title ='$moviename'";
    //Execute and receive the result of the query
    $mysqli_result = mysqli_query($db, $sql);

    //Receive the number of rows returned by the query
    $count = mysqli_num_rows($mysqli_result);
    if($count==0) {
        echo "<div>No movie found with name: $moviename</div>";
    }
    else {
        echo "<h1>Actors from the movie $moviename</h1>"
        ?>
        <table class="rwd-table">
    <tr>
        <th>Actor</th>
    </tr>
    <tr>

    <?php
        while($row = mysqli_fetch_assoc($mysqli_result))
        {
            $actorname = $row['personname'];
            $actorsurname = $row['surname'];
            echo "<tr><td>$actorname $actorsurname</td></tr>";
        }
    }
}

mysqli_close($db);
?>
    </tr>
        </table>

</br>
<a href="kuz_step4.html">Back to search page</a>