<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;


class SortController extends AbstractController
{
    #[Route('/sort', name: 'sort')]

    public function sortByType(ManagerRegistry $doctrine): Response
    {
        $repos = $doctrine->getRepository(EventList::class);

        $music = $repos->findBy(['type' => 'music']);
        $food = $repos->findBy(['type' => 'food']);
        $sport = $repos->findBy(['type' => 'sport']);


        return $this->render("event/sort.html.twig", [
            'music' => $music,
            'food' => $food,
            'sport' => $sport
        ]);
    }
}
