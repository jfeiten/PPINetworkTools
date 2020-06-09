dir("cache")

library(purrr)
dir("cache/cytoscape")

# Carrega os datasets com as centralidades
e1_df <- read.csv("cache/cytoscape/e1_centrality_default_node.csv")
e2_df <- read.csv("cache/cytoscape/e2_centrality_default_node.csv")
e3_df <- read.csv("cache/cytoscape/e4_centrality_default_node.csv")
e4_df <- read.csv("cache/cytoscape/e5_centrality_default_node.csv")
e5_df <- read.csv("cache/cytoscape/e6_centrality_default_node.csv")
e6_df <- read.csv("cache/cytoscape/e7_centrality_default_node.csv")

# Carrega o dataset com as proteinas codificadas pelos genes da meta-analise de depressao
gwas_df <- read.csv("cache/cytoscape/metaanalise_depre_default_node.csv")

# Recuperar a significancias dos SNPs pela tabela suplementar do artigo 
# Nomear a coluna como gwas_pvalue


# Construir um data.frame unico juntando os datasets de centralidade e o dataset de gwas
# Deve ter as seguintes colunas:
# shared.name, entrez, kegg, bet1, ..., bet6, ecc1, ..., ecc6, eig1, ..., eig6
# studies, diff_expressed, gwas, gwas_pvalue

# renomear as colunas de cada um dos datasets com as convencoes acima
# crie um vetor com todos os identificadores das proteinas e faca com que cada nome apareca apenas uma vez
# exemplo
all_proteins <- c(e1_df$shared.name, e2_df$shared.name)
all_proteins <- unique(all_proteins)

# ordene as colunas


# junte as colunas

# Observacoes:
# Caso a proteina nao esteja na rede, ela nao tera centralidade. Codifique esse caso como um NA.
