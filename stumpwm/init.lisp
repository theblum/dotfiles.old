(in-package :stumpwm)

;; Create server to connect SLIME to
(ql:quickload :swank)
(swank:create-server :port 4004
                     :style swank:*communication-style*
                     :dont-close t)

(setf *startup-message* nil
      *suppress-abort-messages* t
      *shell-program* (getenv "SHELL"))

(defun get-xres-color (num)
  (run-shell-command (format nil "xrdb -query | awk '/^*color~a:/ {printf \"%s\", $2}'" num) t))

(setf *colors* (list (get-xres-color 0)   ;; black
		     (get-xres-color 1)   ;; red
		     (get-xres-color 2)   ;; green
		     (get-xres-color 3)   ;; yellow
		     (get-xres-color 4)   ;; blue
		     (get-xres-color 5)   ;; magenta
		     (get-xres-color 6)   ;; cyan
		     (get-xres-color 7))) ;; white

(set-fg-color (nth 7 *colors*))
(set-bg-color (nth 0 *colors*))
(set-border-color (nth 4 *colors*))
(set-focus-color (nth 4 *colors*))
(set-unfocus-color (nth 6 *colors*))
(set-win-bg-color (nth 0 *colors*))
(set-float-focus-color (nth 4 *colors*))
(set-float-unfocus-color (nth 6 *colors*))

(update-color-map (current-screen))

(setf *message-window-gravity* :center
      *input-window-gravity* :center
      *window-border-style* :thin
      *message-window-padding* 15
      *message-window-y-padding* 15
      *maxsize-border-width* 1
      *normal-border-width* 1
      *transient-border-width* 1
      stumpwm::*float-window-border* 1
      stumpwm::*float-window-title-height* 10
      *mouse-focus-policy* :click)

(set-normal-gravity :center)
(set-maxsize-gravity :center)
(set-transient-gravity :center)

;; Set default font
(ql:quickload :clx-truetype)
(load-module :ttf-fonts)
(set-font (make-instance 'xft:font :family "Inconsolata" :subfamily "Regular" :size 12 :antialias t))

;; Set gaps
(load-module :swm-gaps)
(setf swm-gaps:*inner-gaps-size* 10
      swm-gaps:*outer-gaps-size* 15)
(swm-gaps:toggle-gaps)

(define-key *root-map* (kbd "e") "exec emacsclient -nc")
(define-key *root-map* (kbd "C-e") "exec emacsclient -nc")

(define-key *root-map* (kbd "c") "exec urxvt")
(define-key *root-map* (kbd "C-c") "exec urxvt")
