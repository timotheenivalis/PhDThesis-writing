library(ggplot2)
library(ggmap)
library(raster)
library(sp)
library(rgdal)
library(RColorBrewer)

setwd(dir = "D:/Documents/GitHub/PhDThesis-writing/FiguresGeneral/Map/")

cpal <- brewer.pal(n=6, name="Greys")

CH_borders <- getData("GADM", country="CH", level=0)
AT_borders <- getData("GADM", country='AT', level=0)
LI_borders <- getData("GADM", country='LI', level=0)
IT_borders <- getData("GADM", country='IT', level=0)
DE_borders <- getData("GADM", country='DE', level=0)
FR_borders <- getData("GADM", country='FR', level=0)


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
text("Switzerland", x = 8, y = 47)
text("Germany", x = 10.15, y = 47.9)
text("France", x = 6.5, y = 47.6)
text("Italy", x = 9.6, y = 45.4)
text("Austria", x = 13.2, y = 47.1)


points(9.55, 46.783333, pch=24, bg="yellow", cex=1) #Churwalden

library(maps)
map.scale(ratio=F, x=3.8, y=45.7, cex=1,)
detach(package: maps)

library(GISTools)
north.arrow(xb=5.0, yb=46.5, len=0.05, lab="N", col="black", cex=1.3)
detach(package: GISTools)