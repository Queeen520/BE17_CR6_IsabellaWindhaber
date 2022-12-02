<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DetailsController extends AbstractController
{
    #[Route('/details/{id}', name: 'details')]
    public function moreEvent(): Response
    {
        return $this->render('event/index.html.twig', [
            'controller_name' => 'DetailsController',
        ]);
    }
}
