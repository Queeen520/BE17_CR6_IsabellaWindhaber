<?php

namespace App\Controller;

use App\Entity\EventList;
use App\Form\EventType;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\String\Slugger\SluggerInterface;


class CreateController extends AbstractController
{
    #[Route('/create', name: 'create')]
    public function createEvent(Request $request, ManagerRegistry $doctrine, SluggerInterface $slugger): Response
    {
        $event = new EventList();
        $form = $this->createForm(EventList::class, $event);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // $form->getData() holds the submitted values
            // but, the original `$task` variable has also been updated
            $event = $form->getData();
            $picture = $form->get('picture')->getData();

            if ($picture) {
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

            $em = $doctrine->getManager();

            $em->persist($event);
            $em->flush();

            return $this->redirectToRoute('create');
        }


        return $this->render('event/create.html.twig', [
            "form" => $form->createView()
        ]);
    }
}
