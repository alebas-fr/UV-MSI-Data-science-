# Faire un premier tirage 
# pour simplifier on ne donne pas de nom aux cartes mais on leur donne un numéro entre 1 et 11
tirage = sample(x=1:11,size=20,replace=T)
print(tirage)

mode(tirage)

# Définir le nombre de tirages que l'on souhaite réaliser
nombreDeTirage = 30

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
Date = Sys.Date()
print(Date)

# On crée le frame avec la date et le nombre de tirages
(frame = data.frame(Date,nombreDeTirage))

print(frame)

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
write_xlsx(frame, "TP1.xlsx")
