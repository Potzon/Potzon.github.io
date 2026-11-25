# PaperClaro AI (https://github.com/Potzon/paper-claro-ai) is not copied into this repo: the image fetches
# the release tag below. To publish a newer version, change the tag and rebuild (needs BuildKit, the default
# since Docker 23, and internet access while building).
FROM scratch AS paperclaro
ADD https://github.com/Potzon/paper-claro-ai.git#v1.3 /app

FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY index.html 404.html robots.txt sitemap.xml llms.txt \
     favicon.ico favicon.svg apple-touch-icon.png og-image.png \
     Gotzon_Viteri_CV.pdf \
     /usr/share/nginx/html/

# Only the files the app needs at runtime (no tests, scripts or docs)
COPY --from=paperclaro /app/index.html /app/favicon.svg /app/LICENSE /app/NOTICE /usr/share/nginx/html/paperclaro/
COPY --from=paperclaro /app/dist /usr/share/nginx/html/paperclaro/dist
COPY --from=paperclaro /app/src/app.js /app/src/i18n.js /usr/share/nginx/html/paperclaro/src/

EXPOSE 80
