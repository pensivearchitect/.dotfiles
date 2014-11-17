;;; -*- lexical-binding: t -*-
(require 'edmacro)
(require 'cl)
(require 'advice)
(require 'package)
(require 'cask "~/.cask/cask.el")
(setq package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; ELPA is required as queue was moved out of emacs into ELPA
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(cask-initialize)
(package-initialize)

;; Early initialization to make debugging easier
(global-evil-leader-mode)
(evil-mode 1)
(require 'helm-config)
;; Initializes by default for some stupid reason, I don't like using
;; it for M-x
(add-to-list 'load-path "~/emacs/custom/")
;; TODO: Make this display font-lock colors in emacs-lisp mode
;; See what m-x customize is after
(require 'rainbow-mode "~/emacs/vendor/rainbow-mode.el")
(ac-config-default)
;; Used for removing OSX context menus on snippet activation
(require 'popup)
(require 'epa-file)
(require 'mode-setup)
(require 'keybindings)
(require 'utils)
(require 'cl-patch)
(require 'variables)
(require 'filetype_definitions)
(require 'globals)
(display-time-mode t)
