<?php

$host = 'vps1.dba-training.online';
$user = 'sql-basis';
$password = 'sql-basis';
$database = 'mhl_database';

$id = 9;

echo "MySQL PDO Query: ";

try {

     $pdo = new PDO("mysql:host=$host;dbname=$database", $user, $password);

     $sql = 'select * from mhl_suppliers where id = :id';

     // prepare for execution of the stored procedure
     $stmt = $pdo->prepare($sql);

     // pass value to the command
     $stmt->bindParam(':id', $id, PDO::PARAM_INT);

     // execute the query
     $stmt->execute();
     $data = $stmt->fetchAll();

     foreach($data as $row) {
        
        echo $row["name"] . "\n";
     }
        
     

} catch (PDOException $e) {
    die("Error occurred:" . $e->getMessage());
}