
function dist(x, y)
    d = x^2 + y^2
    return sqrt(d)
end

#Fonction pour lire un fichier
function lire_fichier(nom::String)

  compteurligne =0 
file = open(nom)
    x=readline(file)  
    x=readline(file)
    r=parse(Int64,SubString(x,8))
    x=readline(file)
    s=parse(Int64,SubString(x,7))
    x=readline(file)
    m = Vector{Float64}[]

    tab::Vector{Float64} = []
    for ln in eachline(file)
    compteurligne += 1
    compteur_colonne=0
    for p in ln
      compteur_colonne +=1
    if p=='@'
    
       push!(tab,0) 
        elseif p=='.' || p=='W' || p=='S' || p=='T'
        push!(tab,dist(compteurligne,compteur_colonne))
        
      
       end
       
        end
       push!(m,tab)
        tab = []
     end
    
       return m
end


function prochain_noeud(dist, tab, nom) #fontion qui retourne l'indice du noeud qui la distance minimum (le prochain noeud a visiter) 
   graph =lire_fichier(nom) 
  
    min = Inf  # on initialise la distance minimum distance pour le prochain noeud a visiter
    
    ind = 0 #on initialise l'indice de depart
    
    for i in 1:size(graph)[1]
        if dist[i] < min && tab[i] == false
            min = dist[i]
            ind = i
        end
    end
    

    
    return ind 
end

function court_chemin(depart::Int64,fin::Int64,nom::String)

    println("le noeud de depart est", depart)
    
     println("le noeud de fin est",fin)
    
  graph=lire_fichier(nom)
   
    
    Est_visite = [false for i in 1:size(graph)[1]] # on initialise les noeuds visités 
    distance = [Inf for i in 1:size(graph)[1]] # on initialise les distances parcourues
    distance[depart] = 0 # on initialise la distance du noeud de depart 
    
    chemin::Vector{Int64}= []#tableau avec le chemin parcouru jusqu'au noeud de fin 

    i::Int64=1
    while i <= size(graph)[1]

        #  on choisit le prochain noeud a parcourir
        x = prochain_noeud(distance, Est_visite,nom) 
          push!(chemin,x)
          
        if x!=fin 
        
  
        # On calcule les nouvelles distances 
        for j in 1:size(graph)[1]
            if graph[x][j] > 0 && Est_visite[j] == false && distance[j] > distance[x] + graph[x][j]
                distance[j] = distance[x] + graph[x][j]
            end
        end 
        
       # println("les nouvelles distances sont", distance)

        Est_visite[x] = true 
        i= i+1
        
        else
        println("le chemin a parcourir est \n", chemin)
        println("la distance a parcourir est", distance[x])
        i = size(graph)[1]+1
        end
    end
   
   
end




