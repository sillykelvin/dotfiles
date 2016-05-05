;;; packages.el --- sk layer packages file for Spacemacs.
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

(defconst sk-packages
  '(
    cc-mode
    evil-vimish-fold
    protobuf-mode
    ))

(defun sk/post-init-cc-mode ()
  (add-to-list 'auto-mode-alist '("\\.c$" . c++-mode)))

(defun sk/init-evil-vimish-fold ()
  (use-package evil-vimish-fold
    ;; :defer t
    :config
    (progn
      (evil-vimish-fold-mode 1))))

(defun sk/init-protobuf-mode ()
  (use-package protobuf-mode
    :defer t))


;;; packages.el ends here
