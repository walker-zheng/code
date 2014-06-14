(setenv "HOME" "E:/backup")
(setenv "PATH" "E:/backup")
;;set the default file path
(setq default-directory "~/")

(menu-bar-mode nil)
(tool-bar-mode nil)
(scroll-bar-mode nil)
(setq linum-mode t)

;; (let ((buffer (url-retrieve-synchronously
;;                "http://tromey.com/elpa/package-install.el")))
;;   (save-excursion
;;     (set-buffer buffer)
;;     (goto-char (point-min))
;;     (re-search-forward "^$" nil 'move)
;;     (eval-region (point) (point-max))
;;     (kill-buffer (current-buffer))))
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


(load "~/.emacs.d/.wcy.emacs")
;; (load "~/.emacs.d/.emacs")


;; ahei .emacs
(defconst my-emacs-path "~/.emacs.d/" "我的emacs相关配置文件的路径")
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "my-lisps/") "我自己写的emacs lisp包的路径")
;;(defconst my-emacs-lisps-path     (concat my-emacs-path "lisps/") "我下载的emacs lisp包的路径")
(defconst my-emacs-templates-path (concat my-emacs-path "templates/") "Path for templates")

;; 把`my-emacs-lisps-path'的所有子目录都加到`load-path'里面
(load (concat my-emacs-my-lisps-path "my-subdirs.el"))
;;(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)

;; 一些基本的小函数
(require 'ahei-misc)
(require 'eval-after-load)
(require 'util)

;; 显示行号
(require 'linum-settings)

;; color theme Emacs主题
(require 'color-theme-settings)

(require 'ahei-face)
;;(require 'color-theme-ahei)
;;(require 'face-settings)

;; 高亮当前行
(require 'hl-line-settings)

;; 字体配置
;;(require 'font-settings)

;; time-stamp, 在文件头记录修改时间, 并动态更新
(require 'time-stamp-settings)

;; 简写模式
(setq-default abbrev-mode t)
(setq save-abbrevs nil)

;; 返回到最近去过的地方
(require 'recent-jump-settings)

;; erc: Emacs中的IRC
;; ERC使用简介 emacser.com/erc.htm
(require 'erc-settings)

;; 可以把光标由方块变成一个小长条
(require 'bar-cursor)

;; twitter client
(require 'eagle-settings)
(require 'twit-settings)

;; Emacs才是世界上最强大的IDE － 用Emaci阅读文件
;; http://emacser.com/emaci.htm
(require 'emaci-settings)

;; 大纲mode
(require 'outline-settings)

;; org是一个非常强大的GTD工具
(require 'org-settings)

;; 强大的发布工具
(require 'muse-settings)

;; 用weblogger写WordPress博客
;; http://emacser.com/weblogger.htm
(require 'weblogger-settings)

;;(require 'evernote-mode-settings)

(require 'color-theme)
(color-theme-initialize)
;;(color-theme-ahei)
(color-theme-digital-ofs1)
;;(color-theme-mistyday)
;;(color-theme-tty-dark)
;; (funcall (car (nth (random (length color-themes)) color-themes)))


(desktop-save-mode 1)
;;(desktop-read)
(defun toggle-full-screen ()
  "Toggles full-screen mode for Emacs window on Win32."
  (interactive)
  (shell-command
   "emacs_fullscreen.exe"))
(defun toggle-max-screen ()
  "Toggles full-screen mode for Emacs window on Win32."
  (interactive)
  (shell-command
   "w32toggletitle.exe"))
;;(toggle-full-screen)

(require 'w32-fullscreen)
;;(w32-fullscreen)
;;(w32-fullscreen-maximize-frame)
(toggle-full-screen)
(w32-fullscreen-restore-frame)
(w32-fullscreen-maximize-frame)
(w32-fullscreen)
(toggle-full-screen)
