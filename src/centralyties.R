# centralities
# importa o arquivo com os cálculos de node degree e betweenness
centrality_df <- read.csv("bd_networks/v4/node_attr_networks4_union_main.csv", sep = ",", header = TRUE)

hist(centrality_df$Betweenness.unDir)

summary(centrality_df$Betweenness.unDir)

between_log <- log2(centrality_df$Betweenness.unDir)
between_log[is.infinite(between_log)] <- 0

plot(centrality_df$Betweenness.unDir, between_log)
summary(between_log)
plot(centrality_df$Degree.unDir, between_log)


summary(centrality_df$Degree.unDir)

hist(centrality_df$Degree.unDir)
hist(centrality_df$Betweenness.unDir)


plot(centrality_df$Degree.unDir, centrality_df$Betweenness.unDir)

hip <- sqrt(centrality_df$Degree.unDir**2 + centrality_df$Betweenness.unDir**2)

centrality_df <- data.frame(centrality_df, hip)

top10_df <- centrality_df[order(centrality_df$hip, decreasing = TRUE), ]
top10_df <- top10_df[top10_df$diff_expressed == "true", ]
top10_df <- top10_df[1:10, ]
prop_max <- top10_df$hip/max(top10_df$hip)*100

data.frame(top10_df$alias_a, prop_max)

plot(density(centrality_df$Degree.unDir))
plot(density(centrality_df$Betweenness.unDir))
hist(log2(centrality_df$Betweenness.unDir))
plot(density(log2(centrality_df$Betweenness.unDir)))

top_df <- centrality_df[order(centrality_df$hip, decreasing = TRUE), ]
top10_df <- top10_df[top10_df$diff_expressed == "true", ]
top10_df <- top10_df[1:10, ]
prop_max <- top10_df$hip/max(top10_df$hip)*100

centrality_df2 <- centrality_df[, c("Degree.unDir", "Betweenness.unDir", "Closeness.unDir", "Stress.unDir", "Eccentricity.unDir", "EigenVector.unDir")]

apoa1_cent <- centrality_df2[which(centrality_df$kegg == "Apolipoprotein A-I"), ]
apoa1_cent

library(purrr)
max_cent <- map_dbl(centrality_df2, max)
median_cent <- map_dbl(centrality_df2, median)

apoa1_cent / max_cent
map(centrality_df2, hist)

hist(1/centrality_df2$EigenVector.unDir)

plot(density(centrality_df2$EigenVector.unDir))
plot(1:nrow(centrality_df2), sort(centrality_df2$EigenVector.unDir))



mean_cent
median_cent

apoa1_cent > median_cent
