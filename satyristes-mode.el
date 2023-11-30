;;; satyristes-mode.el --- Major mode for Satyristes files   -*- lexical-binding:t -*-

;; Copyright (C) 2023 Masaki Waga

;; Maintainer: Masaki Waga
;; Keywords: SATySFi, Satyrographos

;; This file is NOT a part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A major mode for editing Satyristes files used in Satyrographos
;; <https://github.com/na4zagin3/satyrographos>, which is a Package
;; manager for SATySFi <https://github.com/gfngfn/SATySFi>.
;; This mode is compatible with Satyrographos 0.0.2 series.

;;; Code:

(require 'cl-lib)

;; Define Satyristes keywords with their explanations
;; The description is taken form README.md of Satyrographos (https://github.com/na4zagin3/satyrographos)
(defvar satyristes--keywords-alist
  '(("version" . "Shows the file is for Satyrographos series, specifying the version")
    ("library" . "Definition of a library module")
    ("libraryDoc" . "Definition of a library documentation module")
    ("name" . "Specifies the library name")
    ("sources" . "Specifies the sources for the library")
    ("font" . "Copies a source file into the designated font directory")
    ("fontDir" . "Recursively copies files under a source directory into the designated font directory")
    ("hash" . "Copies a source file into the designated hash directory")
    ("md" . "Copies a source file into the designated markdown directory")
    ("package" . "Copies a source file into the designated package directory")
    ("packageDir" . "Recursively copies files under a source directory into the designated package directory")
    ("file" . "Copies a source file into a specified directory in the distribution")
    ("opam" . "Specifies the OPAM package file")
    ("dependencies" . "Lists the dependencies for the library")
    ("compatibility" . "Lists compatibility warnings or notes")
    ("satyrographos" . "Warns about directory schema changes since a specified Satyrographos version")
    ("renamePackage" . "Warns about package renaming, specifying old and new names")
    ("renameFont" . "Warns about font renaming, specifying old and new names")
    ("workingDirectory" . "Specifies the working directory to build documents")
    ("build" . "Specifies build commands for documents")
    ("satysfi" . "Runs SATySFi with specified arguments")
    ("make" . "Runs make, setting a runtime directory to SATYSFI_RUNTIME")
    ("doc" . "Copies a source file into the designated documentation directory"))
  "Alist of Satyristes keywords and their explanations.")

;; Define custom syntax highlighting for Satyristes mode
(defvar satyristes-font-lock-keywords
  (let* (
         ;; Make the list of keywords to highlight.
         (keywords (cl-mapcar (lambda (c) (car c))
                              satyristes--keywords-alist))
         
         ;; Create a regular expression pattern to match the keywords.
         (keywords-regexp (regexp-opt keywords 'words)))

    `((,keywords-regexp . font-lock-keyword-face)))
  "Highlighting expressions for Satyristes mode.")

;; Define satyristes-mode
(define-derived-mode satyristes-mode lisp-mode "Satyristes"
  "Major mode for editing Satyristes files."

  ;; Set the custom font lock keywords
  (setq font-lock-defaults '(satyristes-font-lock-keywords)))

;; Associate satyristes-mode with "Satyristes" files
(add-to-list 'auto-mode-alist '("Satyristes\\'" . satyristes-mode))

(provide 'satyristes-mode)
;;; satyristes-mode.el ends here
