<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class UpdateController extends AbstractController
{
    #[Route('/update', name: 'update')]
    public function updateEvent(): Response
    {
        return $this->render('event/index.html.twig', [
            'controller_name' => 'UpdateController',
        ]);
    }
}
