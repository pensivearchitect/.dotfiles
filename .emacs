;;; -*- lexical-binding: t -*-
(require 'package)
(require 'cask "~/.cask/cask.el")
(setq package-archives 
             '(("gnu" . "http://elpa.gnu.org/packages/")
             ("marmalade" . "http://marmalade-repo.org/packages/")
             ("melpa" . "http://melpa.milkbox.net/packages/")))
(add-to-list 'load-path "~/.emacs.d/el-get")
(add-to-list 'load-path "~/emacs/irony-mode/elisp")
;; Keeping these at top due to conflicts
(cask-initialize)
(package-initialize)
(require 'cl)
(require 'advice)
(require 'ensime)
(require 'scala-mode2)
(require 'cedet)
(require 'semantic/sb)
(require 'auto-complete-config)
(require 'egg)
(require 'cedit)
(require 'clj-refactor)
(require 'shm "~/emacs/structured-haskell-mode/elisp/shm.el")
(require 'rainbow-mode "~/emacs/rainbow-mode.el")
(require 'git-gutter-fringe+)
(require 'bundler)
(require 'powerline)
(require 'org-mac-iCal)
(require 'popup)
(require 'irony)
(require 'php-extras)
(require 'dime)
(require 'ac-c-headers)
(require 'php-auto-yasnippets "~/emacs/php-auto-yasnippets/php-auto-yasnippets.el")
(setq php-auto-yasnippet-php-program "~/emacs/php-auto-yasnippets/Create-PHP-YASnippet.php")
(dime-setup '(dime-dylan dime-repl dime-compiler-notes-tree))
(setq dime-dylan-implementations
      '((opendylan ("~/source/opendylan-2013.2/bin/dswank")
                   :env ("OPEN_DYLAN_USER_REGISTRIES=~/source/opendylan-2013.2/sources/registry"))))

;(require 'epc)
;(defvar epc-server (epc:start-epc "python" '("~/emacs/epc-server.py")))
;(deferred:$
;  (epc:call-deferred epc-server 'echo '(10))
;  (deferred:nextc it
;    (lambda (x) (message "Return : %S" x))))

;(message "Return : %S" (epc:call-sync epc-server 'echo '(10 40)))
;(require 'webkit "~/emacs/webkit.el")
(require 'auto-complete-config)

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
     :isearch t
     )))

(setq yas/prompt-functions '(yas/popup-isearch-prompt yas/no-prompt))
(unless (require 'el-get nil 'noerror)
  (with-current-bufferi
   (url-retrieve-synchronously
    "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
   (goto-char (point-max))
   (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/emacs/el-get/recipes")
;(el-get 'sync)

(add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)
(add-hook 'c-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-c-headers)
            (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               ))
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)
(add-hook 'js2-mode-hook 'flymake-jslint-load)
;; (eval-after-load 'tern
;;   '(progn
;;      (require 'tern-auto-complete)
;;      (tern-ac-setup)))
(eval-after-load "ruby-mode"
  '(add-hook 'ruby-mode-hook 'ruby-electric-mode))
(add-hook 'haskell-mode-hook 'structured-haskell-mode)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'scala-mode2-hook 'ensime-scala-hook)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'robe-ac-setup)
(defun backwards-kill-line ()
  (interactive) (kill-region
                 (point) (progn (beginning-of-line) (point))))
(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))))))))


;;; define global mode agnostic keybindings
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-ce" 'compile)
(global-set-key "\C-x\C-k" 'backwards-kill-line)
(global-set-key "\C-co" 'ido-find-file)
(global-set-key "\C-c\C-er" 'eval-region)
(global-set-key "\C-c\C-t" 'multi-term)
(cljr-add-keybindings-with-prefix "C-c C-v")
(js2r-add-keybindings-with-prefix "C-c C-v")

(eval-after-load "paredit-mode"
  '(progn
     (define-key paredit-mode-map (kbd "c-)") 'cedit-or-paredit-slurp)
     (define-key paredit-mode-map (kbd "c-(") 'paredit-backward-slurp-sexp)))
(eval-after-load 'inf-ruby '
  '(define-key inf-ruby-mode-map (kbd "tab") 'auto-complete))
(eval-after-load "php-mode"
  '(progn
;     (define-key php-mode-map (kbd "\C-c\C-f") 'cedit-wrap-brace)
;     (define-key php-mode-map (kbd "\C-c\C-h") 'cedit-up-block-backward)
;     (define-key php-mode-map (kbd "\C-c\C-l") 'cedit-up-block-forward)
     ))
(eval-after-load "haskell-mode"
  '(progn
     (define-key haskell-mode-map (kbd "c-x c-d") nil)
     (define-key haskell-mode-map (kbd "c-c c-z") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "c-c c-l") 'haskell-process-load-file)
     (define-key haskell-mode-map (kbd "c-c c-b") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "c-c c-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "c-c c-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "c-c m-.") nil)
     (define-key haskell-mode-map (kbd "<return>") 'newline)
    (define-key haskell-mode-map (kbd "c-c c-d") nil)))
(eval-after-load 'auto-complete
  '(add-to-list 'ac-modes 'inf-ruby-mode))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(fset 'yes-or-no-p 'y-or-n-p)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))
(add-to-list 'auto-mode-alist '("gemfile". ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.es6$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.coffee" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.scala\\'" . scala-mode2))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.cc\\'" . c++-mode))

(setq backup-directory-alist '(("." . "~/.saves")))
(setq backup-by-copying t)
(setq auto-save-default nil)
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq custom-file "~/.emacs-custom.el")
(setq tramp-default-method "ssh")
(setq lintnode-location "~/.emacs.d/personal/lintnode")
(setq lintnode-jslint-excludes (list 'nomen 'undef 'plusplus 'onevar 'white))
(setq inferior-js-program-command "node")
(setenv "path" (concat (getenv "path") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq evil-default-cursor '("white" bar))
(setq-default indent-tabs-mode nil)
(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
(setq-default scroll-up-aggressively 0.01
              scroll-down-aggressively 0.01)
(setq system-uses-terminfo nil)
(setq vc-handled-backends '(rcs svn cvs sccs bzr hg mtn arch))
(setq ring-bell-function #'ignore)
(setq show-paren-delay 0)
(setq confirm-nonexistent-file-or-buffer nil)
(setq ido-use-faces nil)
(setq gc-cons-threshold 20000000)
(setq projectile-rails-expand-snippet nil)
(setq comment-column 0)
(setq fill-column 0)
(setq shm-program-name "/Users/joshua/emacs/structured-haskell-mode/dist/build/structured-haskell-mode/structured-haskell-mode")

(evil-mode 1)
; (load-theme 'base16-default t)
(load-theme 'solarized-light t)
; (load-theme 'monokai t) 
(ac-config-default)
(global-auto-complete-mode t)
(ido-mode t)
(irony-enable 'ac)
(ido-everywhere t)
(yas-global-mode t)
(ac-config-default)
(desktop-save-mode 1)
(show-paren-mode 1)
(global-ede-mode 1)
(semantic-mode 1)
(global-semantic-idle-completions-mode t)
(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-show-unmatched-syntax-mode t)
(bash-completion-setup)
; (smex-initialize)
(pretty-lambdas)
(global-rbenv-mode)

(defun wl-popup (title msg)
  (interactive)
  (async-shell-command (s-lex-format "terminal-notifier -title '${title}' -message '${msg}'")))
(autoload 'wl "wl" "wanderlust" t)
(autoload 'wl-other-frame "wl" "wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)
(setq wl-init-file "~/.wl")
;(run-at-time 0 (* 1 60) (wl-biff-check-folders))
(add-hook 'wl-biff-notify-hook
          (lambda()
            (wl-popup "Wanderlust" "You have new mail")))
