<?php

namespace App\Controller;

use App\Entity\EventList;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;


class EventController extends AbstractController
{
    #[Route('/event', name: 'event')]
    public function index(ManagerRegistry $doctrine): Response
    {
        $events = $doctrine->getRepository(EventList::class)->findAll();
        return $this->render('event/index.html.twig', [
            'events' => $events
        ]);
    }
}
