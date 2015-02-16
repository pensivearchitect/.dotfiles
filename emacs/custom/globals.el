;; Various functions that initialize across all modes
(ac-config-default)
(global-auto-complete-mode t)
(ido-mode t)
(ido-everywhere t)
(flx-ido-mode 1)
(yas-global-mode t)
(ac-config-default)
; (show-paren-mode 1)
(global-ede-mode 1)
(display-battery-mode 1)
(semantic-mode 1)
(global-semantic-idle-completions-mode t)
(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-show-unmatched-syntax-mode t)
(bash-completion-setup)
(smex-initialize)
(global-rbenv-mode t)
(windmove-default-keybindings)
(global-evil-surround-mode 1)
(desktop-save-mode 1)
(global-fixmee-mode 1)
(set-default-themes "Inconsolata")
;; (set-default-themes "Fantasque Sans Mono")
(load-theme 'waher t)

(provide 'globals)