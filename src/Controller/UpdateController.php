<?php

namespace App\Controller;

use App\Entity\EventList;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\String\Slugger\SluggerInterface;

class UpdateController extends AbstractController
{
    #[Route('/update', name: 'update')]
    public function updateEvent($id, Request $request, ManagerRegistry $doctrine, SluggerInterface $slugger): Response
    {
        $event = $doctrine->getRepository(EventList::class)->find($id);
        $form = $this->createForm(EventList::class, $event);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $picture = $form->get('picture')->getData();

            if ($picture) {
                // unlink($this->getParameter('picture_directory') . "/" . $event->getPicture());
                unlink("pictures/" . $event->getPicture());
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

                $event->setPicture($newFilename);
            }


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
