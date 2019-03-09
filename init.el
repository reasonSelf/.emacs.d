;;(package-initialize)

(load-file "~/.emacs.d/lisp/init-packages.el")
(load-file "~/.emacs.d/lisp/init-better-defaults.el")
(load-file "~/.emacs.d/lisp/init-kbd.el")
(load-file "~/.emacs.d/lisp/org.el")

;; Package Management
;; -----------------------------------------------------------------
;;(require 'init-packages)
;;end


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-c-headers-path-system
   (quote
    ("/usr/include/" "/usr/local/include/" "/usr/include/c++/7.3.0")))
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(org-agenda-files (quote ("~/.emacs.d/lisp/gtd.org")))
 '(package-selected-packages
   (quote
    (undo-tree company-c-headers company flycheck yasnippet auto-complete-c-headers racket-mode hungry-delete swiper counsel smartparens popwin helm helm-ag nyan-mode js2-mode nodejs-repl exec-path-from-shell xcscope monokai-theme spacemacs-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
