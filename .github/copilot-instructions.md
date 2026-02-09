# Copilot Instructions for al-folio Academic Portfolio

This is a Jekyll-based academic portfolio site using the [al-folio](https://github.com/alshedivat/al-folio) theme.

## Development Workflow

```bash
# Preferred: Docker-based development (runs on port 8080)
docker compose pull && docker compose up

# Legacy: Local Ruby/Jekyll setup
bundle install && bundle exec jekyll serve --lsi
```

## Project Architecture

| Directory                  | Purpose                                             |
| -------------------------- | --------------------------------------------------- |
| `_bibliography/papers.bib` | Publications in BibTeX format                       |
| `_pages/`                  | Main site pages (about.md is homepage)              |
| `_news/`                   | News announcements shown on homepage                |
| `_projects/`               | Project showcase items                              |
| `_posts/`                  | Blog posts (format: `YYYY-MM-DD-title.md`)          |
| `_data/`                   | YAML data files for CV, coauthors, venues           |
| `_config.yml`              | Site configuration (rebuild required after changes) |

## Adding Publications

Add entries to `_bibliography/papers.bib` with these al-folio-specific fields:

```bibtex
@inproceedings{key2024,
  abbr        = {EMNLP},           # Conference badge (links via _data/venues.yml)
  bibtex_show = {true},            # Show BibTeX toggle
  selected    = {true},            # Show on homepage "Selected Publications"
  arxiv       = {2410.06524},      # ArXiv link
  pdf         = {https://...},     # Direct PDF link
  video       = {https://...},     # Video presentation link
  code        = {https://...},     # Code repository
  abstract    = {...},             # Abstract text
  preview     = {image.png},       # Thumbnail in /assets/img/publication_preview/
}
```

Author highlighting: Names matching `scholar.last_name: [Gor]` and `scholar.first_name: [Maharshi]` in `_config.yml` are automatically underlined.

Coauthor auto-linking: Add entries to `_data/coauthors.yml` to auto-link collaborators to their pages.

## Adding News

Create markdown files in `_news/` with format `YYYY_event_name.md`:

```yaml
---
layout: post
date: 2024-09-21
inline: true # Displays directly on page (false = links to separate page)
---
Your news content with **markdown** support.
```

## Adding Projects

Create files in `_projects/` with project front matter:

```yaml
---
layout: page
title: Project Name
description: Brief description
img: assets/img/project.jpg
importance: 1 # Lower = higher priority
category: work # Category grouping
related_publications: key2024 # Link to bib entries
---
```

## Key Configuration Sections (\_config.yml)

- **Scholar settings**: `scholar.last_name`, `scholar.first_name` for author highlighting
- **Collections**: `announcements.limit` controls homepage news count
- **Optional features**: `enable_math`, `enable_darkmode`, `enable_masonry`
- **Jekyll Scholar**: `source: /_bibliography/`, `bibliography: papers.bib`

## Venue Colors & Links

Define conference colors and URLs in `_data/venues.yml`:

```yaml
"EMNLP":
  url: https://www.aclweb.org/anthology/events/emnlp-2020/
  color: "#00369f" # Optional badge color
```

## Common Patterns

- **Images**: Use `{% include figure.html path="assets/img/..." class="img-fluid" %}`
- **Math**: Enabled by default with MathJax (`enable_math: true`)
- **Social links**: Configure in `_config.yml` (github_username, x_username, etc.)
- **Profile photo**: Place in `assets/img/` and reference in `_pages/about.md`
