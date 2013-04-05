;;; Code:

;; change size of frame
;; (add-to-list 'default-frame-alist '(height . 49))
;; (add-to-list 'default-frame-alist '(width . 120))

;; disable bell
(setq ring-bell-function 'ignore)

;; personal Emacs 24 color themes support
(add-to-list 'custom-theme-load-path (concat prelude-personal-dir "themes/"))

(when window-system
    ;; hide scroll-bar
    (scroll-bar-mode 0))
    ;; (load-theme 'django t))

;; turn off the visible cursor in non-selected windows
(setq-default cursor-in-non-selected-windows nil)
;; turn off fringe indicators
(setq-default fringe-indicator-alist ())

(if (fboundp 'fringe-mode)
    (fringe-mode '(nil . 0)))

    ;(fringe-mode 8 '('left-only)))
; (set-fringe-style 'left-only)

;; enable transparency
;;(set-frame-parameter (selected-frame) 'alpha '(95 95))

;; display ido completation verticaly
(setq ido-decorations
      '("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]"))


(provide 'personal-ui)
;;; prelude-personal-ui.el ends here
