
# Daten eingeben ----------------------------------------------------------

Namen <- c("Nina", "Julia", "Alexander", "Johannes", "Tim", 
           "Leon", "Tobias", "Jonas", "Finn", "Sebastian", 
           "Kim", "Anna", "Sofia", "Jana", "Emma", "Julie", "Paula", 
           "Diana", "Lilly")

Weg <- c(980, 667, 220, 582, 335, 751, 710, 780, 415, 1320, 752, 260, 337, 
         567, 680, 535, 610, 420, 1050)

Geschlecht <- factor(c("w", "w", "m", "m", "m", "m", "m", "m", "m", 
                       "m", NA, "w", "w", "w", "w", "w", "w", "w", "w")) 
   
            
# Wie kann ich diese Daten auswerten? -------------------------------------
# Wiederholung/Brainstorming an der Tafel



# Bessere Grafiken --------------------------------------------------------

library("ggplot2")
# http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/

Daten = data.frame(Weg,Geschlecht)

ggplot(Daten, aes(x=Weg, fill = Geschlecht)) +
 # geom_histogram(bins=10) + 
  geom_histogram(binwidth = 250, center = 125)
  ylab("Häufigkeit") + 
  xlab("Länge Schulweg in Metern") +
  xlim(0,1500) + 
  scale_fill_manual(values=c("lightblue","salmon"), na.value = 'grey') +
  guides(fill=FALSE) +
  theme_bw()


