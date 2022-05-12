;; Define and initialize package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package to simplify the config file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

;; Theme
(use-package exotica-theme
	     :config (load-theme 'exotica t))

;; Evil-mode
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil-mode
(require 'evil)
(evil-mode 1)

;; Org-mode
(global-set-key (kbd "C-c C-l") #'org-store-link)
(global-set-key (kbd "C-c C-a") #'org-agenda)
(global-set-key (kbd "C-c C-c") #'org-capture)

;; Helm configuration
(use-package helm
  :config
  (require 'helm-config)
  :init
  (helm-mode 1)
  :bind
  (("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files)
   ("C-x C-b" . helm-mini)
   ("C-x C-r" . helm-recentf)
   ("C-x i" . helm-imenu)
   ("C-x p" . helm-projects-history)

   ("M-y" . helm-show-kill-ring)
   :map helm-map
   ("C-z" . helm-select-action)
   ("<tab>" . helm-execute-persistent-action)))

(use-package helm-ls-git)
(global-set-key (kbd "C-x C-d") 'helm-browse-project)
(global-set-key (kbd "C-x r p") 'helm-projects-history)

;; Which-key
(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle 0.5
	which-key-idle-delay 50)
  (which-key-setup-minibuffer))

;; Auto completion
(use-package company
  :config
  (setq company-idle-delay 0.5
	company-minimum-prefix-length 4
	company-selection-wrap-around t))
(global-company-mode)

;; Org mode
(setq org-startup-indented t
      org-pretty-entities t
      org-hide-emphasis-markers t
      org-startup-with-inline-images t
      org-image-actual-width '(300))

;; Show hidden emphasis markers
(use-package org-appear
  :hook (org-mode . org-appear-mode))

;; Nice bullets
(use-package org-superstar
  :config
  (setq org-superstar-configure-like-org-bullets t)
  (add-hook 'org-mode-hook (lambda ()
			     (org-superstar-mode 1))))

;; Increase size of LaTeX fragment previews
(plist-put org-format-latex-options :scale 2)

;; Send autosave files to backup directory
(setq
 backup-by-copying t
 backup-directory-alist
 '(("." . "~/.config/doom/.saves"))
 delete-old-versions t)

;; Emacs settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company which-key use-package helm-ls-git exotica-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
