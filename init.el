;;--------------;;
;;--------------;;
;; Get Packages ;;
;;--------------;;
;;--------------;;


(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/._saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

(setq package-list '(monokai-theme
                     auto-auto-indent
                     es-lib
                     auto-complete
                     popup
                     auto-indent-mode
                     color-theme
                     dash
                     expand-region
                     impatient-mode
                     htmlize
                     simple-httpd
                     magit
                     multi-web-mode
                     multiple-cursors
                     ;;php-extras
                     ;;php-mode
                     popup
                     s
                     simple-httpd
                     sunrise-x-buttons
                     sunrise-commander
                     sunrise-x-checkpoints
                     sunrise-commander
                     sunrise-x-loop
                     sunrise-commander
                     sunrise-x-mirror
                     sunrise-commander
                     sunrise-x-modeline
                     sunrise-commander
                     sunrise-x-tabs
                     sunrise-commander
                     sunrise-x-tree
                     sunrise-commander
                     ))



(setq package-enable-at-startup nil)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("ELPA"  . "http://tromey.com/elpa/")
                         ("SC" . "http://joseito.republika.pl/sunrise-commander/")))

;; fetch the list of packages available
(unless package-archive-contents
  (or (file-exists-p package-user-dir)
      (package-refresh-contents)))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'dash)
(require 's)

(-each
    (-map
     (lambda (item)
       (format "~/.emacs.d/elpa/%s" item))
     (-filter
      (lambda (item) (s-contains? "theme" item))
      (directory-files "~/.emacs.d/elpa/")))
  (lambda (item)
    (add-to-list 'custom-theme-load-path item)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" default)))
 '(package-selected-packages (quote (auto-auto-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;uncomment these to use traditional up and down
;;in 'shell' buffer to scroll through command history
;;otherwise, M-p will allow for previous
;;(define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
;;(define-key comint-mode-map (kbd "<down>") 'comint-next-input)

;;---------------;;
;;---------------;;
;; Modifier Keys ;;
;;---------------;;
;;---------------;;

;;(setq mac-function-modifier 'super)
;;(setq mac-option-modifier 'hyper)
;;(setq mac-command-modifier 'meta)

;;(setq mac-function-modifier 'super)
;;(setq mac-command-modifier 'hyper)

;;uncomment when remoting
;;(setq w32-lwindow-modifier 'meta)
;;(setq w32-alt-modifier 'meta)

;;use when at work for set rectangular region anchor
;;(setq w32-lwindow-modifier 'hyper)

(add-to-list 'auto-mode-alist '("\\.rep\\'" . nxml-mode))

;;NOTE that C-M-i is autocomplete/suggest

;;make right-option the super (s) modifier key
;;(setq ns-right-option-modifier ‘super)

;;ORIGINAL
;; setting Super ＆ Hyper keys for Apple keyboard, for emacs running in OS X
;;(setq mac-command-modifier 'meta) ;; sets the Command key to Meta
;;(setq mac-option-modifier 'super) ; sets the Option key to Super
;;(setq mac-control-modifier 'control) ; sets the Control key to Control
;;(setq ns-function-modifier 'hyper)  ; set Mac's Fn key to Hyper

;;MODIFIED
;; setting Super ＆ Hyper keys for Apple keyboard, for emacs running in OS X
;;(setq mac-command-modifier 'control) ; sets the Command key to Control
;;(setq mac-right-option-modifier 'super) ; sets the Right-Option key to Super
;;(setq mac-control-modifier 'meta) ; sets the Control key to Meta
;;(setq mac-capslock-modifier 'meta); hopefully sets the capslock key to Meta
;;(setq ns-function-modifier 'hyper)  ; set Mac's Fn key to Hyper


;;-----------------;;
;;-----------------;;
;; Function Advise ;;
;;-----------------;;
;;-----------------;;


(defadvice show-paren-function
    (after show-matching-paren-offscreen activate)
  ;;"If the matching paren is offscreen, show the matching line in the
  ;;echo area. Has no effect if the character before point is not of
  ;;the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
         (matching-text (and cb
                             (char-equal (char-syntax cb) ?\) )
                             (blink-matching-open))))
    (when matching-text (message matching-text))
    )
  )


;;-------------;;
;;-------------;;
;; Keybindings ;;
;;-------------;;
;;-------------;;

(global-set-key (kbd "C-.")  'copy-whole-buffer)

(global-set-key (kbd "C-x RET")  'eval-buffer)

(global-set-key (kbd "C-c D")  'delete-file-and-buffer)

;;replace dabbrev
(global-unset-key (kbd "M-/"))
(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "<f13>") 'switch-to-minibuffer-window)
(global-set-key "\C-x\\" 'indent-buffer)

;;switch windows with C-x ` instead of C-x 5 o
(global-set-key (kbd "C-`") 'other-frame)
;;ediff buffers shortcut
(global-set-key (kbd "M-]") 'ediff-buffers)
;;(global-set-key (kbd "C-`") 'other-frame)

(global-unset-key (kbd "C-/"))
(local-unset-key (kbd "C-/"))
(global-set-key (kbd "C-/") 'pjb-electric-close-brace)
(global-set-key (kbd "C-z") 'undo)

;;unset C-x C-c for using emacs as server
;;(global-unset-key (kbd "C-x C-c") )
;;(global-set-key (kbd "C-x C-c") 'server-edit)

;;-----------;;
;;-----------;;
;; Functions ;;
;;-----------;;
;;-----------;;

(defun copy-whole-buffer ()
    "Copy entire buffer to clipboard"
    (interactive)
    (clipboard-kill-ring-save (point-min) (point-max)))

(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))

(defun uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))

(defun indent-buffer ()
  "Indents an entire buffer using the default intenting scheme."
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))))

(defun switch-to-minibuffer-window ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-window (active-minibuffer-window))))

;;pjb: notice that C-mode has it's own electric brace, so you have to evaluate the local-set-key after setting the mode (eg. in a mode hook).
(defun pjb-electric-close-brace ()
  (interactive)
  ;;(insert "}")
  (let ((pt (point)))
    (backward-list)
    (let ((head (buffer-substring (save-excursion (beginning-of-line) (point))
                                  (point))))
      (goto-char pt)
      (insert " // Matches " head))))
;;(local-set-key (kbd "}") 'pjb-electric-close-brace)


;; Replace "yes or no" with y or n
(defun yes-or-no-p (arg)
  "An alias for y-or-n-p, because I hate having to type 'yes' or 'no'."
  (y-or-n-p arg))


(defun my-terminal-visible-bell ()
  "A friendlier visual bell effect."
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil 'invert-face 'mode-line))

(setq visible-bell nil
      ring-bell-function 'my-terminal-visible-bell)
;;(setq visible-bell 1)
;;(setq visible-bell 'top-bottom)


;;-------;;
;;-------;;
;; Modes ;;
;;-------;;
;;-------;;


;;----------------;;
;; begin web-mode ;;
;;----------------;;

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))


(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-indent-style 2)

;;autopair
(setq web-mode-extra-auto-pairs
      '(("erb"  . (("open" "close")))
        ("php"  . (("open" "close")
                   ("open" "close")))
        ))
(setq web-mode-enable-auto-pairing t)

;;highlighting
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-element-highlight t)

;;autocomplete
(setq web-mode-ac-sources-alist
      '(("css" . (ac-source-words-in-buffer ac-source-css-property))
        ("html" . (ac-source-words-in-buffer ac-source-abbrev))
        ("php" . (ac-source-words-in-buffer
                  ac-source-words-in-same-mode-buffers
                  ac-source-dictionary))))


;;uncomment to use both php-mode and web-mode

;;(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
;;(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))


;;web-mode indentations (custom-name = 'indent)
;;(defun web-mode-hook ()
;;  "Hooks for Web mode."
;;  (setq web-mode-markup-indent-offset 2)
;;  (setq web-mode-css-indent-offset 2)
;;  (setq web-mode-code-indent-offset 2)
;;)

;;use web-mode indentations
;;(add-hook 'web-mode-hook  'web-mode-hook)

;;turn on auto-indentation
(local-set-key (kbd "RET") 'newline-and-indent)

;;delete trailing whitespoace
(add-hook 'local-write-file-hooks
          (lambda ()
            (delete-trailing-whitespace)
            nil))

;;--------------;;
;; end web-mode ;;
;;--------------;;

;;----------------;;
;; begin cua-mode ;;
;;----------------;;

;;(cua-mode t)
;;(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;;(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;;--------------;;
;; end cua-mode ;;
;;--------------;;


;;---------;;
;;---------;;
;; Special ;;
;;---------;;
;;---------;;

;;begin multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "M-n") 'mc/mark-next-like-this)
(global-set-key (kbd "M-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-<down>") 'mc/mark-all-like-this)
(global-set-key (kbd "M-<up>") 'mc/mark-all-like-this)
(global-set-key (kbd "C-M-<up>") 'set-rectangular-region-anchor)
;;(global-set-key (kbd "M-[") 'set-rectangular-region-anchor) ; this line is for when on work machine
(global-set-key (kbd "C-S-p") 'mc/mark-pop)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;;NOTE write script to automatically add line breaks, commas to SQL separated statements
;;;;NOTE NOTE modify script to accept parameter of where to do this, as in at semi-colons, spaces, etc
;;end multiple-cursors

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;;----------;;
;;----------;;
;; Settings ;;
;;----------;;
;;----------;;

(tool-bar-mode -1)
(menu-bar-mode -1)
(global-hi-lock-mode 1)

;;show matching braces
;;turn off the delay
(setq show-paren-delay 0)
(show-paren-mode 1)


;;------------;;
;;------------;;
;; Load Theme ;;
;;------------;;
;;------------;;


(load-theme 'monokai)
