; key bindings
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-s" 'shell)
(global-set-key "\C-xre" 'refresh-file)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-xh" 'help-command)
(global-set-key "\M-h" 'backward-kill-word)
(global-set-key "\M-k" "\C-a\C-k\C-h\C-n\C-a")
(global-set-key "\C-x\C-b" "\C-xb")
(global-set-key "\C-x\M-b" 'buffer-menu)
(global-set-key "\M-p" "\M-5\C-p")
(global-set-key "\M-n" "\M-5\C-n")
(global-set-key "\C-xp" "\M--\C-xo")
(global-set-key "\C-x\C-p" "\C-xp")
(global-set-key "\C-x\C-o" "\C-xo")
(global-set-key "\C-\M-w" "\C-a\C-k\C-y")
(global-set-key "\C-x\C-k" "\C-xk")

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