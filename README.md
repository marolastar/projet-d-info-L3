# projet-d-info-L3


ALGORITHME DE DIJKSTRA 

Ce programme en Julia permet trouver le plus court chemin entre deux points sur une carte représentée par une matrice  et tracer ce chemin sur un graphique. j'explique ici chaque fontion


Fonction lire_fichier1(nom::String) :
        
  - Cette fonction lit un fichier représentant une carte où chaque caractère représente un type de terrain (par exemple, '@' pour un obstacle,  'W' pour l'eau, '.'    pour un terrain libre etc).
  - Chaque caractère du fichier est remplacé par une valeur numérique correspondant au type de terrain.
       -  @ = 0
       -  S = 5
       - W  = 8 
       - T ou . = 1
  - La taille de la matrice  est celle de la carte.

   
Fonction court_chemin1(depart, fin, carte, nom_graph) :
         
   - L'algorithme de Dijkstra est utiliser pour trouver le plus court chemin entre deux points sur la carte.
   - L'utilisateur tape le point de départ et d'arrivée, le nom de la carte et aussi le nom qu'il souhaite pour le graphique.
   - On construit la matrice de la carte grace a la fontion lire_fichier1
   - On initialise toutes les variables nécessaires à l'algorithme (
        distance =  matrice d'entier qui contient les distances evolutives des différents points 
        file de priorité = la file avec les prochains points a traiter
        sens = tableau pour se deplacer de voisins en voisins
        taille = la taille de la matrice de la carte
   - On explore au fur a mesure les voisins du point de depart en s'assurant de la mise a jour des distances et on recupere les points ayant les plus courtes    distances
  - On reconstruit le chemin a partir des distances calculées et on renvoie le chemin trouvé et la distance totale du chemin.

  
Fonction tracer_graphe_chemin1(graph, chemin, nom_graph) :

  - Cette fonction utilise la bibliotheque Plots pour tracer le graphique représentant la carte ainsi et le chemin trouvé.
  - On trace le chemin en reliant progressivement les points par des segments
  - Le chemin est en rouge, le point de depart en vert et le point d'arrivée en bleu
  - On enregistre le graphique concu dans un fichier avec le nom donnen paramètre de la fonction
    

   
Fonction tracer_court_chemin1(depart, fin, carte, nom_graph) :
        
   - Cette fonction relie toutes les autres fonctions pour trouver le plus court chemin et tracer le graphique.
   - Elle appelle d'abord court_chemin1 pour trouver le chemin et la distance.
   - Si un chemin est trouvé, elle appelle ensuite tracer_graphe_chemin1 pour tracer le graphiphe et affiche également la distance et le chemin trouvé.


ALGORITHME A*

Tout comme Dijkstra, l'algorithme A* sert a trouver le plus court chemin entre 2 points sur une carte donné par l'utilisateur. IL est similaire a l'algoritme  de Dijkstra expliqué en dessus. La difference se situe au niveau du calcul de la distance des points parcouru. On rajoute une heuristique pour estimer le coût restant jusqu'àu point final. Ainsi, l'algorithme A* explore d'abord les nœuds qui semblent les plus prometteurs en termes de coût total estimé, ce qui lui permet de trouver plus efficacement le chemin optimal vers la destination.


