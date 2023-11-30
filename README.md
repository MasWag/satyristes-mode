Satyristes Emacs Package
========================

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](./LICENSE)

This Emacs package provides enhanced support for editing Satyristes files, used in the [Satyrographos](https://github.com/na4zagin3/satyrographos) package management system for [SATySFi](https://github.com/gfngfn/SATySFi). The package includes a major mode for Satyristes (`satyristes-mode`), a `company-mode` backend for auto-completion (`company-satyristes`), and Eldoc support (`eldoc-satyristes`) to facilitate a productive editing experience in Emacs.

Features
--------

- **Satyristes Mode (`satyristes-mode.el`)**: A major mode for editing Satyristes files, providing syntax highlighting and other language-specific features.
- **Company Backend (`company-satyristes.el`)**: Auto-completion support for Satyristes keywords and constructs within Emacs.
- **Eldoc Support (`eldoc-satyristes.el`)**: Real-time, in-buffer documentation display for Satyristes keywords.

Requirements
------------

- **Emacs**: Version 25.1 or higher.
- **External Packages**:
  - `company-mode`: For auto-completion support.
  - `eldoc`: For displaying inline documentation.

Installation and Setup
----------------------

### Using `use-package`

The configuration of Satyristes package with `use-package` is as follows:

```elisp
(use-package satyristes-mode
  :ensure nil  ; The mode is not on MELPA
  :load-path "/path/to/satyristes-mode")  ; Specify the path to satyristes-mode.el

(use-package company-satyristes
  :ensure nil
  :init
  (use-package company
    :ensure t
    :config
    (global-company-mode))
  :config
  (add-to-list 'company-backends 'company-satyristes))

(use-package eldoc-satyristes
  :ensure nil
  :after (eldoc satyristes-mode))
```

Replace `"/path/to/satyristes-mode"` with the actual path to the `satyristes-mode.el` file on your system.
