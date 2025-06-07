**Project Title**


A lightweight, styled LaTeX template for creating a small nonfiction bilingual math explainer book (Korean-English) in a compact 4.25" × 6.87" format. Includes structured front matter, clean main content layout, image support, and polished back matter for publication readiness. (4.25" × 6.87"). Includes front matter, main content chapters, back matter, and support for images and custom headers/footers.

> 📁 **Repository Summary**: This repo is for collaboratively writing and publishing a bilingual (Korean-English) nonfiction book that interprets and explains mathematical concepts using LaTeX.


---

## Table of Contents

- [Table of Contents](#table-of-contents)
- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Customizing the Template](#customizing-the-template)
- [Directory Structure](#directory-structure)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

This repository contains a LaTeX document class (`book`) configuration optimized for a compact, styled nonfiction book. It sets up page geometry, typography, headers/footers, and placeholders for images, chapters, and back matter.

## Features

* **Compact Page Size**: 4.25in × 6.87in, suitable for pocket-sized printing.
* **Styled Headers/Footers**: Custom page numbering, chapter & section titles.
* **Front/Back Matter**: Title page, copyright, TOC, about the author, acknowledgements, appendix, index.
* **Image Support**: Sample `figure` environment placeholders.
* **No Indent, Spaced Paragraphs**: Using `parskip` for readability.
* **Clickable Links**: Via `hyperref`.

## Prerequisites

* A modern LaTeX distribution (TeX Live, MiKTeX, etc.)
* `pdflatex` or equivalent engine
* Packages:

  * `geometry`
  * `graphicx`
  * `fancyhdr`
  * `microtype`
  * `parskip`
  * `hyperref`
  * `lipsum` (optional, for placeholder text)

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/JaehoonSong12/ydjs-publish.git
   cd ydjs-publish
   ```
2. Place your content and images in the project directory.

## Usage

Compile the `main.tex` (or whatever the `.tex` file is named) with your LaTeX engine:

```bash
pdflatex main.tex
bibtex main        # if you have bibliography entries
pdflatex main.tex  # run twice for TOC and references
```

This generates `main.pdf` suitable for printing or digital distribution.

## Customizing the Template

* **Page Size & Margins**: Edit the `geometry` options in the preamble.
* **Headers/Footers**: Tweak `fancyhdr` settings (`fancyhead`, `fancyfoot`, etc.).
* **Title & Author**: Change the title page chapter and author fields.
* **Chapters & Sections**: Add or remove `\chapter{}` and `\section{}` blocks.
* **Images**: Replace `example-image` with your own filenames and adjust `width`.

## Directory Structure

```text
├── images/             # store graphic files here
├── main.tex            # primary LaTeX source
├── bibliography.bib    # bibliography (optional)
├── README.md           # this documentation
└── LICENSE             # project license
```

## Contributing

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/YourFeature`).
3. Make your changes and commit (`git commit -m "Add feature"`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
