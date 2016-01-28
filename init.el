;;--------------;;
;;--------------;;
;; Get Packages ;;
;;--------------;;
;;--------------;;


(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/backups"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

(setq package-list '(monokai-theme
                     farmhouse-theme
                     auto-auto-indent
                     browse-kill-ring
                     es-lib
                     auto-complete
                     popup
                     auto-indent-mode
                     color-theme
                     dash
                     expand-region
                     flycheck
                     ;;GOD MODE TESTING
                     god-mode
                     ghc
                     helm
                     ;;icicles
                     impatient-mode
                     htmlize
                     simple-httpd
                     ;;slime
                     ;;slime-repl
                     magit
                     multi-web-mode
                     multiple-cursors
                     mc-extras
                     nyan-mode
                     nyan-prompt
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
                     sql-indent
                     undo-tree
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
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
;;;<<<<<<< HEAD
    ;;;("196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" default)))
;;;=======
    ("30b7087fdd149a523aa614568dc6bacfab884145f4a67d64c80d6011d4c90837" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" default)))
;;;>>>>>>> 1d1d6ac25e7b58062dacc5a92895788468578676
 '(fci-rule-color "#49483E")
 '(highlight-changes-colors ("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   (("#49483E" . 0)
    ("#67930F" . 20)
    ("#349B8D" . 30)
    ("#21889B" . 50)
    ("#968B26" . 60)
    ("#A45E0A" . 70)
    ("#A41F99" . 85)
    ("#49483E" . 100)))
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(package-selected-packages (quote (auto-auto-indent)))
;;;<<<<<<< HEAD
 '(temporary-file-directory "c:/Users/developer/AppData/Local/Temp/")
;;;=======
;;;>>>>>>> 1d1d6ac25e7b58062dacc5a92895788468578676
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
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

;;trying to set capslock to CTRL, regardless of OS
(setq mac-capslock-modifier 'ctrl)

;;(setq mac-function-modifier 'super)
;;(setq mac-option-modifier 'hyper)
(setq mac-command-modifier 'meta)


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

(defadvice terminal-init-screen
    ;; The advice is named `tmux', and is run before `terminal-init-screen' runs.
    (before tmux activate)
  ;; Docstring.  This describes the advice and is made available inside emacs;
  ;; for example when doing C-h f terminal-init-screen RET
  "Apply xterm keymap, allowing use of keys passed through tmux."
  ;; This is the elisp code that is run before `terminal-init-screen'.
  (if (getenv "TMUX")
      (let ((map (copy-keymap xterm-function-map)))
        (set-keymap-parent map (keymap-parent input-decode-map))
        (set-keymap-parent input-decode-map map))))

;;-------------;;
;;-------------;;
;; Keybindings ;;
;;-------------;;
;;-------------;;

;;for annoying reports
(global-set-key (kbd "C-,") 'delete-trailing-whitespace)

;;unbound for tmux to use
(global-unset-key (kbd "C-]"))

;;changed
;;(global-set-key (kbd "C-x <C-return>") 'eval-buffer)
(global-set-key (kbd "C-x RET") 'eval-buffer)

;;removed to not conflict with eval-buffer
;;wasn't cooperating
;;(global-set-key (kbd "C-x RET") 'scroll-all-mode)

(global-set-key (kbd "M-9") 'kill-whole-line)

(global-set-key (kbd "C-.") 'copy-whole-buffer)

(global-set-key (kbd "C-c D") 'kill-buffer-and-delete-file)

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

(defun align-repeat (start end regexp)
    "Repeat alignment with respect to
     the given regular expression."
    (interactive "r\nsAlign regexp: ")
    (align-regexp start end
        (concat "\\(\\s-*\\)" regexp) 1 1 t))

(defun change-outer (str)
  (interactive "sChange outer: ")
  (condition-case nil
      (search-backward str (line-beginning-position))
    (error (search-forward str (line-end-position))
       (forward-char -1)))
  (kill-sexp)
)

;; delete commas
(defun delete-commas (str)
  (interactive "sChange outer: ")
  (condition-case nil
      (search-backward str (line-beginning-position))
    (error (search-forward str (line-end-position))
       (forward-char -1)))
  (kill-sexp)
)


(defun change-inner (str)
  (interactive "sChange inner: ")
  (condition-case nil
      (search-backward str (line-beginning-position))
    (error (search-forward str (line-end-position))
       (forward-char -1)))
  (push-mark)
  (forward-sexp)
  (forward-char -1)
  (exchange-point-and-mark)
  (forward-char 1)
  (kill-region (point) (mark))
)

;;;WORK ON ME!
(defun increment-numbers ()
  "increment by user input, good for adjusting entire layouts (only uses triple digit numbers atm)"
  (interactive)
   ;;;(call-interactively 'query-replace-regexp));;;\b[0-9][0-9][0-9]\b \,(+ \#& 15)))
  (call-interactively 'query-replace-regexp \b[0-9][0-9][0-9]\b \,(+ \#& 15)))

;;create a temporary buffer
(defun generate-buffer ()
  (interactive)
  (switch-to-buffer (make-temp-name "scratch")))

;;
;;CHANGE HTML COMMENT FUNCTIONS TO DETECT PREVIOUS OPEN THEN DELETE MATCH
;;THIS VERSION IS TEMPORARY
;;
(defun html-comment-line ()
  "HTML Comment current line, go to next line, beginning of line"
  (interactive)
  (back-to-indentation)
  (insert "<!--")
  (move-end-of-line nil)
  (insert "-->")
  (next-line)
  (back-to-indentation))

(defun html-uncomment-line ()
  "HTML Uncomment current line, go to next line, beginning of line"
  (interactive)
  (back-to-indentation)
  (delete-forward-char 4)
  (move-end-of-line nil)
  (delete-backward-char 3)
  (next-line)
  (back-to-indentation))

;;MAKE OPPOSITE OF HTML-COMMENT-LINE
(global-set-key (kbd "M-?") 'html-comment-line)
(global-set-key (kbd "C-?") 'html-uncomment-line)

(defun another-line (num-lines)
  "Copies line, preserving cursor column, and increments any numbers found.
  Copies a block of optional NUM-LINES lines.  If no optional argument is given,
  then only one line is copied."
  (interactive "p")
  (if (not num-lines) (setq num-lines 0) (setq num-lines (1- num-lines)))
  (let* ((col (current-column))
         (bol (save-excursion (forward-line (- num-lines)) (beginning-of-line) (point)))
         (eol (progn (end-of-line) (point)))
         (line (buffer-substring bol eol)))
    (goto-char bol)
    (while (re-search-forward "[0-9]+" eol 1)
      (let ((num (string-to-int (buffer-substring
                                 (match-beginning 0) (match-end 0)))))
        (replace-match (int-to-string (1+ num))))
      (setq eol (save-excursion (goto-char eol) (end-of-line) (point))))
    (goto-char bol)
    (insert line "\n")
    (move-to-column col)))
(define-key global-map (kbd "M-o") 'another-line)

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun copy-whole-buffer ()
  "Copy entire buffer to clipboard"
  (interactive)
  (clipboard-kill-ring-save (point-min) (point-max))
  (message "Copied whole buffer"))

(defun kill-buffer-and-delete-file ()
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


;;------------------;;
;; begin slime-mode ;;
;;------------------;;

;;(setq inferior-lisp-program "clisp")
;;(require 'slime)
;;(slime-setup)

;;(require 'slime)
;;(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
;;(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
;; Optionally, specify the lisp program you are using. Default is "lisp"
;;(setq inferior-lisp-program "clisp")
;;(setq inferior-lisp-program "C:\\Users\\developer\\AppData\\Roaming\\clisp-2.49\\clisp")
(setq inferior-lisp-program "clisp")

;;----------------;;
;; end slime-mode ;;
;;----------------;;


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

;; add change-inner package to do great things
;; removed as it did not serve its purpose
;;(require 'change-inner)
;;(global-set-key (kbd "M-i") 'change-inner)
;;(global-set-key (kbd "M-o") 'change-outer)


(require 'browse-kill-ring)
(global-set-key (kbd "C-c k") 'browse-kill-ring)

;;begin multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "M-n") 'mc/mark-next-like-this)
(global-set-key (kbd "M-p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-'") 'mc/mark-all-like-this)
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

;;C-x F to view source
(require 'find-func)
(find-function-setup-keys)

(require 'helm)
(require 'helm-config)

(substitute-key-definition 'find-file 'helm-find-files (current-global-map))
(substitute-key-definition 'execute-extended-command 'helm-M-x (current-global-map))
(substitute-key-definition 'switch-to-buffer 'helm-mini (current-global-map))

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)

(define-key helm-find-files-map (kbd "<C-backspace>") 'backward-kill-word)
;;(define-key helm-projectile-find-file-map (kbd "<C-backspace>") 'backward-kill-word)



;;----------;;
;;----------;;
;; Settings ;;
;;----------;;
;;----------;;

(tool-bar-mode -1)
(menu-bar-mode -1)
(global-hi-lock-mode 1)

;;encoding properly when pasting
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;;show matching braces
;;turn off the delay
(setq show-paren-delay 0)
(show-paren-mode 1)

(setq-default indent-tabs-mode nil)
;;(setq-default tab-width 2)
;;(setq indent-line-function 'insert-tab)
(setq js-indent-level 2)
(setq pascal-indent-level 2)

;;NYAN-MODE!
(when (display-graphic-p)
  (nyan-mode 1))
;;(setq nyan-wavy-trail t)
;;(nyan-start-animation)
;;(nyan-stop-animation)

;;NYAN-PROMPT!
(when (display-graphic-p)
  (add-hook 'eshell-load-hook 'nyan-prompt-enable))

;;truncate when in SQLi mode
(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))


;;------------------------;;
;;------------------------;;
;; add-to-list Extensions ;;
;;------------------------;;
;;------------------------;;

;;nethack! I'm very excited about these extensions ^_^
;;(add-to-list 'load-path "/usr/lib/games/nethack")
;;(autoload 'nethack "nethack" "Play Nethack." t)
;;(setq nethack-program "/usr/lib/games/nethack")

;;icicles! learn regexps
;;(add-to-list 'load-path "~/.emacs.d/elpa/icicles-20150518.406")
;;(require 'icicles)
;;(icy-mode 1)

;;IRC! :D
;;start with M-x erc-select
(add-to-list 'load-path "~/elisp/erc")
(require 'erc)
(setq erc-echo-notices-in-minibuffer-flag t)
(require 'erc-match)
(setq erc-keywords '("test" "emacs"))


;;--------------------;;
;;--------------------;;
;; add-hook for modes ;;
;;--------------------;;
;;--------------------;;

;;(add-hook 'after-init-hook #'global-flycheck-mode)

;;-----------------;;
;;-----------------;;
;; feature testing ;;
;;-----------------;;
;;-----------------;;

(eval-after-load "sql"
  (load-library "sql-indent"))

(defun pretty-print-sgml-do-all ()
  "change modes, pretty print, tab all"
  (interactive)
  (sgml-mode)
  (sgml-pretty-print (point-min) (point-max))
  (mark-whole-buffer)
  (indent-for-tab-command)
  (copy-whole-buffer)
  (message "Prettified, Indented, and Copied whole buffer!"))

;; haskell mode/cabal repl
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(eval-after-load 'haskell-mode '(progn
                                  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
                                  (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
                                  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
                                  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
                                  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
                                  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)))
(eval-after-load 'haskell-cabal '(progn
                                   (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
                                   (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-ode-clear)
                                   (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
                                   (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(custom-set-variables
 '(haskell-interactive-mode-hide-multi-line-errors nil)
 '(haskell-process-log t)
 '(haskell-process-type (quote cabal-repl)))

;; CUSTOM FILE
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)

;;(use-package undo-tree
;;  :defer t
;;  :ensure t
;;  :diminish undo-tree-mode
;;  :idle
;;  (progn
;;    (global-undo-tree-mode)
;;    (setq undo-tree-visualizer-timestamps t)
;;    (setq undo-tree-visualizer-diff t)))

;;------------;;
;;------------;;
;; Load Theme ;;
;;------------;;
;;------------;;


;;(load-theme 'monokai)
(load-theme 'farmhouse-dark)
