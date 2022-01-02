;; (when (>= emacs-major-version 24)
;;     (require 'package)
;;     (package-initialize)
;;     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;;		      ("melpa" . "https://melpa.org/packages/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company-c-headers;;仅作用在C下
		company
		flycheck
		yasnippet
		auto-complete-c-headers
		racket-mode
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
		popwin
		helm
		helm-ag
		nyan-mode
		sr-speedbar;;file-tree
		;; --- Major Mode ---
		js2-mode
		markdown-mode ;;for markdown
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		xcscope
		google-translate
		;; --- Themes ---
		monokai-theme
		spacemacs-theme
		;; solarized-theme
		;; --- IDE for cpp -----
		ggtags
		helm-gtags
		function-args ;;for helm
		;; --- For Scheme ----
		paredit
		;; --- indent guide ---
		indent-guide
		;; --- for scheme ---
		geiser
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

;;-----------------------------------------------------------------
;;load-theme
(load-theme 'spacemacs-dark 1)

;;Company-mode
(global-company-mode 1)
;;(add-hook 'c++-mode 'company-mode)
;;(add-hook 'c-mode 'company-mode)
;;(add-hook 'lisp-mode 'company-mode)
(add-to-list 'company-backends 'company-c-headers)

;;for copany-clang
;;clang玄学区
(setq company-backends (delete 'company-semantic company-backends))



;;-----end company

(require 'popwin)
(popwin-mode 1)

(require 'helm)

;;----------------------------------------------------------------
(add-hook 'after-init-hook #'global-flycheck-mode)

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)

;;(smartparens-global-mode t)
(require 'smartparens-config)
(add-hook 'c-mode-hook 'smartparens-mode);;在c-mode中使用括号补全
(add-hook 'c++-mode-hook 'smartparens-mode);;在c++-mode中使用括号补全
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)

;;smartparens修复方案

;;(push 'c-electric-paren sp--special-self-insert-commands)
;;(push 'c-electric-brace sp--special-self-insert-commands)

(if (version<   "26.0" emacs-version)
    (setq sp-escape-quotes-after-insert nil))
;;end

(require 'nyan-mode)
(nyan-mode t)

(require 'xcscope)
(cscope-setup)

(setq auto-mode-alist
      (append
       '(("\\.rkt\\'" . racket-mode))
       '(("\\.h\\'" . c++-mode))
       auto-mode-alist))

;;(setq auto-mode-alist
;;      (append
;;       '(("\\.h\\'" . c++-mode))))


;;(global-undo-tree-mode);;全局撤回树

;;ggtags configtion
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(require 'function-args)
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode)
	      (function-args-mode 1))))

(setq c-default-style "linux")

;;for markdown
(require 'markdown-mode)


;;for google-translate
;;不能用,被墙了
(require 'google-translate)
(setq-default google-translate-enable-ido-completion t)

(setq-default google-translate-default-source-language "en")
(setq-default google-translate-default-target-language "zh-CN")

;;M-x m g t

;;end

;;indent-guide
(require 'indent-guide)
(indent-guide-global-mode)

;;scheme
(require 'geiser)
(setq geiser-active-implementations '(chez))
;;end
