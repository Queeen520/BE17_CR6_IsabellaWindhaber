<?php

namespace App\Controller;

use App\Entity\EventList;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;


class DetailsController extends AbstractController
{
    #[Route('/details/{id}', name: 'details')]
    public function details($id, ManagerRegistry $doctrine): Response
    {
        $event = $doctrine->getRepository(EventList::class)->find($id);

        return $this->render('event/details.html.twig', [
            "event" => $event
        ]);
    }
}
