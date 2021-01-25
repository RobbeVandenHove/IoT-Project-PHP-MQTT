<?php

require __DIR__ . '/../vendor/autoload.php';
$router = new \Bramus\Router\Router();

// Logic
$router->setNamespace('\Http');

$router->before('GET|POST', '/.*', function () {
    session_start();
});
$router->set404(function() {
    header('Location: /tickets');
    exit();
});

$router->get('/', function() {
    header('Location: home');
    exit();
});

$router->get('/home', 'TicketController@index');
$router->post('/home', 'TicketController@indexForm');
$router->get('/tickets', 'TicketController@tickets');
$router->get('/trade', 'TicketController@trade');
$router->get('/ticket', 'TicketController@individual');
$router->get('/account','TicketController@account');

$router->get('/tickets/festival', 'TicketController@festival');
$router->get('/tickets/concerts', 'TicketController@concert');
$router->get('/tickets/all-tickets', 'TicketController@allTickets');
$router->post('/tickets/filter', 'TicketController@allFilter');
$router->post('/tickets/search', 'TicketController@ticketsSearchRaw');
$router->get('/tickets/search/(\w+)', 'TicketController@ticketsSearch');
$router->get('/tickets/addTicket','TicketController@addTicket');

$router->get('/ticket/id/(\w+)', 'TicketController@individualTicket');

$router->get('/login', 'AuthController@login');
$router->post('/login', 'AuthController@logg');
$router->get('/logout', 'AuthController@logout');
$router->post('/login/register', 'AuthController@register');
$router->post('/addCode','AuthController@addCode');

$router->run();