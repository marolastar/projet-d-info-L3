
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
        elseif p=='.' || p=='T' || p=='W' || p=='S' 
        push!(tab,dist(compteurligne,compteur_colonne))
        
      
       end
       
        end
       push!(m,tab)
        tab = []
     end
    
       return m
end


