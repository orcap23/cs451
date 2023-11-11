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
  
$ISBN = $_POST['ISBN'];
$user = $_POST['user'];
$library_code = $_POST['library_code'];

$ISBN = mysqli_real_escape_string($conn, $ISBN);
$user = mysqli_real_escape_string($conn, $user);
$library_code = mysqli_real_escape_string($conn, $library_code);
// this is a small attempt to avoid SQL injection
// better to use prepared statements


$lib1 = "SELECT DISTINCT library_code FROM library1";
$lib2 = "SELECT DISTINCT lib_code FROM library2";

if ($library_code == '1'){
    $result = "INSERT INTO transfer(book1_ISBN, user1_user1_id, library1_library_code)
    VALUES ('$ISBN', '$user', '$library_code')";
    echo"Transfer Initaited";
}
    
if ($library_code == '2'){
    $result = "INSERT INTO transfer(book2_ISBN, user2_user2_id, library2_lib_code)
    VALUES ('$ISBN', '$user', '$library_code')";
    echo"Transfer Initaited";
}



$r = mysqli_query($conn, $result)
or die(mysqli_error($conn));

mysqli_free_result($result);
mysqli_close($conn);

?>

<p>
<hr>

<p>
<a href="main.html"> Back to Main Page</a>	 
 
</body>
</html>