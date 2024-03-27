using Plots

#Fonction pour lire un fichier

function lire_fichier2(nom::String)

  compteurligne =0
  
  file = open(nom)
  
    x=readline(file)  
    
    x=readline(file)
    r=parse(Int64,SubString(x,8))
    
    x=readline(file)
    s=parse(Int64,SubString(x,7))
    x=readline(file)
    

    tab= Matrix{Int64}(undef, s, r)
    
    for ln in eachline(file)
    	
    	compteurligne += 1
    	compteur_colonne=0
    	
    	for p in ln
      	    
      	    compteur_colonne +=1
            
            if p=='@'
     
               tab[compteurligne,compteur_colonne] = 0
        	
        	elseif p=='S' 
         	       
         	     tab[compteurligne,compteur_colonne] = 5
          
         	     elseif  p=='W'
                         
                         tab[compteurligne,compteur_colonne] = 8
        
                         elseif p=='.' || p=='T' 
                                
                               tab[compteurligne,compteur_colonne] = 1
        
 
              end
       
        end
        
     
     end
    
     return tab
     
end




function court_chemin2(depart, fin, carte,nom_carte)

    dx, dy = depart #un tuple contenant les coordonnées du point de départ sur la carte
    
    graph=lire_fichier2(carte) # on lit la carte
     
     if graph[dx, dy] == 0# pas de chemin si le point de depart est un obstacle.
        
        println("Le point de départ est un obstacle, pas de chemin.")
        return [], typemax(Int)
    
    end
    
    fx, fy = fin #un tuple contenant les coordonnées du point de départ sur la carte
    
    taille = size(graph,1) #on recupere la taille de la matrice graph
    

    sens = [(0, 1), (1, 0), (-1, 0), (0, -1)] #Initialisation du tableau pour se deplacer de voisin en voisin

    distance = fill(typemax(Int), taille, taille) # fill est une fonction qui creer une matrice avec tous les elements initialisé a l'infini
    
    distance[dx, dy] = 0 #le point de depart dans a une distance de 0 initialement

    file_priorite = [(dx, dy, 0)] #la file de priorité des points à visiter avec avec leur distance actuelle, ici on l'initialise avec le point de depart avec 0

    while !isempty(file_priorite)
    
        dx, dy, poid = popfirst!(file_priorite) # on extrait le premier element de la file
        
        if (dx, dy) == fin # si cet element est la fin on arrete le programme
            
            break
            
        end

        
        for (x, y) in sens #pour chaque voisin du point extrait, on met a jour les distance si ce voisin est valide 
            
            nx, ny = dx + x, dy + y
            
            if 1 <= nx <= taille && 1 <= ny <= taille && graph[nx,ny] != 0 #validité
                
                new_poid = poid + graph[nx,ny]
                
                if new_poid < distance[nx, ny]
                    
                   distance[nx, ny] = new_poid 
                    # Calcul de l'estimation du coût restant à partir du voisin jusqu'à la fin (heuristique)
                    estimee_restante = abs(nx - fx) + abs(ny - fy)
                    push!(file_priorite, (nx, ny, new_poid + estimee_restante))
                    sort!(file_priorite, by=x->x[3]) # tri de la file de priorité selon le coût total
               
                
                end
            
            end
        
        end
    
    end

    if distance[fx, fy] == typemax(Int) # si la distance du depart a la fin reste inchangée alors aucun chemin n'a eté trouvé.
    
        println("Pas de chemin trouvé.")
        
        return [], typemax(Int)
        
    end

    chemin = [(fx,fy)]
    
    
    while fin != depart # restitution du chemin trouvé
    
        for (x, y) in sens
        
            nx, ny = fin[1] - x, fin[2] - y
            
            if 1 <= nx <= taille && 1 <= ny <= taille && distance[nx, ny] < distance[fin[1], fin[2]]
                pushfirst!(chemin, (nx, ny))
                fin = (nx, ny)
                break
            
            end
            
        end
    
    end
    
    
    # Calculer la distance totale du chemin parcouru
    distance_totale = distance[fx,fy]
    println(distance_totale)
   
     # Retourner à la fois le chemin et la distance totale
    return chemin, distance_totale

end


# Fonction pour tracer le graphe et le chemin

function tracer_graphe_chemin2(graph, chemin, nom_graph)
   
   
    taille = size(graph)[1] # la taille du graphique
    
    x = 1:taille # les graduations sur l'axe x
    
    y = 1:taille # les graduations sur l'axe y

    heatmap(graph, color=:grays, c=:grays, axis=true, xlabel="x", ylabel="y", xticks=x, yticks=y) # creation d'un graph a l'image de la carte

    # Tracer le chemin en rouge
    
    for i in 2:length(chemin) # parcourt chaque paire de points consécutifs dans le chemin fourni et trace un segment entre ces deux points
        
        x1, y1 = chemin[i-1]
        x2, y2 = chemin[i]
        plot!([x1, x2], [y1, y2], color=:red, lw=2)
    
    end

    # Marquer le point de départ et d'arrivée
    
    scatter!([chemin[1][1]], [chemin[1][2]], color=:green, label="Depart")
    
    scatter!([last(chemin)[1]], [last(chemin)[2]], color=:blue, label="Arrivee")

    plot!(legend=:bottomright)
    
    title!("Graphe avec le plus court chemin")

   # Enregistrer le graphique dans un fichier
   
    savefig(nom_graph * ".png")

end


function tracer_court_chemin2(depart, fin, carte, nom_graph)

	(chemin,dist) = court_chemin2(depart, fin, carte, nom_graph) # on calcule le plus court chemin 
	
	if chemin == [] || dist== typemax(Int) 
	    
	    println("pas de chemin a tracer")
	 
	   else
	   
	   graph=lire_fichier2(carte) # on lit la carte
	   
	   tracer_graphe_chemin2(graph, chemin, nom_graph) # on trace le graph
	   
	   
	   println("la distance a parcourir est de ",dist)
	   
	   println("le chemin a parcourir est de ",chemin)
	   
	   println("voir dossier projet d'info pour la representation sous forme de graphique")
	  
	 end

end





