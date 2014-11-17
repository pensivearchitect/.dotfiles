;; Various utils that I felt should be put here,
;; can also be conceptualized as the misc junk drawer
;; but this feels more important than that
(defun yas/popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t)))

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))
;;; emacs equivalent of d^ || d0
(defun backwards-kill-line ()
  (interactive) (kill-region
                 (point) (progn (beginning-of-line) (point))))

;;; sort of replaced by pretty symbols mode
(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))))))))
(defun my-c-hooks ()
  (yas/minor-mode-on)
  (auto-complete-mode 1))

(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))
(dime-setup '(dime-dylan dime-repl dime-compiler-notes-tree))

;; Consider moving this into a theme specific file. Will probably
;; pursue that once I have enough customizations to warrant my own
;; theme aka never
(defun set-default-themes (font)
  ;; (set-face-attribute 'default nil :family font :height 130 :background "#000000")
  (set-face-attribute 'default nil :family font :height 130)
  ;; (set-face-attribute 'font-lock-comment-face nil :foreground "#2AA198")
  ;; (set-face-attribute 'font-lock-doc-face nil :foreground "#2AA161")
  ;; (set-face-attribute 'font-lock-string-face nil :foreground "#2AA161")
  )
;; I'd like to use #' syntax but for SOME REASON IT THROWS AN ERROR
;; this is the simple and lazy solution
(add-hook 'prog-mode-hook
          (lambda ()
            ((rainbow-identifiers-mode) (rainbow-delimiters-mode))))
(provide 'utils)
