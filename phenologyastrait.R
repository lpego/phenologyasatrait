### Dummy script
data <- 
    data.frame(sp1 = c(10,12,15,13,10,5), 
               sp2 = c(15,16,15,15,16,16), 
               sp3 = c(0,0,0,20,25,20),
               sp4 = c(5,15,5,1,0,0), 
               sp5 = c(8,10,12,11,8,3), 
               row.names = c("Jan", "Feb", "Mar", "Apr", "May", "Jun")
  )
data

cor(data[, 1], data[, 2], method = "pearson") # pairwise correlation

cor(data, use = "complete.obs", method = "pearson") # correlation matrix

### quick viz 
barplot(as.matrix(data), beside = T, 
        ylab = "# flowers", xlab = "plant species", 
        legend.text = c("Jan", "Feb", "Mar", "Apr", "May", "Jun"))


col <- colorRampPalette(c("blue", "white", "red"))(20)
heatmap(x = cor(data, use = "complete.obs", method = "pearson"), 
        col = col, 
        symm = TRUE, 
        Colv = NA, Rowv = NA, 
        legend = "col")

### 
mean(cor(data, use = "complete.obs", method = "pearson")) # overall mean correlation
rowMeans(cor(data, use = "complete.obs", method = "pearson")) # species-wise correlation mean
# CAUTION: include the ones of the self-correlations
