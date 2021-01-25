<?php

namespace Http;
use \Services\DatabaseConnector;
use \Models\Ticket;

class TicketController {
    protected \Twig\Environment $twig;
    protected \Doctrine\DBAL\Connection $db;

    public function __construct() {
        $loader = new \Twig\Loader\FilesystemLoader(__DIR__ . '/../../resources/templates');
        $this->twig = new \Twig\Environment($loader);
        $this->db = DatabaseConnector::getConnection();
        if(!isset($_SESSION['user'])){
            $_SESSION['user']='';
        }
    }
}