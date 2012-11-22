

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit monokai-theme erlang ghc haskell-mode js2-mode mongo pep8 php-mode php-extras pyde pyflakes pylint pymacs pysmell python python-mode python-pep8 python-pylint zenburn-theme)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq file-name-coding-system 'utf-8)
(add-to-list 'desktop-locals-to-save 'buffer-file-coding-system)

(global-set-key "\M-\\" 'revert-buffer-with-coding-system)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" "71efabb175ea1cf5c9768f10dad62bb2606f41d110152f4ace675325d28df8bd" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load "~/.emacs.d/restore-window-pos.el")

(add-to-list 'auto-mode-alist '("\\.html$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.htm$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(load-theme 'zenburn)
(menu-bar-mode 1)
