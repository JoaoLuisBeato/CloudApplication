# Usando uma imagem oficial do Python
FROM python:3.9-slim

# Definindo o diretório de trabalho dentro do container
WORKDIR /app

# Instalando Flask e o MySQL Connector diretamente no Dockerfile
RUN pip install flask mysql-connector-python flask-cors

# Copiando o código da aplicação Flask para o container
COPY . .

# Expondo a porta 5000 para acessar o Flask
EXPOSE 5000

# Comando para rodar a aplicação Flask com Gunicorn
CMD ["flask", "run", "--host=0.0.0.0"]

