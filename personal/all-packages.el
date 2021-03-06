;;; Code:

(defvar personal-packages
  '(textmate
    auto-complete
    ecb
    emms
    ess
    org
    google-maps
    pony-mode
    haml-mode
    jump
    undo-tree
    yaml-mode
    )
  "A list of personal packages to ensure are installed at launch.")


(defun personal-packages-installed-p ()
  (loop for p in personal-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun personal-install-packages ()
  (unless (personal-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs prelude-personal is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (dolist (p personal-packages)
      (unless (package-installed-p p)
        (package-install p)))))

(personal-install-packages)
