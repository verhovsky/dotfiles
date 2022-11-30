;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Boris Verkhovskiy"
      user-mail-address "boris.verk@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "SF Mono" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "SF Pro" :size 12))
(setq doom-font (font-spec :family "Source Code Pro" :size 16 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Source Code Pro" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one-light)

;; start in fullscreen
(add-to-list 'initial-frame-alist '(fullscreen . fullboth))

;; don't ask if I'm sure I want to exit
(setq confirm-kill-emacs nil)
(setq python-shell-interpreter "python")

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
  (shell-command (format "pyupgrade --py39-plus %S" buffer-file-name))
  (revert-buffer nil t))
;; (add-hook! 'python-mode-hook
;;   (add-hook 'after-save-hook #'pyupgrade nil 'local))


(setq-default whitespace-style '(face trailing lines-tail))
(setq-default whitespace-line-column 88)
(global-whitespace-mode t)
;; In Magit diffs, lines can start with - or + which causes lines that go up to the line length
;; limit to be highlighted.
(setq-hook! 'magit-mode-hook whitespace-line-column 89)

(after! magit
  ;; make deleting a lot of files fast
  ;; https://github.com/magit/magit/discussions/4635#discussioncomment-2373684
  (setq magit-delete-by-moving-to-trash nil)
  ;; when creating a branch, ask for the name of the branch before the name of the branch to start
  ;; from
  (setq magit-branch-read-upstream-first nil)
  ;; enable character-wise highlights in diffs
  (setq magit-diff-refine-hunk 'all)
  ;; Make the previous commit the first choice for magit-reset
  ;; https://github.com/magit/magit/issues/4189#issuecomment-672573499
  (defun my/magit-read-branch-or-commit (fn prompt &optional secondary-default)
    (funcall fn prompt
             (if (string-match-p "\\`magit-reset" (symbol-name this-command))
                 "HEAD~1"
                 secondary-default)))
  (advice-add 'magit-read-branch-or-commit :around #'my/magit-read-branch-or-commit))


;; only autoformat python
;; (we're not autoformatting markdown, so have to specify file types manually)
(add-to-list '+format-on-save-enabled-modes 'python-mode)


