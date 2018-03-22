
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


# Haeufigkeiten -----------------------------------------------------------

table(Weg)
# Klassifizieren
c(0, 500, 1000, 1500)
table(cut(Weg, c(0, 500, 1000, 1500)))
barplot(table(cut(Weg, c(0, 500, 1000, 1500))))
hist(Weg, c(0, 500, 1000, 1500), main="Weglängen")
stem(Weg)

table(Geschlecht)
barplot(table(Geschlecht))

table(cut(Weg, c(0, 500, 1000, 1500)), Geschlecht)


# Mittelwerte -------------------------------------------------------------

mean(Weg)
median(Weg)

tapply(Weg, Geschlecht, mean)
barplot(tapply(Weg, Geschlecht, mean))

library("psych")
harmonic.mean(Weg)
geometric.mean(Weg)

names(which.max(table(Geschlecht)))



# Boxplots ----------------------------------------------------------------

boxplot(Weg)
boxplot(Weg~Geschlecht)

quantile(Weg)

# Streuungsmaße -----------------------------------------------------------

range(Weg)
max(Weg)-min(Weg)

sd(Weg)
var(Weg)
sqrt(var(Weg))

# Bessere Grafiken --------------------------------------------------------

library("ggplot2")
# http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/

Daten = data.frame(Weg,Geschlecht)

ggplot(Daten, aes(x=Weg, fill = Geschlecht)) +
  #geom_histogram(bins=10) +
  geom_histogram(binwidth = 250, center = 125) + 
  xlab("Weglänge")+
  ylab("Anzahl")+
  theme_bw()
