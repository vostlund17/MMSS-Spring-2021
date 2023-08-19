install.packages("igraph")
library(igraph)

my_nodes <- read.csv("B1G Basketball Nodes.csv")
my_edges <- read.csv("B1G Basketball Edges.csv")

complex_network <- graph_from_data_frame(my_edges, vertices = my_nodes)

library(ggraph)

ggraph(complex_network, layout = "gem") +
  labs(title = "Big Ten Basketball Recruiting Network by State") +
  geom_edge_link(aes(color = Relationship)) +
  geom_node_point(aes(color = Performance, size = Performance)) +
  geom_node_text(aes(label = name), size = 2, color = "Black") +
  # blue grey red // overperformed state underperformed #0096FF #80461B
  scale_colour_manual(values = c("seagreen1", "dodgerblue1", "red")) +
  scale_edge_color_manual(values = c("grey", "grey")) +
  scale_size_manual(values = c(20, 10, 20)) +
  theme_void()

ggraph(complex_network, layout = "gem") +
  labs(title = "Big Ten Basketball Recruiting Network by State") +
  geom_edge_link(aes(color = Relationship)) +
  geom_node_point(aes(color = Performance, size = Performance, shape = Performance)) +
  geom_node_text(aes(label = name, vjust = Performance), color = "Black") +
  # blue grey red // overperformed state underperformed #0096FF #80461B
  scale_colour_manual(values = c("seagreen1", "skyblue", "indianred1")) +
  scale_edge_color_manual(values = c("grey", "grey")) +
  scale_size_manual(values = c(10, 10, 10)) +
  scale_shape_manual(values = c("circle", "square", "circle")) +
  theme_void()

ggraph(complex_network, layout = "gem") +
  labs(title = "Big Ten Basketball Recruiting Network by State") +
  geom_edge_link(color = "gray85") +
  geom_node_point(aes(color = Performance, size = Performance, shape = Performance)) +
  geom_node_text(aes(label = name, vjust = Performance), color = "Black", vjust = -1.7) +
  # blue grey red // overperformed state underperformed #0096FF #80461B
  scale_colour_manual(values = c("seagreen1", "skyblue", "indianred1")) +
  # scale_edge_color_manual(values = c("gray85", "gray85")) +
  scale_size_manual(values = c(10, 5, 10)) +
  scale_shape_manual(values = c("circle", "square", "circle")) +
  theme_void()

# layouts: 'star', 'circle', 'gem', 'dh', 'graphopt', 
#'grid', 'mds', 'randomly', 'fr', 'kk', 'drl', 'lgl'

degree(complex_network)
mean(degree(complex_network))
mean_distance(complex_network, directed = TRUE, unconnected = TRUE)
betweenness(complex_network, directed=F)
transitivity(complex_network, type = "local")