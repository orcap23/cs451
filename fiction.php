<?php

include('connectionData.txt');

$conn = mysqli_connect($server, $user, $pass, $dbname, $port)
or die('Error connecting to MySQL server.');

?>

<html>
<head>
  <title>Results</title>
  </head>
  
  <body bgcolor= #eaedec>
  
  
  <hr>
  
<?php
  
$lname = $_POST['lname'];

$lname = mysqli_real_escape_string($conn, $lname);
// this is a small attempt to avoid SQL injection
// better to use prepared statements

$query = "SELECT DISTINCT a.author_fname, a.author_lname, b.title, b.ISBN FROM author2 a
JOIN book2 b USING (auth_code) WHERE a.author_lname = '$lname'";


?>

<p>
The query:
<p>
<?php
print $query;
?>

<hr>
<p>
Result of query:
<p>

<?php
$result = mysqli_query($conn, $query)
or die(mysqli_error($conn));

print "<pre>";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
  {
    print "\n";
    print "$row[author_fname] $row[author_lname] |  $row[title] | $row[ISBN]";
  }
print "</pre>";

mysqli_free_result($result);

mysqli_close($conn);

?>

<p>
<hr>

<p>
<a href="main.html"> Back to Main Page</a>	 
 
</body>
</html>