<?php

namespace App\Controller;

use App\Entity\EventList;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;

class DeleteController extends AbstractController
{
    #[Route('/delete/{id}', name: 'delete')]
    public function deleteEvent($id, ManagerRegistry $doctrine): Response
    {
        $doc = $doctrine->getManager();
        $event = $doctrine->getRepository(EventList::class)->find($id);
        $doc->remove($event);
        $doc->flush();

        return $this->redirectToRoute("event");
    }
}
