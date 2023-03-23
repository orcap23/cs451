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

$query1 = "SELECT DISTINCT i.user1_id, i.user_lname, i.library_code 
FROM user1 i WHERE i.library_code = '$lname' ";

$query2 = "SELECT DISTINCT i.user2_id, i.user_lname, i.lib_code 
FROM user2 i WHERE i.lib_code = '$lname'";


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
$result1 = mysqli_query($conn, $query1)
or die(mysqli_error($conn));

print "<pre>";
while($row = mysqli_fetch_array($result1, MYSQLI_BOTH))
  {
    print "\n";
    print "$row[user1_id] | $row[user_lname] | $row[library_code]";
  }
print "</pre>";

$result2 = mysqli_query($conn, $query2)
or die(mysqli_error($conn));

print "<pre>";
while($row = mysqli_fetch_array($result2, MYSQLI_BOTH))
  {
    print "\n";
    print "$row[user2_id] | $row[user_lname] | $row[lib_code]";
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