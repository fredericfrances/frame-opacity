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

(defun test-frame-opacity-set (value expect)
  "Test opacity value"
    (frame-opacity-set 50)
    (message "Set opacity to %d expect %d" value expect)
    (frame-opacity-set value)
    (should (equal expect (frame-parameter nil 'alpha))))

(defun test-frame-opacity-change-relative (start delta expect)
  "Test frame opacity change relative"
  (frame-opacity-set start)
  (message "relative-change %d, delta %d, expect %d" start delta expect)
  (frame-opacity-change-relative delta)
  (should (equal expect (frame-parameter nil 'alpha))))

(ert-deftest frame-opacity-set-100-test ()
  "Test `frame-opacity-set'."
  (test-frame-opacity-set 100 100))

(ert-deftest frame-opacity-set-above-100-test ()
  "Test `frame-opacity-set'."
  (test-frame-opacity-set 120 100))

(ert-deftest frame-opacity-set-50-test ()
  "Test `frame-opacity-set'."
  (test-frame-opacity-set 50 50))

(ert-deftest frame-opacity-set-lower-limit-test ()
  "Test `frame-opacity-set'."
  (test-frame-opacity-set frame-alpha-lower-limit frame-alpha-lower-limit))

(ert-deftest frame-opacity-set-below-lower-limit-test ()
  "Test `frame-opacity-set'."
  (test-frame-opacity-set (- frame-alpha-lower-limit  10) frame-alpha-lower-limit))

(ert-deftest frame-opacity-change-relative-change-nil-test ()
  "Test `frame-opacity-change-relative'."
  (frame-opacity-set 50)
  (frame-opacity-change-relative)
  (should (equal 100 (frame-parameter nil 'alpha))))


(ert-deftest frame-opacity-change-relative-plus-test ()
  "Test `frame-opacity-change-relative'."
  (test-frame-opacity-change-relative 50 10 60))

(ert-deftest frame-opacity-change-relative-minus-test ()
  "Test `frame-opacity-change-relative'."
  (test-frame-opacity-change-relative 50 -10 40))

(ert-deftest frame-opacity-change-relative-above-limit-test ()
  "Test `frame-opacity-change-relative'."
  (test-frame-opacity-change-relative 95 10 100))

(ert-deftest frame-opacity-change-relative-below-lower-limit-test ()
  "Test `frame-opacity-change-relative'."
  (test-frame-opacity-change-relative (+ frame-alpha-lower-limit 5) -10 frame-alpha-lower-limit))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; frame-opacity-test.el ends here
