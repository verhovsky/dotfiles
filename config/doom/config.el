;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-one-light)
(set-frame-font "Source Code Pro")
(setq python-shell-interpreter "python3")
;; don't walk back character when exiting insert mode
(setq evil-move-cursor-back nil)
;; don't treat underscores as word delimeters
(modify-syntax-entry ?_ "w")
(add-hook! 'js2-mode-hook (modify-syntax-entry ?_ "w")) ;; because the above doesn't work for JS

;; (defun pyupgrade ()
;;   (interactive)
;;   (shell-command (format "pyupgrade --py37-plus %S" buffer-file-name)))

(defun pyupgrade ()
  (interactive)
  (shell-command (format "pyupgrade --py37-plus %S" buffer-file-name))
  (revert-buffer nil t))

;; (add-hook! 'python-mode-hook
;;   (add-hook 'after-save-hook #'pyupgrade nil 'local))
;; don't auto format markdown
(add-to-list '+format-on-save-enabled-modes 'python-mode)

;; don't insert matching parentheses
;; (add-hook 'python-mode-hook #'turn-off-smartparens-mode)
;; (add-hook 'markdown-mode-hook #'turn-off-smartparens-mode)
;; (add-hook 'javascript-mode-hook #'turn-off-smartparens-mode)
