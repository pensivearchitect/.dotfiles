(add-to-list 'load-path "~/structured-haskell-mode/elisp")
(require 'shm)
(require 'cedet)
(require 'semantic/sb)
(require 'auto-complete-config)
(require 'smartparens-config)
;; Required as I'd like to play with these more
(require 'smartparens-latex)
(require 'smartparens-ruby)
(smartparens-global-mode t)

(add-hook 'prog-mode
          (lambda ()
            (pretty-mode 1)
            (rainbow-delimiters-mode 1)
            (rainbow-identifiers-mode)
            (highlight-numbers-mode)
            (display-time-mode 1)
            (pretty-mode 1)
            ))

(add-to-list 'load-path "~/emacs/custom/")
(add-to-list 'load-path "~/emacs/vendor/robe/")
(add-hook 'ruby-mode 'ac-robe-setup)
(add-hook 'c-mode-hook 'my-c-hooks)
(add-hook 'c-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-c-headers)
            (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1))
          (defun kibit ()
            (interactive)
            (compile "lein kibit"))

          (defun kibit-current-file ()
            (interactive)
            (compile (concat "lein kibit " buffer-file-name))))

(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)
(add-hook 'js2-mode-hook 'flymake-jslint-load)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(add-hook 'ruby-mode-hook 'projectile-rails-on)
(add-hook 'emacs-lisp-mode-hook 'smartparens-strict-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)
(add-hook 'scala-mode2-hook 'ensime-scala-hook)
(add-hook 'ruby-mode-hook 'robe-mode)

(eval-after-load 'auto-complete
  '(add-to-list 'ac-modes 'inf-ruby-mode))
(helm-mode nil)


(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(fset 'yes-or-no-p 'y-or-n-p)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setenv "PATH" "/home/josh/.gem/ruby/2.1.0/bin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin")

(provide 'mode-setup)
