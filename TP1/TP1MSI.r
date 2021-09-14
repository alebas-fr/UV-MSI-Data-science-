# Faire un premier tirage 
# Pour simplifier on ne donne pas de nom aux cartes mais on leur donne un numéro entre 1 et 11
tirage = sample(x=1:11,size=20,replace=T)
print(tirage)

mode(tirage)

moyenneObtenirTouteLesCartes = function(n){
    # Fonction qui calcule combien il faut acheter de boîtes en moyenne pour obtenir toutes les cartes.
    # n représente le nombre de cartes qu'il y a obtenir
    # k représente le nombre de cartes que l'on possède 
    k = 1
    somme1k = 0
    moyenne = 0 # Nombre de boite que l'on doit acheter en moyenne
    while (k<=n){
        somme1k = somme1k + (1/k)
        k = k+1
    }
    moyenne = n*somme1k
    # Une fois que l'on possède le nombre moyen de boîtes qu'il faut acheter il faut arrondir par excès.
    # Car la moyenne et un nombre réel et que le nombre de boîtes est entier.
    moyenne = ceiling(moyenne)
    # Renvoie le nombre de boîtes qu'il faut acheter en moyenne
    return(moyenne)
}
moyenneObtenirTouteLesCartes(11)

# Définir le nombre de tirages que l'on souhaite réaliser
nombreDeTirage = 40

NTest <- function(N){
    # Fonction qui réalise les N tirages aléatoires de carte 
    tirage = sample(x=1:11,size=N,replace = TRUE)
    # On renvoie les N tirages aléatoires
    return(tirage)
}

# On convertit les N tirages aléatoires en numeric
experience = as.numeric(NTest(nombreDeTirage))
print(experience)

# On récupère la date 
Date = Sys.time()
print(Date)

# On crée le frame avec la date et le nombre de tirages
(frame = data.frame(Date,nombreDeTirage))

dataframeDateEtTest = function(N){
    i=1
    date = rep(Sys.time(),N)
    tirages = rep(0,N)
    while (i<=N){
        tirages[i]=sample(x=1:11,size=1)
        date[i]=Sys.time()
        i=i+1
    }
    (df<- data.frame(date,tirages))
    return(df)
}
frame1 = dataframeDateEtTest(30)

print(frame)

print(frame1)

compterValeur = function(tirage){
    # Cette fonction permet de compter combien de fois nous avons chaque carte
    # Utile pour afficher le diagramme en baton
    i=1
    x = rep(0,11)
    while (i<length(tirage)){
        x[tirage[i]] = x[tirage[i]]+1
        i = i+1
    }
    # Renvoyer le vecteur x qui a compté combien de fois nous avons trouvé chaque carte
    return(x)
}

# Afficher le diagramme en bâton plus pratique pour voir combien de fois nous avons chaque carte
barplot(compterValeur(experience))

# Installer le package nécessaire pour pouvoir travailler avec les fichiers excels
install.packages("writexl")

# Sauvegarder le frame dans un fichier excel nommé TP1.xlsx
library("writexl")
write_xlsx(frame1, "TP1.xlsx")
