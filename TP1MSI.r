tirage = sample(x=1:11,size=20,replace=T)
print(tirage)

mode(tirage)

nombreDeTirage = 30

NTest <- function(nombreTirage){
    tirage = sample(x=1:11,size=nombreTirage,replace = TRUE)
    return(tirage)
}

experience = as.numeric(NTest(nombreDeTirage))

Date = Sys.Date()
print(Date)

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
    return(x)
}

barplot(compterValeur(experience))

install.packages("writexl")

library("writexl")
write_xlsx(frame, "TP1.xlsx")


