# Dockerfile for pandoc container weasyprint.
# PROGRESS_NO_TRUNC=1 docker build -f Dockerfile -t fpod/pandoc-weasyprint --progress plain --no-cache .
# or (if you don't expect any errors during build):
# docker build -f Dockerfile -t fpod/pandoc-weasyprint --no-cache .
# docker push fpod/pandoc-weasyprint
FROM pandoc/latex:3

RUN apk add --update --no-cache \
        fontconfig \
        freetype \
        gcc \
        libc-dev \
        lua5.4-dev \
        luarocks \
        pcre-dev \
        ttf-dejavu \
        ttf-droid \
        ttf-freefont \
        ttf-liberation \
        weasyprint \
    ; \
    # More fonts.
    apk add --no-cache --virtual .build-deps \
        msttcorefonts-installer \
    ; \
    # Install microsoft fonts.
    update-ms-fonts; \
    fc-cache -f; \
    # Install Lua packages.
    luarocks-5.4 install lrexlib-pcre; \
    # Clean up when done.
    rm -rf /tmp/*; \
    apk del .build-deps

