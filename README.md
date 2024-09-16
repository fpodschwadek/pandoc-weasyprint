# Pandoc/Weasyprint

This is a utility container image based on the [pandoc/latex image](https://hub.docker.com/r/pandoc/latex) with the [alpine wasyprint package](https://pkgs.alpinelinux.org/package/edge/community/x86/weasyprint) and some additional fonts installed (using the same fonts as the [docker-wkhtmltopdf image by Surnet](https://github.com/Surnet/docker-wkhtmltopdf/blob/master/Dockerfile-alpine.template)).

What I wanted was the option to use CSS to quickly format the PDF output -- of course that's probably possible with LaTex (probably much better and more fine-grained) but so far I lacked the time to get into that, while I work with CSS for almost twenty years by now.

This thing is in no way perfect, but it allows me to make decently layouted PDFs form last minute presentation scripts I originally wrote in Markdown. Maybe can be useful for you too.

To use this container, you can mount a directory containing your markdown file and a CSS file to the container. For example, from your working folder containing these files you could run the following command:

```bash
docker run --rm -v ./:/data --user $(id -u):$(id -g) fpod/docker-weasyprint README.md --pdf-engine=weasyprint --css=/data/styles.css -o talk.pdf
```

Note that you need to replace `README.md`, `styles.css` and `talk.pdf` with your own filenames.

