<?php
require 'db_connect.php';

$stmt = $pdo->query("SELECT id_curso, nome FROM curso ORDER BY nome");
$cursos = $stmt->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($cursos);
?>
