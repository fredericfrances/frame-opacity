;;; frame-opacity-test.el ---
;;
;; Filename: frame-opacity-test.el
;; Description:
;; Author: ffrances
;; Maintainer:
;; Created: sam. mars  2 22:45:07 2019 (+0100)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 0
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;
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
(require 'ert)


(ert-deftest frame-opacity-set-100-test ()
  "Test `frame-opacity-set'."
  (let ((saved-opacity  (frame-parameter nil 'alpha)))
    (frame-opacity-set 50)
    (frame-opacity-set 100)
    (should (equal 100 (frame-parameter nil 'alpha)))
    (frame-opacity-set saved-opacity)))

(ert-deftest frame-opacity-set-above-100-test ()
  "Test `frame-opacity-set'."
  (let ((saved-opacity  (frame-parameter nil 'alpha)))
    (frame-opacity-set 50)
    (frame-opacity-set 120)
    (should (equal 100 (frame-parameter nil 'alpha)))
    (frame-opacity-set saved-opacity)))


(ert-deftest frame-opacity-set-lower-limit-test ()
  "Test `frame-opacity-set'."
  (let ((saved-opacity  (frame-parameter nil 'alpha)))
    (frame-opacity-set 50)
    (frame-opacity-set frame-alpha-lower-limit)
    (should (equal frame-alpha-lower-limit (frame-parameter nil 'alpha)))
    (frame-opacity-set saved-opacity)))

(ert-deftest frame-opacity-set-below-lower-limit-test ()
  "Test `frame-opacity-set'."
  (let ((saved-opacity  (frame-parameter nil 'alpha)))
    (frame-opacity-set 50)
    (frame-opacity-set (- frame-alpha-lower-limit 10))
    (should (equal frame-alpha-lower-limit (frame-parameter nil 'alpha)))
    (frame-opacity-set saved-opacity)))

(ert-deftest frame-opacity-change-relative-plus-test ()
  "Test `frame-opacity-change-relative'."
  (let ((saved-opacity  (frame-parameter nil 'alpha)))
    (frame-opacity-set 50)
    (frame-opacity-change-relative 10)
    (should (equal 60 (frame-parameter nil 'alpha)))
    (frame-opacity-set saved-opacity)))

(ert-deftest frame-opacity-change-relative-minus-test ()
  "Test `frame-opacity-change-relative'."
  (let ((saved-opacity  (frame-parameter nil 'alpha)))
    (frame-opacity-set 50)
    (frame-opacity-change-relative -10)
    (should (equal 40 (frame-parameter nil 'alpha)))
    (frame-opacity-set saved-opacity)))

(ert-deftest frame-opacity-change-relative-above-limit-test ()
  "Test `frame-opacity-change-relative'."
  (let ((saved-opacity  (frame-parameter nil 'alpha)))
    (frame-opacity-set 95)
    (frame-opacity-change-relative 10)
    (should (equal 100 (frame-parameter nil 'alpha)))
    (frame-opacity-set saved-opacity)))

(ert-deftest frame-opacity-change-relative-below-lower-limit-test ()
  "Test `frame-opacity-change-relative'."
  (let ((saved-opacity  (frame-parameter nil 'alpha)))
    (frame-opacity-set (+ 5 frame-alpha-lower-limit))
    (frame-opacity-change-relative -10)
    (should (equal frame-alpha-lower-limit (frame-parameter nil 'alpha)))
    (frame-opacity-set saved-opacity)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; frame-opacity-test.el ends here
