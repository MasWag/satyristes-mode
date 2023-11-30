;;; company-satyristes.el --- Company mode backend for Satyristes files   -*- lexical-binding:t -*-

;; Copyright (C) 2023 Masaki Waga

;; Maintainer: Masaki Waga
;; Keywords: completion, company, Satyristes
;; Package-Requires: ((emacs "24.3") (company "0.8.0"))

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

;; This provides a Company mode backend for Satyristes files used in
;; Satyrographos <https://github.com/na4zagin3/satyrographos>, which
;; is a Package manager for SATySFi <https://github.com/gfngfn/SATySFi>.
;; This mode is compatible with Satyrographos 0.0.2 series.
;; This extension requires Emacs version 24.3 or newer, as it uses features
;; from the cl-lib package introduced in that version.

;;; Code:

(require 'cl-lib)
(require 'satyristes-mode)
(require 'company)

(defun company-satyristes (command &optional arg &rest ignored)
  "Backend for company-mode to complete Satyristes keywords.
Responds to COMMAND for keyword completion, annotations, and metadata.
Activates only in `satyristes-mode'.  ARG is the current completion prefix.
Excludes completions within string literals."
  (interactive (list 'interactive))
  (cl-case command
    (interactive (company-begin-backend 'company-satyristes))
    (prefix (and (eq major-mode 'satyristes-mode)
                 (not (cl-fourth (syntax-ppss))) ; Check if not inside a string
                 (company-grab-symbol)))
    (candidates
     (cl-remove-if-not
      (lambda (keyword) (string-prefix-p arg keyword))
      (cl-mapcar (lambda (c) (car c))
                 satyristes--keywords-alist)))
    (annotation (company-satyristes-annotation arg))
    (meta (company-satyristes-meta arg))))

(defun company-satyristes-annotation (candidate)
  "Return a short annotation for a CANDIDATE."
  (concat " - " (cdr (assoc candidate satyristes--keywords-alist))))

(defun company-satyristes-meta (candidate)
  "Return a detailed explanation for a CANDIDATE."
  (or (cdr (assoc candidate satyristes--keywords-alist))
      "No documentation available."))

(add-to-list 'company-backends 'company-satyristes)

(provide 'company-satyristes)
;;; company-satyristes.el ends here
