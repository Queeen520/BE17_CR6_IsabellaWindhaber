<?php

namespace App\Controller;

use App\Form\EventType;

use App\Entity\EventList;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;


class CreateController extends AbstractController
{
    #[Route('/create', name: 'create')]
    public function createEvent(Request $request, ManagerRegistry $doctrine): Response
    {
        $event = new EventList();
        $form = $this->createForm(EventList::class, $event);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $event = $form->getData();
            $doc = $doctrine->getManager();

            $doc->persist($event);
            $doc->flush();

            return $this->redirectToRoute('event');
        }
        return $this->render('event/create.html.twig', [
            "form" => $form->createView()
        ]);
    }
}
