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

;; Whatever the fuck emacs is doing automatically should go below this i hope

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(base16-theme json-mode lsp-mode zig-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
