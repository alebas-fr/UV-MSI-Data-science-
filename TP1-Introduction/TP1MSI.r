# Code réalisé par Alexandre-Lebas le 10/09/2021

# Faire un premier tirage 
# Pour simplifier on ne donne pas de nom aux cartes mais on leur donne un numéro entre 1 et 11
tirage = sample(x=1:11,size=20,replace=T)
print(tirage)

mode(tirage)


# Question 1 :

# Utilisation d'une formule mathématique
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


# Utilisation de la méthode vue en cours

nombreDeTirageNecessairePourAvoirTout = function(nombreDeCartes = 11){
    # Calcule combien de tirage son nécessaire pour obtenir toutes les cartes
    # nombreDeCartes représente le nombre de carte différentes que l'on doit posséder
    tirage = vector() # Représente la carte que l'on tire
    nombreTirages = 0 # Représente le nombre de tirages que l'on a réalisé
    cartes = c() # Cartes que l'on possède
    while (length(cartes)<nombreDeCartes){
        tirage = sample(1:nombreDeCartes,1)
        nombreTirages = nombreTirages+1
        if (!(tirage %in% cartes)){ # Si on ne possède pas encore la carte tirée
            cartes=c(tirage,cartes)
        }
    }
    return (nombreTirages)
}

nombreDeTirageNecessairePourAvoirTout(11)

moyenneDeTiragesPourAvoirTout = function(n,nombreDeCartes = 11){
    # Calcul de la moyenne de tirage que l'on doit réaliser pour avoir toutes les cartes
    # Pour cela on va utiliser n fois la fonction nombreDeTirageNecessairePourAvoirTout(nombreDeCartes)
    somme = 0
    i=1
    while (i<=n){
        somme = somme + nombreDeTirageNecessairePourAvoirTout(nombreDeCartes)
        i=i+1
    }
    # On renvoie la moyenne arrondie  car c'est un nombre réel et que le nombre de boîtes est entier.
    return (ceiling(somme/n))
}
moyenneDeTiragesPourAvoirTout(100)


# Question 2 :

# Définir le nombre de tirages que l'on souhaite réaliser
nombreDeTirage = 50

NTest <- function(N){
    # Fonction qui réalise les N tirages aléatoires de carte 
    tirage = sample(x=1:11,size=N,replace = TRUE)
    # On renvoie les N tirages aléatoires
    return(tirage)
}

# On convertit les N tirages aléatoires en numeric
experience = as.numeric(NTest(nombreDeTirage))
print(experience)

# Question 3 :

# On récupère la date 
Date = Sys.time()
print(Date)

# On crée le frame avec la date et le nombre de tirages
(frame = data.frame(Date,nombreDeTirage))

# Réalisation d'une frame avec la date et l'heure pour chaque tirage
dataframeDateEtTest = function(N){
    # N represente le nombre de tirage que l'on souhaite réalisé
    i=1
    date = rep(Sys.time(),N)
    tirage = rep(0,N)
    while (i<=N){
        tirage[i]=sample(x=1:11,size=1)
        date[i]=Sys.time()
        i=i+1
    }
    (df<- data.frame(date,tirage))
    return(df)
}
frame1 = dataframeDateEtTest(nombreDeTirage)


# Question 4 :

print(frame)

print(frame1)


# Question 5 :

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


# Question 6 :

# Installer le package nécessaire pour pouvoir travailler avec les fichiers excels
install.packages("writexl")

# Sauvegarder le frame dans un fichier excel nommé TP1.xlsx
library("writexl")
write_xlsx(frame1, "TP1.xlsx")
