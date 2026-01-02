<?php

namespace App\Controller;

use App\Repository\VoitureRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

final class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(VoitureRepository $voitureRepository): Response
    {
        $voitures = $voitureRepository->findAll();// Récupère toutes les voitures depuis la base de données
        return $this->render('home/index.html.twig', [
            'voitures' => $voitures,
        ]);
    }

    #[Route('/voiture/{id}', name: 'app_voiture_detail', requirements: ['id' => '\d+'])]
    public function detail(int $id, VoitureRepository $voitureRepository): Response
    {
        $voiture = $voitureRepository->find($id);// Récupère la voiture par son ID
        
        if (!$voiture) {
            return $this->redirectToRoute('app_home');
        }
        
        return $this->render('home/voiture.html.twig', [
            'voiture' => $voiture,
        ]);
    }
}
