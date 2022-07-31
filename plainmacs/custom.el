(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(setq-default indent-tabs-mode nil)
(add-hook 'after-save-mode #'executable-make-buffer-file-executable-if-script-p)

(use-package bind-key
             :ensure t)

(use-package helm
             :config
             (require 'helm-config)
             :init
             (setq helm-mode 1)
             :bind
             (("M-x" . helm-M-x)
              ("C-x C-f" . helm-find-files)
              ("C-x b" . helm-mini)
              ("C-x C-r" . helm-recentf)
              ("C-c i" . helm-imenu)
              ("M-y" . helm-show-kill-ring)
              :map helm-map
              ("C-z" . helm-select-action)
              ("<tab>" . helm-execute-persistent-action)))

(use-package which-key
             :config
             (which-key-mode)
             (setq which-key-idle-delay 0.5
                   which-key-idle-secondary-window-delay 0.5)
             (which-key-setup-side-window-bottom))

(use-package company
             :config
             (setq company-idle-delay 0
                   company-minimum-prefix-length 4
                   company-selection-wrap-around t))
(global-company-mode)
(delete-selection-mode t)

(setq org-startup-indented t
      org-pretty-entities t)

(use-package magit)

(use-package yasnippet)
(use-package yasnippet-snippets)
(yas-global-mode 1)

(use-package dracula-theme)

(setq backup-directory-alist `(("." . "~/.saves")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("73803d7cebbc240fd6cd8a54077b8fbf0b263a25db48579f5953279986283481" default))
 '(mac-option-modifier '(:ordinary meta :function alt :mouse alt))
 '(package-selected-packages
   '(dracula-theme yasnippet-snippets yasnippet magit company which-key helm use-package))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
