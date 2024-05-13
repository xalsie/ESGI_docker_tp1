<?php
    echo "Connexion à la base de données";
    define("DB_DRIVER", "pgsql");
    define("DB_HOST", "postgres");
    define("DB_NAME", "postgres");
    define("DB_USER", "postgres");
    define("DB_PWD", "postgres");
    define("DB_PORT", "5432");

    try{
        $pdo = new PDO(DB_DRIVER.":host=".DB_HOST.";dbname=".DB_NAME.";port=".DB_PORT, DB_USER, DB_PWD);
    }catch (Exception $e){
        die("Erreur SQL : ".$e->getMessage());
    }

    $sql = "SELECT * FROM authors";

    echo $sql;

    $queryPrepared = $pdo->prepare($sql);
    $queryPrepared->execute();

    $result = $queryPrepared->fetchAll(PDO::FETCH_ASSOC);

    echo "<pre>";
    print_r($result);
    echo "</pre>";
?>