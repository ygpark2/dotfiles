;;; Code:

;; Restore arrow navigation
; (guru-mode -1)
;; bind Meta-Enter to fullscreen mode on Cocoa Emacs
(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)
;; bind CMD+R to reformat code
(global-set-key (kbd "<s-r>") 'reindent)
;; bind Meta+TAB to switch windows
(global-set-key (kbd "<M-tab>") (lambda ()
                                  (interactive)
                                  (other-window -1)))

;; rebind super to navigation
(global-set-key '[(super up)]    'beginning-of-buffer)
(global-set-key '[(super down)]  'end-of-buffer)
(global-set-key '[(super left)]  'beginning-of-line)
(global-set-key '[(super right)] 'end-of-line)

;; cycle through buffers
(global-set-key (kbd "<C-tab>") 'bury-buffer)

;; bind Meta+n to open nav
(global-set-key (kbd "M-n") 'nav)

(global-set-key (kbd "C-c M-i") 'indent-region)
(global-set-key (kbd "C-c M-l") 'goto-line)

;; window resize
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

; Redefine C-<left> and C-<right> to be the same as M-<left> and M-<right>
; They are used by paredit: http://emacswiki.org/emacs/ParEdit
(global-set-key (kbd "C-<left>") 'backward-word)
(global-set-key (kbd "C-<right>") 'forward-word)
;;; global-keybindings.el ends here
