;;; clojure-lambda.el --- indentation and fontification for the lambda package: defλ, &c.

;; Copyright (C) 2012 Peter Danenberg

;; Author: Peter Danenberg <pcd@roxygen.org>
;; Version: 0.1
;; Maintainer: Peter Danenberg
;; Keywords: clojure
;; Name: clojure-lambda
;; Requirements: '(clojure-mode)
;; Description: Provides fontification and indentation for defλ and λ
;; from the lambda-package.
;; Url: https://github.com/klutometis/lambda

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor
;; Boston, MA 02110-1301, USA.

;;; Code:

(require 'clojure-mode)

(put 'defλ 'clojure-doc-string-elt 2)
(put 'defλ 'clojure-indent-function 'defun)
(put 'λ 'clojure-indent-function 'defun)
(put 'lambda 'clojure-indent-function 'defun)
(put 'let-macro-characters 'clojure-backtracking-indent '((2) 2))

(add-hook
 'clojure-mode-hook
 (lambda ()
   (font-lock-add-keywords
    nil
    `((,(concat "(\\(?:lambda.core/\\)?\\(defλ\\)\\>"
                ;; Any whitespace
                "[ \r\n\t]*"
                ;; Possibly type or metadata
                "\\(?:#?^\\(?:{[^}]*}\\|\\sw+\\)[ \r\n\t]*\\)*"
                "\\(\\sw+\\)?")
       (1 font-lock-keyword-face)
       (2 font-lock-function-name-face nil t))
      (,(concat "(\\(?:lambda.core/\\)?"
                (regexp-opt '("defλ"
                              "λ"
                              "lambda") t)
                "\\>"
                )
       1 font-lock-builtin-face)))))

(provide 'clojure-lambda)

;;; clojure-lambda.el ends here
