<?php
require 'db_connect.php';

$stmt = $pdo->query("SELECT id_empresa, nome_fantasia, nome_razao FROM empresa ORDER BY nome_fantasia");
$empresas = $stmt->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($empresas);
?>
