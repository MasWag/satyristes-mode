;;; eldoc-satyristes.el --- Eldoc support for Satyristes files

;; Copyright (C) 2023 Masaki Waga

;; Maintainer: Masaki Waga
;; Package-Requires: ((emacs "25.1"))
;; Keywords: Satyristes, documentation, eldoc

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

;; This file provides Eldoc support for Satyristes files, displaying
;; inline documentation for Satyristes keywords in the echo area as you type.
;; Satyristes files are used in Satyrographos <https://github.com/na4zagin3/satyrographos>,
;; which is a Package manager for SATySFi <https://github.com/gfngfn/SATySFi>.
;; This mode is compatible with Satyrographos 0.0.2 series.

;;; Code:

(require 'satyristes-mode)

(defun eldoc-satyristes-documentation-function ()
  "Return the documentation of the Satyristes keyword at point."
  (let ((word (current-word t)))
    (cdr (assoc word satyristes--keywords-alist))))

(defun eldoc-satyristes-setup ()
  "Setup eldoc function for Satyristes mode."
  (setq-local eldoc-documentation-function #'eldoc-satyristes-documentation-function))

;; Automatically set up Eldoc support when entering Satyristes mode
(add-hook 'satyristes-mode-hook #'eldoc-satyristes-setup)

(provide 'eldoc-satyristes)
;;; eldoc-satyristes.el ends here
