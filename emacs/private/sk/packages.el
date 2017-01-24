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
    rtags
    ))

(defun sk/post-init-cc-mode ()
  (add-to-list 'auto-mode-alist '("\\.c$" . c++-mode)))

(defun sk/init-evil-vimish-fold ()
  (use-package evil-vimish-fold
    ;; :defer t
    :config
    (progn
      ;; do NOT enable this currently, it conflicts with
      ;; evil's default folding functions
      ;; (evil-vimish-fold-mode 1)
      )))

(defun sk/init-protobuf-mode ()
  (use-package protobuf-mode
    :defer t))

(defun rtags-evil-standard-keybindings (mode)
  (evil-leader/set-key-for-mode mode
    "mR." 'rtags-find-symbol-at-point
    "mR," 'rtags-find-references-at-point
    "mRv" 'rtags-find-virtuals-at-point
    "mRV" 'rtags-print-enum-value-at-point
    "mR/" 'rtags-find-all-references-at-point
    "mRY" 'rtags-cycle-overlays-on-screen
    "mR>" 'rtags-find-symbol
    "mR<" 'rtags-find-references
    "mR[" 'rtags-location-stack-back
    "mR]" 'rtags-location-stack-forward
    "mRD" 'rtags-diagnostics
    "mRG" 'rtags-guess-function-at-point
    "mRp" 'rtags-set-current-project
    "mRP" 'rtags-print-dependencies
    "mRe" 'rtags-reparse-file
    "mRE" 'rtags-preprocess-file
    "mRR" 'rtags-rename-symbol
    "mRM" 'rtags-symbol-info
    "mRS" 'rtags-display-summary
    "mRO" 'rtags-goto-offset
    "mR;" 'rtags-find-file
    "mRF" 'rtags-fixit
    "mRL" 'rtags-copy-and-print-current-location
    "mRX" 'rtags-fix-fixit-at-point
    "mRB" 'rtags-show-rtags-buffer
    "mRI" 'rtags-imenu
    "mRT" 'rtags-taglist
    "mRh" 'rtags-print-class-hierarchy
    "mRa" 'rtags-print-source-arguments
    ))

(defun sk/init-rtags ()
  (use-package rtags
    :ensure company
    :config
    (setq rtags-autostart-diagnostics t
          rtags-completions-enabled t
          rtags-use-helm t)
    (require 'rtags-helm)
    (push '(company-rtags)
          company-backends-c-mode-common)
    ;; (add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
    (rtags-evil-standard-keybindings 'c-mode)
    (rtags-evil-standard-keybindings 'c++-mode))
  (use-package flycheck-rtags
    :ensure rtags))


;;; packages.el ends here
