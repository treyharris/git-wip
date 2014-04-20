(defun git-wip-wrapper () 
  (interactive)
  (shell-command (concat "git-wip save \"WIP from emacs: " (buffer-file-name) "\" --editor -- " (buffer-file-name)))
  (message (concat "Wrote and git-wip'd " (buffer-file-name))))

(defun git-wip-if-git ()
  (interactive)
  (when (string= (downcase (symbol-name (vc-backend (buffer-file-name))))
                 "git")
    (git-wip-wrapper)))

(add-hook 'after-save-hook 'git-wip-if-git)
