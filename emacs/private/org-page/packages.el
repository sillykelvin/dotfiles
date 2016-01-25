;;; packages.el --- org-page layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Kelvin Hu <ini.kelvin@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(setq org-page-packages '(org-page))

(defun org-page/init-org-page ()
  (use-package org-page
    :defer t
    :init
    (progn
      (require 'org-page)
      (spacemacs/declare-prefix "aa" "org-page")
      (spacemacs/set-leader-keys
        "aap" 'op/do-publication
        "aas" 'op/do-publication-and-preview-site
        "aan" 'op/new-post))))


;;; packages.el ends here
