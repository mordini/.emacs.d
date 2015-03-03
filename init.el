;this is a test of magit.

(tool-bar-mode -1)
(menu-bar-mode -1)

;testing custom highlights
(font-lock-add-keywords 'web-mode
  '(("butterfly" . font-lock-variable-name-face)))
;(add-hook 'prog-mode-hook
;	  '(lambda ()
;	     (font-lock-add-keywords nil)
;	     '("butterfly" 1)))
;
;(add-hook 'prog-mode-hook
;	  (lambda ()
;	    (font-lock-add-keywords nil
;				    '("butterfly" 1
;				      font-lock-keyword-face t))))


;(mapcar (lambda (mode)
;	  (font-lock-add-keywords
;	   mode
;	   '(("FIXME" 0 'show-paren-mismatch-face))))
;	'(text-mode latex-mode html-mode emacs-lisp-mode
;	  texinfo-mode web-mode nxml-mode))
;end testing



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
php-extras
php-mode
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

;experimental package thing


; fetch the list of packages available
(unless package-archive-contents
  (or (file-exists-p package-user-dir)
      (package-refresh-contents)))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;testing custom highlights
;(font-lock-add-keywords 'web-mode
;  '(("butterfly" . font-lock-keyword-face)))

;(add-hook 'prog-mode-hook
;	  '(lambda ()
;	     (font-lock-add-keywords nil)
;	     '("butterfly" 1)))

;(add-hook 'prog-mode-hook
;	  (lambda ()
;	    (font-lock-add-keywords nil
;				    '("butterfly" 1
;				      font-lock-keyword-face t))))


;(mapcar (lambda (mode)
;	  (font-lock-add-keywords
;	   mode
;	   '(("FIXME" 0 'show-paren-mismatch-face))))
;	'(text-mode latex-mode html-mode emacs-lisp-mode
;	  texinfo-mode web-mode nxml-mode))
;end testing



;special functions
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



; CUA MODE
;(cua-mode t)
;(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
; END CUA MODE

;
; begin keybindings
;

(setq mac-function-modifier 'super)
(setq mac-option-modifier 'hyper)
(setq mac-command-modifier 'meta)

;switch windows with C-x w instead of C-x 5 o
(global-set-key (kbd "C-`") 'other-frame)
;ediff buffers shortcut
(global-set-key (kbd "M-]") 'ediff-buffers)
;(global-set-key (kbd "C-`") 'other-frame)

;(setq mac-function-modifier 'super)
;(setq mac-command-modifier 'hyper)

;uncomment when remoting
(setq w32-lwindow-modifier 'meta)
(setq w32-alt-modifier 'meta)

;use when at work for set rectangular region anchor
;(setq w32-lwindow-modifier 'hyper)

(add-to-list 'auto-mode-alist '("\\.rep\\'" . nxml-mode))

;NOTE that C-M-i is autocomplete/suggest

; begin multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "M-n") 'mc/mark-next-like-this)
(global-set-key (kbd "M-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-<down>") 'mc/mark-all-like-this)
(global-set-key (kbd "M-<up>") 'mc/mark-all-like-this)
(global-set-key (kbd "C-M-<up>") 'set-rectangular-region-anchor)
(global-set-key (kbd "M-[") 'set-rectangular-region-anchor) ; this line is for when on work machine
(global-set-key (kbd "C-S-p") 'mc/mark-pop)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;NOTE write script to automatically add line breaks, commas to SQL separated statements
;;;;NOTE NOTE modify script to accept parameter of where to do this, as in at semi-colons, spaces, etc
; end multiple-cursors



(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;
; end keybindings
;

;PROG-MODE-HOOK
;PROG-MODE-HOOK
;PROG-MODE-HOOK
;PROG-MODE-HOOK
;; WORK IN PROGRESS IMPORTANT!!!! (#S and #D variable highlighting!) USE PROG-MODE-HOOK FOR ALL YAY!!!!!!
; Custom Highlights
;     (add-hook 'nxml-mode-hook
;               (lambda ()
;                (font-lock-add-keywords nil
;                 '((\\<"notices\\>" 1
;                    font-lock-warning-face t)))))

;      (add-hook 'nxml-mode-hook
;               (lambda ()
;                (font-lock-add-keywords nil
;                 '("\\<#D(.*)#\\>" 1
;                    font-lock-warning-face t))))
; end custom highlights

; begin impatient mode



; end impatient mode


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

;
; begin web-mode
;

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

; autopair
(setq web-mode-extra-auto-pairs
      '(("erb"  . (("open" "close")))
        ("php"  . (("open" "close")
                   ("open" "close")))
))
(setq web-mode-enable-auto-pairing t)

; highlighting
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-element-highlight t)

; autocomplete
(setq web-mode-ac-sources-alist
      '(("css" . (ac-source-words-in-buffer ac-source-css-property))
        ("html" . (ac-source-words-in-buffer ac-source-abbrev))
        ("php" . (ac-source-words-in-buffer
                  ac-source-words-in-same-mode-buffers
                  ac-source-dictionary))))


;uncomment to use both php-mode and web-mode

;(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
;(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))


;web-mode indentations (custom-name = 'indent)
;(defun web-mode-hook ()
;  "Hooks for Web mode."
;  (setq web-mode-markup-indent-offset 2)
;  (setq web-mode-css-indent-offset 2)
;  (setq web-mode-code-indent-offset 2)
;)

;use web-mode indentations
;(add-hook 'web-mode-hook  'web-mode-hook)

;turn on auto-indentation
(local-set-key (kbd "RET") 'newline-and-indent)

;delete trailing whitespoace
(add-hook 'local-write-file-hooks
            (lambda ()
               (delete-trailing-whitespace)
               nil))

;;
;; end web-mode
;;

;make right-option the super (s) modifier key
;(setq ns-right-option-modifier ‘super)

;ORIGINAL
; setting Super ＆ Hyper keys for Apple keyboard, for emacs running in OS X
;(setq mac-command-modifier 'meta) ; sets the Command key to Meta
;(setq mac-option-modifier 'super) ; sets the Option key to Super
;(setq mac-control-modifier 'control) ; sets the Control key to Control
;(setq ns-function-modifier 'hyper)  ; set Mac's Fn key to Hyper

;MODIFIED
; setting Super ＆ Hyper keys for Apple keyboard, for emacs running in OS X
;(setq mac-command-modifier 'control) ; sets the Command key to Control
;(setq mac-right-option-modifier 'super) ; sets the Right-Option key to Super
;(setq mac-control-modifier 'meta) ; sets the Control key to Meta
;(setq mac-capslock-modifier 'meta); hopefully sets the capslock key to Meta
;(setq ns-function-modifier 'hyper)  ; set Mac's Fn key to Hyper

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" "57f8801351e8b7677923c9fe547f7e19f38c99b80d68c34da6fa9b94dc6d3297" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun switch-to-minibuffer-window ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-window (active-minibuffer-window))))
(global-set-key (kbd "<f13>") 'switch-to-minibuffer-window)


;uncomment these to use traditional up and down
;in 'shell' buffer to scroll through command history
;otherwise, M-p will allow for previous
;(define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
;(define-key comint-mode-map (kbd "<down>") 'comint-next-input)

;
;
;show matching characters
;
;turn off the delay
(setq show-paren-delay 0)
(show-paren-mode 1)

(defadvice show-paren-function
  (after show-matching-paren-offscreen activate)
  ;"If the matching paren is offscreen, show the matching line in the
  ;echo area. Has no effect if the character before point is not of
  ;the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
         (matching-text (and cb
    (char-equal (char-syntax cb) ?\) )
    (blink-matching-open))))
    (when matching-text (message matching-text))
  )
 )


(global-set-key (kbd "C-z") 'undo)
;(setq visible-bell 1)
;(setq visible-bell 'top-bottom)

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

(load-theme 'monokai)
(tool-bar-mode -1)
(menu-bar-mode -1)

;testing custom highlights
(font-lock-add-keywords 'web-mode
  '(("butterfly" . font-lock-variable-name-face)))
;(add-hook 'prog-mode-hook
;	  '(lambda ()
;	     (font-lock-add-keywords nil)
;	     '("butterfly" 1)))
;
;(add-hook 'prog-mode-hook
;	  (lambda ()
;	    (font-lock-add-keywords nil
;				    '("butterfly" 1
;				      font-lock-keyword-face t))))


;(mapcar (lambda (mode)
;	  (font-lock-add-keywords
;	   mode
;	   '(("FIXME" 0 'show-paren-mismatch-face))))
;	'(text-mode latex-mode html-mode emacs-lisp-mode
;	  texinfo-mode web-mode nxml-mode))
;end testing



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
php-extras
php-mode
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

;experimental package thing


; fetch the list of packages available
(unless package-archive-contents
  (or (file-exists-p package-user-dir)
      (package-refresh-contents)))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))



;special functions
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


; CUA MODE
;(cua-mode t)
;(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
; END CUA MODE

;
; begin keybindings
;

;switch windows with C-x w instead of C-x 5 o
(global-set-key (kbd "C-`") 'other-frame)
;ediff buffers shortcut
(global-set-key (kbd "M-]") 'ediff-buffers)
;(global-set-key (kbd "C-`") 'other-frame)

(setq mac-function-modifier 'super)
(setq mac-option-modifier 'hyper)
(setq mac-command-modifier 'meta)

;(setq mac-function-modifier 'super)
;(setq mac-command-modifier 'hyper)

;uncomment when remoting
;(setq w32-lwindow-modifier 'meta)

;use when at work for set rectangular region anchor
(setq w32-lwindow-modifier 'hyper)

(add-to-list 'auto-mode-alist '("\\.rep\\'" . nxml-mode))

;NOTE that C-M-i is autocomplete/suggest

; begin multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "M-n") 'mc/mark-next-like-this)
(global-set-key (kbd "M-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-<down>") 'mc/mark-all-like-this)
(global-set-key (kbd "C-M-<up>") 'set-rectangular-region-anchor)
(global-set-key (kbd "M-[") 'set-rectangular-region-anchor) ; this line is for when on work machine
;(global-set-key (kbd "C-S-p") 'mc/mark-pop)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)


;NOTE write script to automatically add line breaks, commas to SQL separated statements
;;;;NOTE NOTE modify script to accept parameter of where to do this, as in at semi-colons, spaces, etc
; end multiple-cursors



(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;
; end keybindings
;

;; WORK IN PROGRESS IMPORTANT!!!! (#S and #D variable highlighting!)
; Custom Highlights

;(setq myKeywords
;      '("butterfly" . font-lock-function-name-face)
;      )
;(setq font-lock-defaults '(myKeywords))

;(add-hook 'web-mode-hook
;	  (font-lock-add-keywords nil '("\\butterfly\\" 1 '(:foreground "#FFFF00") t)))



;     (add-hook 'nxml-mode-hook
;               (lambda ()
;                (font-lock-add-keywords nil
;                 '((\\<"butterfly\\>" 1
;                    font-lock-warning-face t)))))

;      (add-hook 'nxml-mode-hook
;               (lambda ()
;                (font-lock-add-keywords nil
;                 '("\\<#D(.*)#\\>" 1
;                    font-lock-warning-face t))))
; end custom highlights

; Begin impatient mode

; end impatient mode


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

;
; begin web-mode
;

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

; autopair
(setq web-mode-extra-auto-pairs
      '(("erb"  . (("open" "close")))
        ("php"  . (("open" "close")
                   ("open" "close")))
))
(setq web-mode-enable-auto-pairing t)

; highlighting
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-element-highlight t)

; autocomplete
(setq web-mode-ac-sources-alist
      '(("css" . (ac-source-words-in-buffer ac-source-css-property))
        ("html" . (ac-source-words-in-buffer ac-source-abbrev))
        ("php" . (ac-source-words-in-buffer
                  ac-source-words-in-same-mode-buffers
                  ac-source-dictionary))))

;uncomment to use both php-mode and web-mode

;(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
;(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))


;web-mode indentations (custom-name = 'indent)
;(defun web-mode-hook ()
;  "Hooks for Web mode."
;  (setq web-mode-markup-indent-offset 2)
;  (setq web-mode-css-indent-offset 2)
;  (setq web-mode-code-indent-offset 2)
;)

;use web-mode indentations
;(add-hook 'web-mode-hook  'web-mode-hook)

;turn on auto-indentation
(local-set-key (kbd "RET") 'newline-and-indent)

;delete trailing whitespoace
(add-hook 'local-write-file-hooks
            (lambda ()
               (delete-trailing-whitespace)
               nil))

;;
;; end web-mode
;;

;make right-option the super (s) modifier key
;(setq ns-right-option-modifier ‘super)

;ORIGINAL
; setting Super ＆ Hyper keys for Apple keyboard, for emacs running in OS X
;(setq mac-command-modifier 'meta) ; sets the Command key to Meta
;(setq mac-option-modifier 'super) ; sets the Option key to Super
;(setq mac-control-modifier 'control) ; sets the Control key to Control
;(setq ns-function-modifier 'hyper)  ; set Mac's Fn key to Hyper

;MODIFIED
; setting Super ＆ Hyper keys for Apple keyboard, for emacs running in OS X
;(setq mac-command-modifier 'control) ; sets the Command key to Control
;(setq mac-right-option-modifier 'super) ; sets the Right-Option key to Super
;(setq mac-control-modifier 'meta) ; sets the Control key to Meta
;(setq mac-capslock-modifier 'meta); hopefully sets the capslock key to Meta
;(setq ns-function-modifier 'hyper)  ; set Mac's Fn key to Hyper

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" "57f8801351e8b7677923c9fe547f7e19f38c99b80d68c34da6fa9b94dc6d3297" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun switch-to-minibuffer-window ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-window (active-minibuffer-window))))
(global-set-key (kbd "<f13>") 'switch-to-minibuffer-window)


;uncomment these to use traditional up and down
;in 'shell' buffer to scroll through command history
;otherwise, M-p will allow for previous
;(define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
;(define-key comint-mode-map (kbd "<down>") 'comint-next-input)

;
;
;show matching characters
;
;turn off the delay
(setq show-paren-delay 0)
(show-paren-mode 1)

(defadvice show-paren-function
  (after show-matching-paren-offscreen activate)
  ;"If the matching paren is offscreen, show the matching line in the
  ;echo area. Has no effect if the character before point is not of
  ;the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
         (matching-text (and cb
    (char-equal (char-syntax cb) ?\) )
    (blink-matching-open))))
    (when matching-text (message matching-text))
  )
 )


(global-set-key (kbd "C-z") 'undo)
;(setq visible-bell 1)
;(setq visible-bell 'top-bottom)


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

(load-theme 'monokai)
