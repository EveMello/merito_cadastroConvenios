<?php
require 'db_connect.php';

// Verifica se o formulário foi enviado
if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $data_inicio = $_POST['data_inicio'] ?? null;
    $data_fim = $_POST['data_fim'] ?? null;
    $status = $_POST['status'] ?? 'Ativo';
    $observacao = $_POST['observacao'] ?? null;
    $idempresa = $_POST['idempresa'] ?? null;
    $idcurso = $_POST['idcurso'] ?? null;

    if ($data_inicio && $data_fim && $idempresa && $idcurso) {
        try {
            $sql = "INSERT INTO convenio (data_inicio, data_fim, status, observacao, idempresa, idcurso)
                    VALUES (:data_inicio, :data_fim, :status, :observacao, :idempresa, :idcurso)";
            
            $stmt = $pdo->prepare($sql);
            $stmt->execute([
                ':data_inicio' => $data_inicio,
                ':data_fim' => $data_fim,
                ':status' => $status,
                ':observacao' => $observacao,
                ':idempresa' => $idempresa,
                ':idcurso' => $idcurso
            ]);

            echo "<script>
                alert('Convênio cadastrado com sucesso!');
                window.location.href='cadastro_convenio.html';
            </script>";

        } catch (PDOException $e) {
            echo "Erro ao inserir convênio: " . $e->getMessage();
        }
    } else {
        echo "Preencha todos os campos obrigatórios!";
    }
} else {
    echo "Método inválido.";
}
?>
