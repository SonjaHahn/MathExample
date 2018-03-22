
# Daten eingeben ----------------------------------------------------------

Namen <- c("Nina", "Julia", "Alexander", "Johannes", "Tim", 
           "Leon", "Tobias", "Jonas", "Finn", "Sebastian", 
           "Kim", "Anna", "Sofia", "Jana", "Emma", "Julie", "Paula", 
           "Diana", "Lilly")

Weg <- c(980, 667, 220, 582, 335, 751, 710, 780, 415, 1320, 752, 260, 337, 
         567, 680, 535, 610, 420, 1050)

Geschlecht <- factor(c("w", "w", "m", "m", "m", "m", "m", "m", "m", 
                       "m", NA, "w", "w", "w", "w", "w", "w", "w", "w")) 



# Häufigkeiten ------------------------------------------------------------

table(Geschlecht)
plot(table(Geschlecht))
barplot(table(Geschlecht))
mosaicplot(Geschlecht)

prop.table(table(Geschlecht))
cumsum(table(Geschlecht))
cumsum(prop.table(table(Geschlecht)))

table(Weg)
sort(Weg)
plot(sort(Weg))
stem(Weg)
hist(Weg)

table(cut(Weg, seq(0, 1500, 250)))
table(cut(Weg, seq(0, 1500, 250)), Geschlecht)
addmargins(table(cut(Weg, seq(0, 1500, 250)), Geschlecht))
erg <- addmargins(table(cut(Weg, seq(0, 1500, 250)), Geschlecht))
rownames(erg) <- c("0-250", "250-500", "500-750", "750-1000", "1000-1250", "1250-1500", "Summe")
colnames(erg) <- c("Jungen", "Mädchen", "Summe")
erg

barplot(table(cut(Weg, seq(0, 1500, 250))))
barplot(table(Geschlecht, cut(Weg, seq(0, 1500, 250))))
mosaicplot(table(Geschlecht, cut(Weg, seq(0, 1500, 250))))


# Mittelwerte -------------------------------------------------------------

mean(Weg)
tapply(Weg, Geschlecht, mean)
plot(tapply(Weg, Geschlecht, mean))
barplot(tapply(Weg, Geschlecht, mean))

library("psych") # Funktionen recherchieren
geometric.mean(Weg)
harmonic.mean(Weg)

median(Weg)
quantile(Weg)

# Modalwert (Geschlecht) # Internetrecherche
names(which.max(table(Geschlecht)))

boxplot(Weg)
boxplot(Weg ~ Geschlecht)


# Streuungsmaße -----------------------------------------------------------

range(Weg)
max(Weg)-min(Weg)
IQR(Weg)

sd(Weg)
var(Weg)

# Mittlere Abweichung (Formel erstellen)
mean(abs(Weg-mean(Weg)))
mean(abs(Weg-median(Weg)))

# Variationskoeffizient
sd(Weg)/mean(Weg)



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


