#Introdução a Linguagem R - Projeto Final
#Projeto Final do módulo
#Criar um dataset com pelo menos cinco colunas numéricas e três categóricas.
#Use as funções de criação de distribuição aleatória, use pelo menos duas
#Grave seu dataset no disco
#Você deverá extrair do dataset:
#Somas e medias das colunas numéricas do dataset usando ??pply



#Variáveis numéricas -> Idade, Salario, Qnt consultas, Qnt exames, Qnt internacoes
#Variáveis categóricas -> Sexo, Estado civil, Cidade de moradia


##===== Criando as variáveis =====##

sexo <- c("Feminino", "Feminino", "Feminino", "Masculino", "Feminino", "Masculino", "Masculino", "Feminino", "Feminino", "Feminino", "Feminino",
          "Masculino", "Masculino", "Feminino", "Feminino", "Feminino", "Masculino", "Feminino", "Masculino", "Masculino", "Masculino", "Feminino",
          "Feminino", "Feminino", "Feminino", "Masculino", "Masculino", "Masculino", "Feminino", "Feminino")

estadocivil <- c("Casado", "Casado", "Solteiro", "Divorciado", "Casado", "Casado", "Divorciado",
                 "Solteiro", "Solteiro", "Solteiro", "Solteiro", "Solteiro", "Solteiro", "Casado", "Casado", "Solteiro",
                 "Solteiro", "Casado", "Casado", "Casado", "Divorciado", "Divorciado", "Solteiro", "Solteiro",
                 "Solteiro", "Casado", "Casado", "Solteiro", "Solteiro", "Solteiro")

cidade <- c("Aracruz", "Linhares", "Aracruz", "Aracruz", "Aracruz", "Colatina", "Colatina", "Colatina",
            "Aracruz", "Aracruz", "Aracruz", "Aracruz", "Aracruz", "Linhares", "Colatina", "Linhares", "Linhares",
            "Linhares", "Linhares", "Colatina", "Colatina", "Linhares", "Linhares", "Colatina", "Aracruz", "Linhares",
            "Colatina", "Colatina", "Colatina", "Colatina")

set.seed(1)
idade <- abs(round(rnorm(30, mean=34, sd=5))) #idade

set.seed(1)
salario <- round(rnorm(30, mean=5000, sd=1000)) #salario

set.seed(1)
qntCO <- abs(round(rnorm(30,mean=10,sd=3))) #quantidade de consultas realizadas

set.seed(1)
qntExames <- abs(round(rnorm(30,mean=10,sd=5))) #quantidade de exames realizados

set.seed(1)
qntInternacao <- abs(round(rnorm(30, mean=5, sd=2))) #quantidade de internacoes


## Criando um dataset ##

tabela <- data.frame(sexo, estadocivil, cidade, idade, salario, qntCO, qntExames, qntInternacao)


## Gravando o DataSetno disco ##
tabela2 <- write.table(tabela, file = "D:\\avaliacao.csv", sep = ",", col.names = TRUE, fileEncoding = "UTF-8")



## Somas e médias das colunas numéricas do dataset ##

apply(tabela[,c("idade", "salario", "qntCO","qntExames", "qntInternacao")], 2, sum) #Calcula a soma para cada coluna

apply(tabela[,c("idade", "salario", "qntCO","qntExames", "qntInternacao")], 2, mean) #calcula a média para cada coluna


## Usar split ##
split(tabela$qntCO, tabela$sexo)


## Graficos ##

#Mostra um gráfico

plot(tabela$idade, tabela$qntCO, main="Gráfico de dispersão", xlab="Idade", ylab="Quantidade de consultas")
boxplot(tabela$qntCO, main="Quantidade de consultas", col="grey")
boxplot(tabela$qntCO ~ tabela$estadocivil,
main = "Quantidade de consultas e Estado civil",
ylab = "Quantidade de consultas",
xlab = "Estado Civil",
col="grey")
        
#Histograma
        
hist(tabela$salario, main="Histograma", xlab="Salario", ylab="Frequencia", col="grey")
hist(tabela$qntCO, main="Histograma", xlab="Quantidade de consultas", ylab="Frequencia", col="grey")

        
        