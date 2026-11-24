FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY index.html 404.html robots.txt sitemap.xml llms.txt \
     favicon.ico favicon.svg apple-touch-icon.png og-image.png \
     Gotzon_Viteri_CV.pdf \
     /usr/share/nginx/html/

EXPOSE 80
