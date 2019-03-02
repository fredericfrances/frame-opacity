;;; frame-opacity.el --- elsip helpers to change frame opacity.
;;
;; Filename: frame-opacity.el
;; Description: elsip helpers to change frame opacity.
;; Author: ffrances
;; Maintainer:
;; Created: sam. mars  2 22:17:04 2019 (+0100)
;; Version: 0.1
;; Package-Requires: ()
;;
;; Keywords: frame opacity
;; Compatibility:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;  insert in your init file
;;  (require 'frame-opacity)
;; 
;;  C-prior / C-next change opacity relatively.
;;
;;  `frame-opacity-set' set frame opacity to a fixed value.
;;  `frame-opacity-change-relative' change opacity relatively.
;;  `frame-opacity-set-key' set default key mapping to change opacity.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:
(defun frame-opacity-set (opacity)
  "Set frame OPACITY."
  (interactive "nopacity:")
  (when (and (>= opacity frame-alpha-lower-limit) (<= opacity 100))
    (message "opacity set to %d" opacity)
    (modify-frame-parameters nil (list (cons 'alpha opacity)))))

(defun frame-opacity-change-relative (&optional value)
  "Increase or decrease opacity by VALUE.
if VALUE is not defined call (`frame-opacity-set' 100)."
  (interactive "ndelta:")
  (if value
    (let* ((alpha-or-nil (frame-parameter nil 'alpha))
           (oldalpha (if alpha-or-nil alpha-or-nil 100))
           (newalpha (+ oldalpha value)))
      (when (>= newalpha 100)
        (setq newalpha 100))
      (when (<= newalpha frame-alpha-lower-limit)
        (setq newalpha frame-alpha-lower-limit))
      (modify-frame-parameters nil (list (cons 'alpha newalpha))))
    (frame-opacity-set 100)))

(defun frame-opacity-set-key()
  "Set key for `frame-opacity'."
  (interactive)
  (global-set-key [C-next]  '(lambda () (interactive) (frame-opacity-change-relative +5)))
  (global-set-key [C-prior] '(lambda () (interactive) (frame-opacity-change-relative -5))))


(provide 'frame-opacity)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; frame-opacity.el ends here
