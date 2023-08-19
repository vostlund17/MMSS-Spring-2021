# data <- read.csv("B1G.csv", row.names = 1)
# data <- as.matrix(data)
#network <- graph_from_adjacency_matrix(data, mode = "undirected")
#plot(network)


# data2 <- read.csv("B1G B1G B1G.csv", row.names = 1)
# data2 <- as.matrix(data2)

# network2 <- graph_from_adjacency_matrix(data2, mode = "undirected")
#plot(network2)

#mean_distance(network, directed = FALSE)
#betweenness(network)

install.packages("igraph")
library(igraph)

my_nodes <- read.csv("B1G B1G B1G Nodes.csv")
my_edges <- read.csv("B1G B1G B1G Edges.csv")

complex_network <- graph_from_data_frame(my_edges, vertices = my_nodes)

plot(complex_network,
     main = "Big Ten West Football Recruiting Network By State",
     #vertex.color = my_nodes$type,
     #vertex.size = 15,
     #edge.width = my_edges$weight,
     edge.color = "red",
     edge.curved = FALSE)

mean_distance(complex_network)
betweenness(complex_network)

library(ggraph)

ggraph(complex_network, layout = "gem") +
  labs(title = "Big Ten Football West Division Recruiting Network by State") +
  geom_node_point(aes(color = Type), 
                  size = 16) +
  geom_edge_link(aes(alpha = Strength), color = "purple") +
  geom_node_text(aes(label = name), size = 2, color = "white") +
  theme_void()

#Statistics

#Average Path Length
mean_distance(complex_network, directed=F)
#Betweenness
betweenness(complex_network, directed=F, weights=NA)
#Global Clustering Coefficient
transitivity(complex_network)
#Average Clustering Coefficient
#Average Degree
mean(degree(complex_network))



# layouts: 'star', 'circle', 'gem', 'dh', 'graphopt', 
#'grid', 'mds', 'randomly', 'fr', 'kk', 'drl', 'lgl'

#Some fun with this: 
  
#https://cran.r-project.org/web/packages/ggraph/vignettes/Edges.html

#https://cran.r-project.org/web/packages/ggraph/vignettes/Nodes.html

#https://cran.r-project.org/web/packages/ggraph/vignettes/Layouts.html