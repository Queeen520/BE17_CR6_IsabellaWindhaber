<?php

namespace App\Controller;

use App\Entity\EventList;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;


class SortController extends AbstractController
{
    #[Route('/sort', name: 'sort')]

    public function sortByType(ManagerRegistry $doctrine): Response
    {
        $music = $doctrine->getRepository(EventList::class)->findBy(['type' => 'music']);
        $food = $doctrine->getRepository(EventList::class)->findBy(['type' => 'food']);
        $sport = $doctrine->getRepository(EventList::class)->findBy(['type' => 'sport']);



        return $this->render("event/sort.html.twig", [
            'music' => $music,
            'food' => $food,
            'sport' => $sport
        ]);
    }
}
