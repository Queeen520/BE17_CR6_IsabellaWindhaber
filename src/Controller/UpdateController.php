<?php

namespace App\Controller;

use App\Entity\EventList;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;

class UpdateController extends AbstractController
{
    #[Route('/update', name: 'update')]
    public function updateEvent($id, Request $request, ManagerRegistry $doctrine): Response
    {
        $event = $doctrine->getRepository(EventList::class)->find($id);
        $form = $this->createForm(EventList::class, $event);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            /*   $picture = $form->get('picture')->getData();

            if ($picture) {
                unlink($this->getParameter('picture_directory') . "/" . $todo->getPicture());
                // unlink( "pictures/".$todo->getPicture());
                $originalFilename = pathinfo($picture->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '.' . $picture->guessExtension();
                try {
                    $picture->move(
                        $this->getParameter('picture_directory'),
                        $newFilename
                    );
                } catch (FileException $e) {
                    // ... handle exception if something happens during file upload
                }

                $todo->setPicture($newFilename);
            }
            */

            $event = $form->getData();
            $doc = $doctrine->getManager();
            $doc->persist($event);
            $doc->flush();

            return $this->redirectToRoute('update');
        }
        return $this->render('event/update.html.twig', [
            "form" => $form->createView()
        ]);
    }
}
