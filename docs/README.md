# Hugo site for GrowBeam

This folder contains the [Hugo](https://gohugo.io) source files for the [GrowBeam GitHub Pages site](https://eiaro.github.io/growbeam/).

## Structure

- `content/` – Markdown pages for features, downloads, and homepage
- `themes/` – Contains Ananke theme as Git submodule
- `config.toml` – Hugo configuration (site metadata, menus)
- `static/` – Static files (e.g., images, favicon, robots.txt)
- `public/` – Auto-generated build output (ignored in Git)
- `.github/workflows/` – GitHub Actions for deploying site

## Deployment

- Automatically built and deployed to GitHub Pages via Actions
- Uses Hugo Extended with Ananke theme
- Artifact must be named `github-pages` for successful deploy

## Local development

```bash
cd docs
git submodule update --init --recursive
hugo server -D
