# projet-d-info-L3


ALGORITHME DE DIJKSTRA 

Ce programme en Julia permet trouver le plus court chemin entre deux points sur une carte représentée par une matrice  et tracer ce chemin sur un graphique. j'explique ici chaque fontion


Fonction lire_fichier1(nom::String) :
        
  - Cette fonction lit un fichier représentant une carte où chaque caractère représente un type de terrain (par exemple, '@' pour un obstacle,  'W' pour l'eau, '.'    pour un terrain libre etc).
  - Chaque caractère du fichier est remplacé par une valeur numérique correspondant au type de terrain.
        @ = 0
        S = 5
        W = 8 
        T ou . = 1
  - La taille de la matrice  est celle de la carte.

   
Fonction court_chemin1(depart, fin, carte, nom_graph) :
         
   - L'algorithme de Dijkstra est utiliser pour trouver le plus court chemin entre deux points sur la carte.
   - L'utilisateur tape le point de départ et d'arrivée, le nom de la carte et aussi le nom qu'il souhaite pour le graphique.
   - On construit la matrice de la carte grace a la fontion lire_fichier1
   - On initialise toutes les variables nécessaires à l'algorithme (
        distance =
        file de priorité =
        sens =
        taille =
     
        Elle explore les voisins du point de départ en mettant à jour les distances et en choisissant les chemins les plus courts.
        Elle reconstruit le chemin à partir des distances calculées.
        Elle renvoie le chemin trouvé ainsi que la distance totale du chemin.

    
Fonction tracer_graphe_chemin1(graph, chemin, nom_graph) :
        Cette fonction trace le graphique représentant la carte ainsi que le chemin trouvé.
        Elle utilise la bibliothèque Plots pour créer un graphique à partir de la matrice représentant la carte.
        Elle trace le chemin sur le graphique en reliant les points consécutifs du chemin avec des lignes rouges.
        Elle marque le point de départ en vert et le point d'arrivée en bleu.
        Elle enregistre le graphique dans un fichier avec le nom spécifié.

   
Fonction tracer_court_chemin1(depart, fin, carte, nom_graph) :
        Cette fonction est une fonction utilitaire qui appelle les autres fonctions pour trouver le plus court chemin et tracer le graphique.
        Elle appelle d'abord court_chemin1 pour trouver le chemin et la distance.
        Si un chemin est trouvé, elle appelle ensuite tracer_graphe_chemin1 pour tracer le graphique.
        Elle affiche également la distance et le chemin trouvés.

En résumé, ce programme prend une carte représentée par une matrice, trouve le plus court chemin entre deux points à l'aide de l'algorithme de Dijkstra, et trace ce chemin sur un graphique.
