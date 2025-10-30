<?php
header('Content-Type: application/json');

// Conexão com banco
$host = "localhost";
$dbname = "estagio"; 
$username = "root";
$password = "";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao conectar ao banco: '.$e->getMessage()]);
    exit;
}

// Recebe dados do POST
$nome_razao = $_POST['nome_razao'] ?? '';
$nome_fantasia = $_POST['nome_fantasia'] ?? '';
$cnpj = $_POST['cnpj'] ?? '';
$email = $_POST['email'] ?? '';

// Você pode adicionar mais campos se quiser

if(empty($nome_razao)) {
    echo json_encode(['success' => false, 'message' => 'O nome/razão social é obrigatório.']);
    exit;
}

try {
    $stmt = $pdo->prepare("INSERT INTO empresa (nome_razao, nome_fantasia, cnpj, email) VALUES (:nome_razao, :nome_fantasia, :cnpj, :email)");
    $stmt->bindParam(':nome_razao', $nome_razao);
    $stmt->bindParam(':nome_fantasia', $nome_fantasia);
    $stmt->bindParam(':cnpj', $cnpj);
    $stmt->bindParam(':email', $email);
    $stmt->execute();

    $id_empresa = $pdo->lastInsertId();

    echo json_encode(['success' => true, 'id_empresa' => $id_empresa]);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro ao salvar empresa: '.$e->getMessage()]);
}
?>
