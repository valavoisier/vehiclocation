<?php

namespace App\Controller;

use App\Repository\VoitureRepository;
use Doctrine\ORM\EntityManagerInterface;
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

    #[Route('/voiture/{id}/supprimer', name: 'app_voiture_delete', requirements: ['id' => '\d+'])]
    public function delete(int $id, VoitureRepository $voitureRepository, EntityManagerInterface $entityManager): Response
    {
        $voiture = $voitureRepository->find($id);// Récupère la voiture par son ID
        
        if (!$voiture) {
            return $this->redirectToRoute('app_home');
        }
        
        $entityManager->remove($voiture);// Supprime la voiture de la base de données
        $entityManager->flush();// Exécute la suppression
        
        return $this->redirectToRoute('app_home');
    }
}
