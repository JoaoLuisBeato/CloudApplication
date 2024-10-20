# Usa a imagem oficial do Nginx
FROM nginx:latest

# Copia a configuração personalizada do nginx para o container
COPY ./nginx.conf /etc/nginx/nginx.conf

# Copia os arquivos estáticos do frontend (se houver) para o diretório padrão do Nginx
COPY ./static/ /usr/share/nginx/html/

# Expondo a porta 80 para o Nginx
EXPOSE 80

# Comando para iniciar o Nginx
CMD ["nginx", "-g", "daemon off;"]
