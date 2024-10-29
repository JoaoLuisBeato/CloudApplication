# Usa a imagem oficial do Nginx
FROM nginx:latest
#dddd teste
RUN rm /etc/nginx/conf.d/default.conf

# Copia a configuração personalizada do nginx para o container
COPY ./nginx.conf /etc/nginx/nginx.conf


# Copia o arquivo de configuração 'default' para 'sites-available'
COPY ./sites-available/default /etc/nginx/sites-available/default


# Copia os arquivos estáticos do frontend (se houver) para o diretório padrão do Nginx
COPY ./html/ /usr/share/nginx/html

# Expondo a porta 80 para o Nginx
EXPOSE 80

# Comando para iniciar o Nginx
CMD ["nginx", "-g", "daemon off;"]
