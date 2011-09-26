;; key bindings
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-s" 'shell)
(global-set-key "\C-xre" 'refresh-file)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-xh" 'help-command)
(global-set-key "\M-h" 'backward-kill-word)
(global-set-key "\M-k" "\C-a\C-k\C-h\C-n\C-a")
(global-set-key "\C-x\C-b" "\C-xb")
(global-set-key "\C-x\M-b" 'buffer-menu)
;(global-set-key "\M-p" "\M-5\C-p\M-5\M-v")
;(global-set-key "\M-n" "\M-5\C-n\M-5\C-v")
(global-set-key "\M-p" "\M-4\C-p")
(global-set-key "\M-n" "\M-4\C-n")
(global-set-key "\C-xp" "\M--\C-xo")
(global-set-key "\C-x\C-p" "\C-xp")
(global-set-key "\C-x\C-o" "\C-xo")
(global-set-key "\C-\M-w" "\C-a\C-k\C-y")
(global-set-key "\C-x\C-k" "\C-xk")

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; include emacs dependencies
(add-to-list 'load-path "~/.emacs.d")
(normal-top-level-add-subdirs-to-load-path)

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;(global-auto-complete-mode t)

;;; bind meta-space to auto-complete
(global-set-key [(meta ?\ )] 'auto-complete)

;;; use C-n and C-p to navigate menu popup (default is to use M-n and M-p)
;(setq ac-use-menu-map t)
;(define-key ac-menu-map "\C-n" 'ac-next)
;(define-key ac-menu-map "\C-p" 'ac-previous)

;;; disable the quick help yellow box
(setq ac-use-quick-help nil)

; pabbrev
;(require 'pabbrev)
;(global-pabbrev-mode)
;(pabbrev-shut-up)

(require 'auto-complete-actionscript)

;(require 'actionscript-mode)
;(setq auto-mode-alist (cons '("\\.as$" . actionscript-mode) auto-mode-alist))

(require 'ecmascript-mode)
(setq auto-mode-alist (cons '("\\.as$" . ecmascript-mode) auto-mode-alist))

;; define the function to kill the characters from the cursor
;; to the beginning of the current line.
(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))
(global-set-key "\C-u" 'backward-kill-line)

;; refresh file
(defun refresh-file ()
  (interactive)
  (revert-buffer t t t)
)

;; highlight on mark set
(transient-mark-mode t)

;; disable handling version control
(setq vc-handled-backends nil)

;; remove bad-indent php warning
(add-hook 'php-mode-hook (lambda () (setq php-warned-bad-indent t)))

;; disable backup
(setq backup-inhibited t)

;; disable auto save
(setq auto-save-default nil)

;; remove whitespace
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