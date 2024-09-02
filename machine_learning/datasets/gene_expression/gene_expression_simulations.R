# Definindo os parâmetros
n_genes <- 30  # Número de genes
n_samples <- 100  # Número de amostras
missing_rate <- 0.2  # Taxa de valores ausentes (20%)

# Gerando dados de expressão gênica
expression_data <- matrix(rnorm(n_genes * n_samples), nrow = n_samples)

# Introduzindo valores ausentes
missing_indices <- sample(1:(n_genes * n_samples), size = round(missing_rate * n_genes * n_samples))

# Prefixos e sufixos fictícios para nomes de genes
prefixos <- c("ABC", "DEF", "GHI", "JKL", "MNO", "PQR", "STU", "VXW")
sufixos <- c("A", "B", "G", "D", "E")

# Função para gerar nomes fictícios de genes
gerar_nomes_genes <- function(n) {
  nomes <- character(n)
  for (i in 1:n) {
    prefixo <- sample(prefixos, 1)
    sufixo <- sample(sufixos, 1)
    nomes[i] <- paste(prefixo, sufixo, sep = "_")
  }
  return(nomes)
}

# Gerar 30 nomes fictícios de genes
genes <- gerar_nomes_genes(30)

expression_data[missing_indices] <- NA
colnames(expression_data) <- genes

write.table(expression_data, "gene_expression.txt", sep = "\t", col.names = T)
