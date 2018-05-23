(require 'package)

(setq package-archives nil)

(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(setq load-prefer-newer 1)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (counsel-projectile projectile magit pkgbuild-mode pdf-tools slime-company slime company which-key avy counsel swiper ivy-hydra hydra ivy undo-tree smartparens rainbow-delimiters rainbow-mode telephone-line use-package org-plus-contrib base16-theme auto-compile)))
 '(safe-local-variable-values
   (quote
    ((org-structure-template-alist
      ("s" "#+BEGIN_SRC emacs-lisp
?
#+END_SRC"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(org-babel-load-file (concat user-emacs-directory "config.org"))
