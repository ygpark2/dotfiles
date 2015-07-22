
;; ================================================
;; === Integrated Development Environment (IDE) ===
;; ================================================
;; Mainly rely on Collection Of Emacs Development Environment Tools (CEDET)
;; see http://cedet.sourceforge.net/
;; Nice intro to CEDET:
;;    http://xtalk.msk.su/~ott/en/writings/emacs-devenv/EmacsCedet.html

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;CEDET
(require 'semantic)
(require 'semantic/sb)
(require 'srecode)
(global-ede-mode 1)
(semantic-mode 1)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-completions-mode 1)
(global-semantic-decoration-mode 1)
;(global-semantic-highlight-func-mode 1)
(global-semantic-stickyfunc-mode -1)
(global-semantic-idle-summary-mode 1)
(global-semantic-mru-bookmark-mode 1)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)
(set-default 'semantic-case-fold t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ecb mode
(setq stack-trace-on-error t)
(add-to-list 'load-path "~/.emacs.d/vendor/ecb")
(require 'ecb)
;; (require 'ecb-autoloads)
(ecb-activate)
; (ecb-byte-compile)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  ;; '(ecb-fix-window-size (quote width))
  '(ecb-layout-name "leftright2")
  ;; '(ecb-layout-name "left6")
  ;; '(ecb-layout-window-sizes (quote (("left9" (0.32857142857142857 . 0.9791666666666666)))))
  '(ecb-options-version "2.40")
  '(ecb-windows-width 0.2)
  '(ecb-tree-indent 1)
)

(cond (( string-equal system-type "gnu" )
       (message "gnu ~~~~~~~~~~~~~"))
      (( string-equal system-type "berkeley-unix" )
       (custom-set-variables
        '(ecb-source-path '("/home/ygpark2"
                            "/home/ygpark2/pjt"
                            "/home/ygpark2/pjt/prv/ygpark2.github.io"))
        )
       (message "feebsd ~~~~~~~~~~~~~"))
      (( string-equal system-type "gnu/linux" )
       (custom-set-variables
        '(ecb-source-path '("/home/ygpark2"
                            "/home/ygpark2/pjt"))
        )
       (message "gnu/linux ~~~~~~~~~~~~~"))
      (( string-equal system-type "darwin" )
       (custom-set-variables
        '(ecb-source-path '("/Users/ygpark"
                            "/Users/ygpark/Pjt"
                            "/Users/ygpark/git"))
        )
       (message "darwin ~~~~~~~~~~~~~"))
      (( string-equal system-type "ms-dos" )
       (message "ms-dos ~~~~~~~~~~~~~"))
      (( string-equal system-type "windows-nt" )
       (message "window nt ~~~~~~~~~~~~~"))
      (( string-equal system-type "cygwin" )
       (message "cygwin ~~~~~~~~~~~~~"))
      (t
       (message "unknown system-type"))
      )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq ecb-tip-of-the-day nil)
;; customize the keys for ECB
(define-key ecb-mode-map (kbd "M-0") 'ecb-goto-window-edit1)
(define-key ecb-mode-map (kbd "M-1") 'ecb-goto-window-directories)
(define-key ecb-mode-map (kbd "M-2") 'ecb-goto-window-sources)
(define-key ecb-mode-map (kbd "M-3") 'ecb-goto-window-methods)
(define-key ecb-mode-map (kbd "M-4") 'ecb-goto-window-history)
(define-key ecb-mode-map (kbd "M-5") 'ecb-goto-window-compilation)
