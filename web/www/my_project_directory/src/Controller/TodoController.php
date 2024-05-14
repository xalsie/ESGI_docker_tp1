<?php

namespace App\Controller;

use App\Repository\TodoRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TodoController extends AbstractController {
    #[Route('/', name: 'index')]
    public function index(
        TodoRepository $TodoRepository
    )
    : Response {

        return $this->render(
            'todo.html.twig',
            [
                'todos' => $TodoRepository->findAll(),
            ]
        );
    }
}
