<?php


namespace Services;
require_once (__DIR__ . '/../../config/database.php');

class DatabaseConnector {
    static function getConnection() : \Doctrine\DBAL\Connection {
        $connectionParams = [
            'host' => DB_HOST,
            'dbname' => DB_NAME_FF,
            'user' => DB_USER,
            'password' => DB_PASS,
            'driver' => 'pdo_mysql',
            'charset' => 'utf8mb4'
        ];
        try {
            $connection = \Doctrine\DBAL\DriverManager::getConnection($connectionParams);
            $connection->connect();
        } catch (\Doctrine\DBAL\Exception\ConnectionException $e) {
            echo($e->getMessage());
            exit();
        }
        return $connection;
    }

    static function getDb() {
        try {
            $db = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME_FF . ';charset=utf8mb4', DB_USER, DB_PASS);
            $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $db;
        } catch (PDOException $e) {
            showDbError('connect', $e->getMessage());
        }
    }
}
