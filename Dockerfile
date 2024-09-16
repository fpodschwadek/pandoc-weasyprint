# Dockerfile for pandoc container weasyprint.
# PROGRESS_NO_TRUNC=1 docker build -f Dockerfile -t fpod/docker-weasyprint --progress plain --no-cache .
# or (if you don't expect any errors during build):
# docker build -f Dockerfile -t fpod/docker-weasyprint --no-cache .
# docker push fpod/docker-weasyprint
FROM pandoc/latex:3

RUN apk add --update --no-cache \
        fontconfig \
        freetype \
        ttf-dejavu \
        ttf-droid \
        ttf-freefont \
        ttf-liberation \
        weasyprint \
    ; \
    # more fonts
    apk add --no-cache --virtual .build-deps \
        msttcorefonts-installer \
    ; \
    # Install microsoft fonts
    update-ms-fonts; \
    fc-cache -f; \
    # Clean up when done.
    rm -rf /tmp/*; \
    apk del .build-deps

