;; MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; install packages from MELPA
(defvar melpa-packages
  '(company
    google-c-style
    cyberpunk-theme
    ))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(dolist (pkg melpa-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

(load-theme 'cyberpunk t)

;; C/C++ coding style
(require 'google-c-style)
(defun my-cc-style ()
  (google-set-c-style)
  ;; (setq c-basic-offset 4)
  )
(add-hook 'c-mode-hook 'my-cc-style)
(add-hook 'c++-mode-hook 'my-cc-style)

(when (require 'company nil 'noerror)
  (global-company-mode 1)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (setq company-selection-wrap-around t)
  (global-set-key (kbd "C-M-i") 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "<tab>") 'company-complete-selection)
  )
