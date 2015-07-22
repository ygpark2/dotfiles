
(setq user-full-name "Young Gyu Park")
(setq user-login-name "ygpark2")
(setq user-mail-address "ygpark2@gmail.ccom")

;; for gmail gnu message
(setq smtpmail-stream-type 'ssl)
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-service 465)

;; (setq ispell-program-name "/opt/local/bin/aspell")

;; key board / input method settings
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(defun disable-guru-mode ()
  (guru-mode -1))

; Disable line wrapping
(setq-default truncate-lines t)

(cond (( string-equal system-type "gnu" )
       ;; change font
       (set-face-attribute 'default nil :font "Monaco-16")
       (message "gnu"))
      (( string-equal system-type "berkeley-unix" )
       (set-face-attribute 'default nil :font "NanumGothicCoding-16")
       (add-to-list 'exec-path "/usr/local/bin/")
       (message "freebsd"))
      (( string-equal system-type "gnu/linux" )
       ;; change font
       (set-face-attribute 'default nil :font "Monaco-16")
       (message "gnu/linux"))
      (( string-equal system-type "darwin" )
       ;; change font
       (set-face-attribute 'default nil :font "Monaco-16")
       (add-hook 'prelude-prog-mode-hook 'disable-guru-mode t)
       (add-to-list 'exec-path "~/Progs/mplayer2/")
       (add-to-list 'exec-path "/opt/local/bin/")
       (message "darwin"))
      (( string-equal system-type "ms-dos" )

       (message "ms-dos"))
      (( string-equal system-type "windows-nt" )
       (message "windows-nt"))
      (( string-equal system-type "cygwin" )
       (message "cygwin"))
      (t
       (message system-type)
       (message "unknown system-type"))
)

; Indentation
(setq-default tab-width 2)              ; 2-space indent as default
(add-hook 'python-mode-hook             ; 2-space indent in python
          '(lambda ()
             (setq python-indent 2)))
(setq js-indent-level 2)                ; 2-space indent for javascript

; Always show whitespaces
(global-whitespace-mode 1)

; Turn xclip on (requires system package xclip installed!)
; (if (boundp 'xclip-mode)
;     (xclip-mode 1))

(require 'google-maps)

;; auto-complete mode
;; (add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20120909.1748")
(when (require 'auto-complete-config nil 'noerror) ;; don't break if not installed
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
  (setq ac-comphist-file  "~/.emacs.d/ac-comphist.dat")
  (ac-config-default))

;; Autoindent mode
;; (setq auto-indent-blank-lines-on-move nil)
;; (auto-indent-global-mode))
