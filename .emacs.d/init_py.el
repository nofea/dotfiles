;; -*- mode: emacs-lisp -*-
;; Simple .emacs configuration

;; ---------------------
;; -- Global Settings --
;; ---------------------
;;(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/lisp")

;; ---------------------
;; -- Global Settings --
;; ---------------------
;;(require 'cl)
;;(require 'ido)
;;(require 'ffap)
;;(require 'uniquify)
;;(require 'ansi-color)
;;(require 'recentf)
;;(require 'linum)
;;(require 'smooth-scrolling)
;;(require 'whitespace)
;;(require 'dired-x)
;;(require 'compile)
;;(ido-mode t)
;;(menu-bar-mode -1)
;;(normal-erase-is-backspace-mode 1)
;;(put 'downcase-region 'disabled nil)
;;(put 'upcase-region 'disabled nil)
;;(setq column-number-mode t)
;;(setq inhibit-startup-message t)
;;(setq save-abbrevs nil)
;;(setq show-trailing-whitespace t)
;;(setq suggest-key-bindings t)
;;(setq vc-follow-symlinks t)

;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(default ((t (:inherit autoface-default :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "monaco"))))
 ;;'(column-marker-1 ((t (:background "red"))))
 ;;'(diff-added ((t (:foreground "cyan"))))
 ;;'(flymake-errline ((((class color) (background light)) (:background "Red"))))
 ;;'(font-lock-comment-face ((((class color) (min-colors 8) (background light)) (:foreground "red"))))
 ;;'(fundamental-mode-default ((t (:inherit default))))
 ;;'(highlight ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 ;;'(isearch ((((class color) (min-colors 8)) (:background "yellow" :foreground "black"))))
 ;;'(linum ((t (:foreground "black" :weight bold))))
 ;;'(region ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 ;;'(secondary-selection ((((class color) (min-colors 8)) (:background "gray" :foreground "cyan"))))
 ;;'(show-paren-match ((((class color) (background light)) (:background "black"))))
 ;;'(vertical-border ((t nil)))
;;)

;; ------------
;; -- Macros --
;; ------------
;;(load "defuns-config.el")
;;(fset 'align-equals "\C-[xalign-regex\C-m=\C-m")
;;(global-set-key "\M-=" 'align-equals)
;;(global-set-key "\C-x\C-m" 'execute-extended-command)
;;(global-set-key "\C-c;" 'comment-or-uncomment-region)
;;(global-set-key "\M-n" 'next5)
;;(global-set-key "\M-p" 'prev5)
;;(global-set-key "\M-o" 'other-window)
;;(global-set-key "\M-i" 'back-window)
;;(global-set-key "\C-z" 'zap-to-char)
;;(global-set-key "\C-h" 'backward-delete-char)
;;(global-set-key "\M-d" 'delete-word)
;;(global-set-key "\M-h" 'backward-delete-word)
;;(global-set-key "\M-u" 'zap-to-char)
(global-set-key [(control ?h)] 'delete-backward-char)

;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
;;(load "js-config.el")
;;(add-to-list 'load-path "~/.emacs.d/jade-mode") ;; github.com/brianc/jade-mode
;;(require 'sws-mode)
;;(require 'jade-mode)    
;;(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
;;(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))



;; INSTALL PACKAGES
;; --------------------------------------
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    flycheck
    material-theme
    py-autopep8))

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)
(elpy-use-ipython)

(setq python-shell-interpreter "ipython"
    python-shell-interpreter-args "--simple-prompt -i")

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;;-------------------
;;-- Other configs --
;;-------------------
(set-face-foreground 'font-lock-string-face "red")
(set-face-foreground 'font-lock-comment-face "green")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(highlight-indentation-offset 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
