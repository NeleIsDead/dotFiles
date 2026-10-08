;; -*- lexical-binding: t; -*-

(load-theme 'base16-atelier-cave t)
(setq inhibit-startup-message t
      auto-save-default nil
      make-backup-files nil    )
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)

(set-frame-font "MapleMono 12" nil t)

(setq compilation-environment '("TERM=dumb" "COLORTERM=" "NO_COLOR=1"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq lsp-zig-zls-executable "~/.local/share/lsp/zls")
(with-eval-after-load 'eglot (add-to-list 'eglot-server-programs '(zig-mode . ("~/.local/share/lsp/zls" :initializationOptions()))))


;; automatically goes make-directory RET RET hopefully
(defun er-auto-create-missing-dirs ()
  (let ((target-dir (file-name-directory buffer-file-name)))
    (unless (file-exists-p target-dir)
      (make-directory target-dir t))))

(add-to-list 'find-file-not-found-functions #'er-auto-create-missing-dirs)

; Source - https://stackoverflow.com/a/50855606
; Posted by Peter Cordes
; Retrieved 2026-09-30, License - CC BY-SA 4.0
(defun my-asm-mode-hook ()
  ;; you can use `comment-dwim' (M-;) for this kind of behaviour anyway
  (local-unset-key (vector asm-comment-char))
  ;; (local-unset-key "<return>") ; doesn't work. "RET" in a terminal.  http://emacs.stackexchange.com/questions/13286/how-can-i-stop-the-enter-key-from-triggering-a-completion-in-company-mode
  (electric-indent-local-mode)  ; toggle off
;  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  ;; asm-mode sets it locally to nil, to "stay closer to the old TAB behaviour".
  ;; (setq tab-always-indent (default-value 'tab-always-indent))

  (defun asm-calculate-indentation ()
  (or
   ;; Flush labels to the left margin.
   (and (looking-at "[.@_[:word:]]+:") 0)
   ;; Same thing for `;;;' comments.
   (and (looking-at "\\s<\\s<\\s<") 0)
   ;; %if nasm macro stuff goes to the left margin
   (and (looking-at "%") 0)
   (and (looking-at "c?global\\|section\\|default\\|align\\|INIT_..X") 0)
   ;; Simple `;' comments go to the comment-column
   ;(and (looking-at "\\s<\\(\\S<\\|\\'\\)") comment-column)
   ;; The rest goes at column 4
   (or 4)))
  )

(add-hook 'asm-mode-hook #'my-asm-mode-hook)

;; Whatever the fuck emacs is doing automatically should go below this i hope

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(base16-theme json-mode jupyter lsp-mode make-color markdown-mode
		  zig-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
