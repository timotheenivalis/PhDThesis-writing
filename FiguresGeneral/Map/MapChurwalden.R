library(ggplot2)
library(ggmap)
library(raster)
library(sp)
library(rgdal)
library(RColorBrewer)

setwd(dir = )

cpal <- brewer.pal(n=6, name="Greys")

CH_borders <- getData("GADM", country="CH", level=1)
plot(CH_borders, add=F, xlim=c(8,11), ylim=c(45,48), col=cpal[1])

#Austria Borders>| Replace AT
AT_borders <- getData("GADM", country='AT', level=0)
plot(AT_borders, add=T, col=cpal[2]) # Test: did the download work?

#Lichtenstein Borders>| replace LI
LI_borders <- getData("GADM", country='LI', level=0)
plot(LI_borders, add=T,col=cpal[3])

IT_borders <- getData("GADM", country='IT', level=0)
plot(IT_borders, add=T, col=cpal[4])

DE_borders <- getData("GADM", country='DE', level=0)
plot(DE_borders, add=T, col=cpal[5])

FR_borders <- getData("GADM", country='FR', level=0)
plot(FR_borders, add=T,col=cpal[6])

Sl_borders <- getData("GADM", country='Sl', level=0)

### Map PLOT
##First plot sets the limits of the map!
Main <- plot(CH_borders, lwd=1.5, xlim=c(9,10), ylim=c(45,48), col="gray85", bg="lightblue")
#Plot(AT_borders, add=T, lwd=1.5, col="gray80")
plot(LI_borders, add=T, lwd=1.5, col="gray75")
plot(FR_borders, add=T, lwd=1.5, col="gray70")
plot(DE_borders, add=T, lwd=1.5, col="gray65")
plot(IT_borders, add=T, lwd=1.5, col="gray60")
plot(AT_borders, add=T, lwd=1.5, col="gray55")


####   COUNTRY LABELS
par(cex=1, col="black", font="2", family= "sans")
text("Switzerland", x = 8.3, y = 46.7)
text("Germany", x = 10.15, y = 47.9)
text("France", x = 7.0, y = 47.6)
text("Italy", x = 9.6, y = 45.4)
text("Austria", x = 13.2, y = 47.1)


points(9.55, 46.783333, pch=24, bg="yellow", cex=.7) #Churwalden

north.arrow(xb=6.2, yb=47.8, len=0.05, lab="N", col="black", cex=1.3)
