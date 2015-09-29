;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
     dash
     ruby-on-rails
     rust
     osx
     sql
     yaml
     restclient
     lua
     auto-completion
     emacs-lisp
     shell
     markdown
     org
     syntax-checking
     evil-commentary
     syntax-checking
     themes-megapack
     c-c++
     clojure
     erlang
     elixir
     extra-langs
     html
     javascript
     java
     ruby
     scala
     shell-scripts
     ocaml
     tmux
     dockerfile
     git
     github
     )
   dotspacemacs-additional-packages '(llvm-mode rtags projectile-rails dash-at-point quickrun mmm-mode editorconfig js2-refactor rspec-mode base16-theme)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ruby-enable-ruby-on-rails-support t
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'official
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         base16-default-dark
                         solarized-light
                         monokai
                         spacemacs-dark
                         spacemacs-light
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  (global-set-key "\C-c\C-m" 'execute-extended-command)
  (global-set-key "\C-x\C-m" 'execute-extended-command)
  (global-set-key "\C-w" 'backward-kill-word)
  (global-set-key "\C-x\C-k" 'kill-region)
  (global-set-key "\C-c\C-k" 'kill-region)
                                        ; (global-set-key "\C-x\C-c" 'save-buffers-kill-emacs)
  (global-set-key "\C-x\C-k" 'backwards-kill-line)
  )

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  (require 'editorconfig)
  (require 'flycheck)
  (setq powerline-default-separator 'arrow-fade)
  (evil-ex-define-cmd "Rcontroller" 'projectile-rails-find-current-controller)
  (evil-ex-define-cmd "Rmodel" 'projectile-rails-find-current-model)
  (evil-ex-define-cmd "Rview" 'projectile-rails-find-current-view)
  (evil-ex-define-cmd "Rhelper" 'projectile-rails-find-current-helper)
  (evil-ex-define-cmd "A" 'projectile-rails-find-current-spec)
  (evil-ex-define-cmd "Rspec" 'projectile-rails-find-spec)
  (evil-ex-define-cmd "Rlib" 'projectile-rails-find-lib)
  (evil-ex-define-cmd "Rmigration" 'projectile-rails-find-current-migration)
  (evil-ex-define-cmd "Rjavascript" 'projectile-rails-find-current-javascript)
  (evil-ex-define-cmd "Rstylesheet" 'projectile-rails-find-current-stylesheet)
  (evil-ex-define-cmd "Rfixture" 'projectile-rails-find-current-fixture)
  (evil-ex-define-cmd "Rmailer" 'projectile-rails-find-mailer)
  (evil-ex-define-cmd "Renvironment" 'projectile-rails-find-environment)
  (evil-ex-define-cmd "Rinitializer" 'projectile-rails-find-initializer)
  (evil-ex-define-cmd "Rlayout" 'projectile-rails-find-layout)
  (evil-ex-define-cmd "Rextract" 'projectile-rails-extract-region)
  (evil-ex-define-cmd "Rschema" 'projectile-rails-goto-schema)
  (evil-ex-define-cmd "Rroutes" 'projectile-rails-goto-routes)
  (evil-ex-define-cmd "Rspechelper" 'projectile-rails-goto-spec-helper)
  (evil-ex-define-cmd "Rgemfile" 'projectile-rails-goto-gemfile)
  (evil-leader/set-key "dd" 'dash-at-point)
  (global-hl-line-mode -1)
  (defun seeing-is-believing ()
    "Replace the current region (or the whole buffer, if none) with the output
of seeing_is_believing."
    (interactive)
    (let ((beg (if (region-active-p) (region-beginning) (point-min)))
          (end (if (region-active-p) (region-end) (point-max)))
          (origin (point)))
      (shell-command-on-region beg end "seeing_is_believing" nil 'replace)
      (goto-char origin))
    ;; call erm-reset to fix font locks after sib is called
    (erm-reset))
  (evil-leader/set-key "oc" 'seeing-is-believing)
  (add-to-list 'auto-mode-alist '("\\.jsx$" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.es6$" . js2-mode))
  (setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)))
  (require 'rspec-mode)
  (add-hook 'enh-ruby-mode-hook #'rspec-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
  (eval-after-load "enh-ruby-mode" '(progn (define-key evil-normal-state-map (kbd "RET") 'rspec-verify-matching)))

  (defun eshell/vi (file)
    (find-file file))
  (require 'js2-refactor)
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (setq js2-basic-offset 2)
  (setq racer-rust-src-path "~/src/rust/src")
  (setq racer-cmd "~/racer/target/release/racer")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-safe-themes
   (quote
    ("99fce0c01e01cb934f373a3e8c3224f80be568c6d9a548975a5cb0a0910f0a60" "3539b3cc5cbba41609117830a79f71309a89782f23c740d4a5b569935f9b7726" "75c0b1d2528f1bce72f53344939da57e290aa34bea79f3a1ee19d6808cb55149" "73ae6088787f6f72ef52f19698b25bc6f0edf47b9e677bf0a85e3a1e8a7a3b17" "9f3a4edb56d094366afed2a9ba3311bbced0f32ca44a47a765d8ef4ce5b8e4ea" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "c1390663960169cd92f58aad44ba3253227d8f715c026438303c09b9fb66cdfb" default)))
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "nil" :slant normal :weight normal :height 140 :width normal))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
