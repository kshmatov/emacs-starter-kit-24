(defun restore-saved-window-size()
  (unless (load "~/.emacs.d/whsettings" t nil t)
    (setq saved-window-size '(80 30)))
  (nconc default-frame-alist `((width . ,(car saved-window-size))
(height . ,(cadr saved-window-size)))))

(restore-saved-window-size)

(defun save-window-size-if-changed (&optional unused)
  (let ((original-window-size `(,(frame-width) ,(frame-height))))
    (unless (equal original-window-size saved-window-size)
      (with-temp-buffer
        (setq saved-window-size original-window-size)
        (insert (concat "(setq saved-window-size '"
                        (prin1-to-string saved-window-size) ")"))
        (write-file "~/.emacs.d/whsettings")))))

(add-hook 'window-size-change-functions 'save-window-size-if-changed)
