# Usa a imagem oficial do Python como base
FROM python:3.9

# Define o diretório de trabalho no container
WORKDIR /app

# Copia o requirements.txt e instala as dependências
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código da aplicação Flask para o container
COPY . .

# Expondo a porta 5000 para a aplicação Flask
EXPOSE 5000

# Define o comando para iniciar o servidor Flask
CMD ["flask", "run", "--host=0.0.0.0"]
