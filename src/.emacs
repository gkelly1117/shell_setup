; key bindings
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-s" 'shell)
(global-set-key "\C-xre" 'refresh-file)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-xh" 'help-command)
(global-set-key "\M-h" 'backward-kill-word)
(global-set-key "\C-x\C-b" "\C-xb")
(global-set-key "\C-x\M-b" 'buffer-menu)
(global-set-key "\M-p" "\M-5\C-p")
(global-set-key "\M-n" "\M-5\C-n")
(global-set-key "\C-xp" "\M--\C-xo")
(global-set-key "\C-x\C-p" "\C-xp")
(global-set-key "\C-x\C-o" "\C-xo")
(global-set-key "\C-x\C-k" "\C-xk")

;; backwards kill line
(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))
(global-set-key "\M-k" 'backward-kill-line)

;; delete current line
(defvar previous-column nil "Save the column position")
(defun nuke-line()
  "Kill an entire line, including the trailing newline character"
  (interactive)
  (setq previous-column (current-column))
  (end-of-line)
  (if (= (current-column) 0)
    (delete-char 1)
    (progn
      (beginning-of-line)
      (kill-line)
      (delete-char 1)
      (move-to-column previous-column))))
(global-set-key "\C-\M-k" 'nuke-line)

;; highlight lines over 80 chars
(require 'whitespace)
(setq whitespace-line-column 80
      whitespace-style '(face tabs trailing lines-tail))
(add-hook 'js2-mode-hook 'whitespace-mode)

;; fix spelling errors in comments
;(add-hook 'js2-mode-hook 'flyspell-prog-mode)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq standard-indent 2)

; syntax highlighting hooks
(setq auto-mode-alist (cons '("README" . text-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sqc$" . c-mode) auto-mode-alist))

;; load js2-mode
(setq load-path (append (list (expand-file-name "~/.emacs.d")) load-path))
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

; add column numbers
(setq column-number-mode t)

; delete highlighted text on input
(delete-selection-mode t)

; add pabbrev
(require 'pabbrev "~/.emacs.d/pabbrev.el")
(global-pabbrev-mode)
(pabbrev-shut-up)

; refresh file
(defun refresh-file ()
  (interactive)
  (revert-buffer t t t)
)

; highlight on mark set
(transient-mark-mode t)

; disable handling version control
(setq vc-handled-backends nil)

; remove bad-indent php warning
(add-hook 'php-mode-hook (lambda () (setq php-warned-bad-indent t)))

; disable backup
(setq backup-inhibited t)

; disable auto save
(setq auto-save-default nil)

; remove whitespace
(defun delete-trailing-whitespace-except-current-line ()
  (interactive)
  (let ((begin (line-beginning-position))
        (end (line-end-position)))
    (save-excursion
      (when (< (point-min) begin)
        (save-restriction
          (narrow-to-region (point-min) (1- begin))
          (delete-trailing-whitespace)))
      (when (> (point-max) end)
        (save-restriction
          (narrow-to-region (1+ end) (point-max))
          (delete-trailing-whitespace))))))

(add-hook 'before-save-hook 'delete-trailing-whitespace-except-current-line)

; custom set variables through M-x customize-group
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(gud-gdb-command-name "gdb --annotate=1")
 '(inhibit-startup-screen t)
 '(js2-auto-indent-p t)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p nil)
 '(js2-cleanup-whitespace t)
 '(js2-dynamic-idle-timer-adjust 0)
 '(js2-enter-indents-newline t)
 '(js2-highlight-external-variables nil)
 '(js2-idle-timer-delay 0.2)
 '(js2-indent-on-enter-key nil)
 '(js2-language-version 180)
 '(js2-mirror-mode t)
 '(js2-mode-escape-quotes nil)
 '(js2-mode-show-strict-warnings t)
 '(show-trailing-whitespace t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(js2-external-variable-face ((t (:foreground "orange")))))

(put 'upcase-region 'disabled nil)
