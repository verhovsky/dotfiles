;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-one-light)
(setq doom-font (font-spec :family "Source Code Pro" :size 20))
;; start in fullscreen
(add-to-list 'initial-frame-alist '(fullscreen . fullboth))
;; don't ask if I'm sure I want to exit
(setq confirm-kill-emacs nil)
(setq python-shell-interpreter "python3.9")

;; don't walk back a character when exiting insert mode
(setq evil-move-cursor-back nil)

;; don't treat underscores as word delimeters
(defalias 'forward-evil-word 'forward-evil-symbol)
(add-hook! 'js2-mode-hook (modify-syntax-entry ?_ "w")) ;; because the above doesn't work for JS

;; don't automatically add parentheses and quotes
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
;; alternatively disable smartparens only for certain modes
;; (add-hook 'python-mode-hook #'turn-off-smartparens-mode)
;; (add-hook 'markdown-mode-hook #'turn-off-smartparens-mode)
;; (add-hook 'javascript-mode-hook #'turn-off-smartparens-mode)

;; hide .mypy_cache/ and __pycache__/ directories when listing directories
(after! dired
  (setq dired-listing-switches "-ahl -v --group-directories-first -I .mypy_cache -I __pycache__"))

(defun pyupgrade ()
  (interactive)
  (shell-command (format "pyupgrade --py38-plus %S" buffer-file-name))
  (revert-buffer nil t))
(add-hook! 'python-mode-hook
  (add-hook 'after-save-hook #'pyupgrade nil 'local))


(setq-default whitespace-style '(face trailing lines-tail))
(setq-default whitespace-line-column 88)
(global-whitespace-mode t)
;; In Magit diffs, lines can start with - or + which causes lines that go up to the line length
;; limit to be highlighted.
(setq-hook! 'magit-mode-hook whitespace-line-column 89)

(after! magit
  ;; when creating a branch, ask for the name of the branch before the name of the branch to start
  ;; from
  (setq magit-branch-read-upstream-first nil)
  ;; enable character-wise highlights in diffs
  (setq magit-diff-refine-hunk 'all))


;; only autoformat python
;; (we're not autoformatting markdown, so have to specify file types manually)
(add-to-list '+format-on-save-enabled-modes 'python-mode)


