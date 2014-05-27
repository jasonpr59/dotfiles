;; Setup load path.
(add-to-list 'load-path "~/.emacs.d/")

;; Turn on column-number-mode.
(setq column-number-mode t)

;; Show trailing whitespace.
(setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)

;; Set two-space indent for js-mode.
(setq js-indent-level 2)

;; Marmalade packaging archive.
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Don't save backupfiles in the source dir.
;; Save them in a temp dir.
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

;; Fix diff colors.
(defun update-diff-colors ()
  "update the colors for diff faces"
  (set-face-attribute 'diff-added nil
                      :foreground "white" :background "green")
  (set-face-attribute 'diff-removed nil
                      :foreground "white" :background "red")
  (set-face-attribute 'diff-changed nil
                      :foreground "white" :background "yellow")
  (set-face-attribute 'diff-hunk-header nil
                      :foreground "white" :background "black")
)
(eval-after-load "diff-mode"
  '(update-diff-colors))

;; Python mode.
(add-to-list 'load-path "~/.emacs.d/python-mode/")

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(defun my-compile ()
  "Use compile to run python programs"
  (interactive)
  (compile (concat "python " (buffer-name))))
(setq compilation-scroll-output t)

(add-hook 'python-mode-hook
          '(lambda () (local-set-key "\C-c\C-c" 'my-compile)))

;; Scheme mode.
(add-hook 'scheme-mode-hook
          '(lambda () (load-library "xscheme")))
(add-hook 'scheme-mode-hook
          '(lambda () (local-set-key "\C-c\C-r" 'run-scheme)))


;; Markdown mode.
(autoload 'markdown-mode "markdown-mode" "Markdown mode" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
