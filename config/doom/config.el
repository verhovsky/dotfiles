;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-one-light)
(setq doom-font (font-spec :family "Source Code Pro" :size 16))
;; start in fullscreen
(add-to-list 'initial-frame-alist '(fullscreen . fullboth))
(setq python-shell-interpreter "python3")
;; If I want to exit, I want to exit.
(setq confirm-kill-emacs nil)

(after! dired
  (setq dired-listing-switches "-ahl -v --group-directories-first -I .mypy_cache -I __pycache__"))

;; don't walk back character when exiting insert mode
(setq evil-move-cursor-back nil)

;; don't treat underscores as word delimeters
(defalias 'forward-evil-word 'forward-evil-symbol)
(add-hook! 'js2-mode-hook (modify-syntax-entry ?_ "w")) ;; because the above doesn't work for JS

;; don't automatically add parentheses and quotes
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

;; (defun pyupgrade ()
;;   (interactive)
;;   (shell-command (format "pyupgrade --py37-plus %S" buffer-file-name)))

(defun pyupgrade ()
  (interactive)
  (shell-command (format "pyupgrade --py38-plus %S" buffer-file-name))
  (revert-buffer nil t))

;; (add-hook! 'python-mode-hook
;;   (add-hook 'after-save-hook #'pyupgrade nil 'local))
;; don't auto format markdown
(add-to-list '+format-on-save-enabled-modes 'python-mode)

;; don't insert matching parentheses
;; (add-hook 'python-mode-hook #'turn-off-smartparens-mode)
;; (add-hook 'markdown-mode-hook #'turn-off-smartparens-mode)
;; (add-hook 'javascript-mode-hook #'turn-off-smartparens-mode)
