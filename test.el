(message "hello,elisp")
(setq foo "I'm foo")

;;; func test
(defun hello-world(name)
  "say hello to ARG"
  (message "hello,%s" name))
(hello-world "sb")

(defun circle-area (radix)
  (let ((pi 3.1415926)
        area)
  (setq area (* pi radix radix))
  (message "直径%.2f的圆面积为%.2f" radix area)))
(defun circle-area (radix)
  (let* ((pi 3.1415926)
         (area (* pi radix radix)))
    (message "直径%.2f的圆面积为%.2f" radix area)))
(circle-area 3.5)

;;; lambda func test
(setq foo (lambda (name)
            "lambda foo"
            (message "hello,%s" name)))
(funcall foo "Emacser")

;;; 顺序结构
(progn 
  (setq foo 3)
  (message "%d's 2 = %d" foo (* foo foo)))

;;; 分支结构

(defun max-test(a b)
  (if (> a b)
      a b))
(max-test 3 5)


(defun fib(n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (t (+ (fib (- n 1)) 
              (fib (- n 2))))))
(fib 10)

;;; 循环
(defun factorical (n)
  (let ((res 1))
    (while (> n 1)
      (setq res (* res n)
            n (- n 1)))
    res))
(factorical 4)

;;; 逻辑运算
(defun hello(&optional name)
  (or name (setq name "Emacser"))
  (message "hello,%s" name))
(hello)
(hello "walker")

(defun squre-num(n)
  (and (>= n 0)
       (= n (* (sqrt n) (sqrt n)))))
(squre-num -1)
(squre-num 16)

;;; 函数列表
;;  (defun NAME ARGLIST [DOCSTRING] BODY ...)
;;  (defvar SYMBOL &optional INTERACTIVE DOCSTRING)
;;  (setq SYM VAL SYM VAL ...)
;;  (let  VALLIST BODY ...)
;;  (let* VALLIST BODY ...)
;;  (lambda ARGS [DOCSTRING] [INTERACTIVE] BODY ...)
;;  (progn BODY ...)
;;  (if COND THEN ELSE ...)
;;  (cond CLAUSES ...)
;;  (when COND BODY ...)
;;  (unless COND BODY ...)
;;  (or COND ...)
;;  (and COND ...)
;;  (not OBJECT)



;;;; 基本数据类型
;;; 内建primitive types:整数、浮点、cons、symbol、字符串、vector、hash-table,subr(内建函数),
;;; byte-code function和其他特殊类型，如buffer
;; test predicate
(/ 0.0 0.0)
(integerp 1.)
(integerp 1.0)
(numberp 1)
(floatp -0.0e+NaN)
(message "%d,%d,%d,%d,%d,%d" #b10101 #o54 100 #xff #24r1k #8r55)
(= 1 1.0)
(eql 1 1.0)                             ; 也测试类型
(/= 1 1)                                ; 不等于
;;; test float
(defvar fuzz-factor 1.0e-6)
(defun approx-equal (x y)
  (or (and (= x 0) (= y 0))
      (< (/ (abs (- x y))
            (max (abs x) (abs y)))
         fuzz-factor)))
(setq foo 0.0001)
(setq bar 0.0001)
(approx-equal foo bar)
;;; float & integer 转换
(float 1)
(truncate 1.01)                         ;--> 0
(floor 1.01 0.5)                            ;<=
(ceiling 1.01)                          ;>=
(round 1.01)                            ;四舍五入，差最小的
(setq foo 10)
(setq foo (1+ foo))                     ;1+,like ++ in C
(setq foo (1- foo))
;;; cl库里面的++ --宏
;;(remove-if ...)
;;(remove-if-not)
(eval-when-compile
  (require 'cl))
(incf foo)
(decf foo)
;; mod & %允许的参数形式和效果
(+ (mod 5 0.5)
   (* (floor 5 0.5) 0.5))
(+ (% 5 2)
   (* (/ 5 2) 2))
;;; math func
;; sin cos tan asin acos atan sqrt exp expt log logb log10 random 
(abs -1.1)
(exp 2)
(expt 2 10)
(logb 1024)
(log10 100)
(random 1000)
;;; 位运算bitwise
(lsh 5 1)
(ash -6 -1) => -3
(logand 13 12)                          ;&
(logand)                                ;-1
(logior 12 5 7)                         ;or
(logxor 12 5 7)                         ;xor
(lognot 5)                              ;or
;;;; test func list
;; (integerp OBJECT)
;; (floatp OBJECT)
;; (numberp OBJECT)
;; (zerop OBJECT)
;; (wholenump OBJECT)
;;;; cmp func list
;; (> NUM1 NUM1)
;; (< NUM1 NUM1)
;; (>= NUM1 NUM1)
;; (<= NUM1 NUM1)
;; (= NUM1 NUM1)
;; (/= NUM1 NUM1)                          ;!=
;; (eql OBJ1 OBJ2)
;;;; trans func list
;; (float ARG)
;; (truncate ARG &optional DIVISOR)
;; (floor ARG &optional DIVISOR)
;; (ceiling ARG &optional DIVISOR)
;; (round ARG &optional DIVISOR)
;;;; math
;; (+ &rest NUMBERS-OR-MARKERS)
;; (- &optional NUMBERS-OR-MARKERS &rest NUMBERS-OR-MARKERS)
;; (* &rest NUMBERS-OR-MARKERS)
;; (/ dividend divisor &rest divisors)
;; (1+ NUMBER)
;; (1- NUMBER)
;; (abs ARG)
;; (% X Y)
;; (mod X Y)
;; (sin ARG)
;; (cos ARG)
;; (tan ARG)
;; (asin ARG)
;; (acos ARG)
;; (atan Y &optional X)
;; (sqrt ARG)
;; (exp ARG)
;; (expt ARG1 ARG2)
;; (log ARG &optional BASE)
;; (log10 ARG)
;; (logb ARG)
;; (random &optional N)
;;;; var list
;; most-positive-fixnum
;; most-negative-fixnum


;;; char & string
(message "%c,%d" ?A ?\M-A)
(logior (lsh 1 27) ?A)                  ;meta 修饰符，27位变1
;;  emacs 中 2**25(shift),2**24(hyper),2**23(super),2**22(alt)
;; 测试字符串空
(defun string-emptyp (str)
  (not (string< "" str)))
(stringp "")
(string-or-null-p "")                   ;字符或nil时返回t
(char-or-string-p "")
;;; 构造字符串
(make-string 5 ?x)
(string ?a ?b ?c)
(substring "0123456789" 2 9)            ;起点，终点
(concat "hello, " "oh" "yeah~")
(char-equal ?A ?a)                      ;与case-fold-search有关
(string= "abc" "abc")                   ;别名string-equal,没有string>
(string< "abC" "abc")                   ;string-less
(length "abc")
;;; 转换
(string-to-char "abc")
(char-to-string ?a)
(string-to-number "245")
(number-to-string ?a)
(format "%#o" 256)
(format "%#x" 256)
(format "%S" '[?a ?b ?c])               ;%S,对象转换输出
(format "%S" [?a ?b ?c])
(format "%S" '(?a ?b ?c))

(defun number-to-bin-string (number)
  (require 'calculator)
  (let ((calculator-output-radix 'bin)
        (calculator-radix-grouping-mode nil))
    (calculator-number-to-string number)))
(number-to-bin-string 256)
(upcase "hello")
(downcase ?A)
(capitalize "HELLO world")
(upcase-initials "HELLO world")

(concat '(?a ?b ?c))
(concat [?a ?b ?c])
(vconcat "abc")                         ;to vector
(append "abc" nil)                      ;to list

(string-match "34" "012345634")
(string-match "34" "012345634" 5)
(string-match "0*" "0120*0")                ;string-match是regexp匹配
(string-match (regexp-quote "0*") "0120*0") ;
(progn                                      ;正则匹配和字符串捕捉
  (string-match "3\\(4\\)" "012345634" )
  (match-data))
(let ((start 0))
  (while (string-match "34" "0123456789012345678901234" start)
    (princ (format "find at %d\n" (match-beginning 0)))
    (setq start (match-end 0))))
;;; string & buffer text replace
(let ((str "01234567890123456789"))
  (string-match "34" str)
  (princ (replace-match "x" nil nil str 0))
  (princ "\n")
  (princ str))
;; (replace-regexp-in-string "\\(foo\\).*\\'" "bar" " foo foo" nil nil 1)
;; (subst-char-in-string FROMCHAR TOCHAR STRING &optional INPLACE)
;;;; test list
;; (stringp OBJ)
;; (string-or-null-p OBJ)
;; (char-or-string-p OBJ)
;;;; make list
;; (make-string LENGTH INIT)
;; (string &rest CHARS)
;; (substring STRING FROM &optional TO)
;; (concat &rest SEQ)
;;;; cmp list
;; (char-equal C1 C2)
;; (string= S1 S2)
;; (string< S1 S2)
;;;; trans list
;; (char-to-string CHAR)
;; (string-to-char STRING)
;; (number-to-string NUM)
;; (string-to-number STRING &optional BASE)
;; (downcase OBJ)
;; (upcase OBJ)
;; (capitalize OBJ)
;; (upcase-initials OBJ)
;; (format STRING &rest OBJS)
;;;; find & replace list
;; (string-match REGEXP STRING &optional START)
;; (replace-match NEWTEXT &optional FIXEDCASE LITERAL STRING SUBEXP)
;; (replace-regexp-in-string REGEXP REP STRING &optional FIXEDCASE LITERAL SUBEXP START)
;; (subst-char-in-string FROMCHAR TOCHAR STRING &optional INPLACE)


;;;; cons cell & list
;; (car . cdr)
;; '是特殊的函数quote,返回参数而不求值
;; eval-last-sexp,读入S-表达式,对其求值
;; 数字和字符串是自求值的S-表达式，求值前后不变
'(1 . 2)                                ;
(read "(1 . 2)")                        ;自求值
'(1 . nil)                              ;
'(nil . nil)                            ;
'()                                     ;空表不是cons cell
nil                                     ;
(car nil)
(cdr nil)
;;; true list(nil或cons cell);dotted list(既不是nil也不是cons cell);circular list(指向列表之前的一个cons cell)
'(1 2 3)                                ;true
'(1 2 . 3)                              ;dotted
'(1 . #1=(2 3 . #1#))                   ;环形列表读入和输出不同
'(1 . (2 . (3 . nil)))                  ;因为cons cell的CDR可以是任何对象
;;; consp(cons cell test);listp(list test)
(consp '(1 nil))
(consp nil)
(listp '())
(listp nil)
(null nil)                              ;测试对象是否是nil
(null '())                              ;测试对象是否是nil
(cons 1 2)
(cons 1 '())
(setq foo '(a b))
(cons 'x foo)                         ;list前面增加元素，但foo没有变化
(cons foo 'x)
(push 'x foo)                        ;push宏可以增加元素同时改变list值
(append '(a b) '(c) '(d))            ;list后面增加元素，但foo没有变化
(append '(a b) 'c)                   ;因为cons cell的CDR可以是任何对象
(append [a b] "cd" nil)
(append [a b] "cd")
'((+ 2 3) 4)                         ;
(list (+ 2 3) 4)                     ;list make,先求值
(list ?a ?b ?c)
'(a b c)
(list 'a 'b 'c)
(cadr '(0 1 2 3 4))
(nth 3 '(0 1 2 3 4))
(nthcdr 2 '(0 1 2 3 4))
(last '(0 1 2 3 4) 2)
(butlast '(0 1 2 3 4) 2)
(setq foo '(a b c))
(setcdr foo foo)                        ;循环list
(setcar foo 'x)
(setcdr foo '(1 2 3))
(message "%S" foo)
;;; 随意修改
(setq foo '(1 2 3))
(setcar foo 'a)
(setcar (cdr foo) 'b)
(setcar (nthcdr 2 foo) 'c)
foo                                     ; => (a b c)
;;; 当做堆栈用
(setq foo nil)
(push 'a foo)
(push 'b foo)
(pop foo)
foo
;;; list处理
;;; nconc&append类似，但修改除最后一个参数的所有参数
;;; nbutlast&nbutlast类似，以n开头的函数都要小心
(setq foo '(a b c))
(reverse foo)                           ;不修改
foo                                     ;(a b c)
(nreverse foo)                          ;破坏性
foo                                     ;(a)
(setq foo '(3 2 4 1 5))
(sort foo '<)                           ;(3 2 4 1 5)
foo                                     ;(3 4 5)
(sort (copy-sequence foo) '<)           ;复制list
foo
;;; 用作集合
;;; 合并集合append，去重delete-dups，测试元素是否存在:memeq(eq)或member(equal)
;;; 删除元素，可能修改:delq(eq)或delete(equal)，不修改remq/remove
(setq foo '(a b c))
(remq 'b foo)
foo
(delq 'b foo)
foo
(delq 'a foo)
foo
;;;;; 用作map
(make-vector 10 0)

;;;; lips func
;; func,primitvie func,lambda form,special form,macro,command-execute
(defun foo (var1 var2 &optional opt1 opt2 &rest rest)
  (list var1 var2 opt1 opt2 rest))
(foo 1 2)
(foo 1 2 3 4 5 6)
(funcall 'list 'x '(y) '(z))
(apply 'list 'x '(y) '(z))


(defmacro foo (arg)                     ;macro expand
  (list 'message "%d %d" arg arg))
(defun bar (arg)
  (message "%d %d" arg arg))
(let ((i 1))
  (bar (incf i)))
(let ((i 1))
  (foo (incf i)))
(macroexpand '(foo (incf i)))

(defmacro when (cond &rest body)
  (declare (indent 1) (debug t))
  (list 'if cond (cons 'progn body)))
(symbol-plist 'when)
`(a list of ,(+ 2 4) elements)          ;backquote
(setq some-list '(3 4))
`(1 ,some-list 4 ,@some-list)           ;,引用
(defmacro when (cond &rest body)
  `(if ,cond
       (progn ,@body)))


(defun hello (name time)
  (interactive "sSo,what's your name?\nnWhat's the time?")
                                        ;can called through M-x
  (message "Good %s, %s" 
           (cond ((< time 13) "morning")
                 ((< time 19) "afternoon")
                 (t "evening"))
           name))
(hello "google")
(read-string "Name?" user-full-name)
(defun tree-mapcar (func tree)
  "遍历树"
  (if (consp tree)
      (mapcar (lambda (child)
                (tree-mapcar func child))
              tree)
    (funcall func tree)))
;;; regexp
(regexp-quote "\(?:foo\(?:ba[rz]\)?\)")
(regexp-opt '("foobar" "foobaz" "foo"))
;;;;;; buffer
(set-buffer "*Messages*")
(message (buffer-name))
(progn
  (set-buffer "*Messages*")
  (message (buffer-name)))

(save-current-buffer                    ;保存了当前缓冲区
  (set-buffer "*scratch*")
  (goto-char (point-min))
  (set-buffer "*Messages*"))
(save-excursion
;保存了当前缓冲区，还保存了当前位置和mark
  (set-buffer "*scratch*")
  (goto-char (point-min))
  (set-buffer "*Messages*"))
(save-buffers-kill-emacs)
;;; create & close
;; get-buffer-create 有则返回，无则创建
;; generate-new-buffer 有也创建，名字+N
;; kill-buffer
;; (kill-buffer-ask)                       ;comfirmed?
;; (buffer-live-p)
;; (buffer-list)
;;(with-temp-buffer)                      ;临时buffer
;;; move: position & mark
;; (point-min) < (point) < (point-max) < narrow size < (buffer-size) 
(setq foo (mark-marker))
(set-marker foo (point))
(point-marker)
(copy-marker 20)
(copy-marker foo)
(marker-position foo)
(marker-buffer foo)
(transient-mark-mode)                   ;激活mark
;; (set-mark)                              ;设置mark值，并激活mark
;; 每个buffer有一个mark-ring，当前mark被修改，旧值被放到mark-ring，
;; push-mark & pop-mark
;; (region-beginning) (region-end)返回point和mark中较小和较大的值
(goto-char (point-min))
(forward-char 10)
(backward-char 10)
(beginning-of-buffer)                   ;除了移动，还做了其他事，如设置mark等
(end-of-buffer)                         ;
;; (forward-word) & (backward-word)		; word，看语法表格的定义
(forward-line)                          ;移动到下行行首
(forward-line 0)                        ;移动到本行行首
(line-beginning-position)               ;不移动，得到位置
(line-end-position)
(line-number-at-pos)                    ;获得当前行行号
;;(narrow-to-region START END)
;; (widen)
;; point 测试
(bobp)                                  ;begin of buffer predicate
(eobp)
(bolp)                                  ;begin of line predicate
(eolp)
;;; 内容
(buffer-string)                         ;whole buffer
(buffer-substring)                      ;
;; inset insert-char insert-buffer-substring
;; delete-char delete-backward-char delete-region delete-and-extract-region
;; re-search-forward re-search-backward
;; (re-search-forward REGEXP &optional BOUND NOERROR COUNT)
;; replace-match 查找之后进行，不需要指定替换对象
;; 替换后bound可能会发生变化：
;; 1.使用mark记住bound位置；2.narrow-to-region & widen; 3.save-restriction
;;;; window
;; 任何时候都有一个选中的frame,而其中又有一个selected window
(selected-window)                       ;获得激活window
(split-window)
(window-tree)
;; ((nil (0 0 168 44)
;;       #<window 8 on test.el>
;;       (t (84 0 168 44)
;;          #<window 4 on *Help*>
;;          #<window 6 on *scratch*>))
;;  #<window 2 on  *Minibuf-0*>)
(setq foo (selected-window))
(delete-other-window)
(delete-window)
(windowp foo)
(window-live-p foo)
;;; window configuration:窗口大小，显示的buffer，缓冲区中光标位置和mark，fringe，滚动条等
(setq foo (current-window-configuration))
(set-window-configuration foo)
;;; 选择窗口
(progn
  (setq foo (selected-window))
  (message "Original window: %S" foo)
  (other-window 1)
  (message "Current window: %S" (selected-window))
  (select-window foo)
  (message "Back to original window: %S" foo))
;;; save-selected-window & with-selected-window
(save-selected-window
  (select-window (next-window))
  (goto-char (point-min)))

(selected-window)
(window-list)
(next-window)
(next-window (next-window))
(next-window (next-window (next-window)))
;;; walk-windows (traverse) == (mapc proc (window-list))
;; get-window-with-predicate查找符合的窗口
;;; 窗口大小
(window-height)
(window-body-height)
(window-width)
(window-edges)   ;各定点坐标，包括滚动条，fringe,mode line,header line
(window-inside-edges)                   ;文本区位置
(window-pixel-edges)                    ;像素表示
(window-inside-pixel-edges)             ;像素表示
;;; 窗口中的buffer
(window-buffer)
(window-buffer (next-window))
;buffer对应的窗口，返回一个
(get-buffer-window (get-buffer "*scratch*"))
(get-buffer-window-list (get-buffer "*scratch*"))
;; set-window-buffer设置某窗口显示某buffer，或switch-to-buffer(少用)
;; set-buffer 激活buffer
(set-buffer "*scratch*")
(display-buffer "*scratch*")            ;是buffer可见
;;; window-start获得起点位置
;; set-window-start 改变显示起点，但不会改变point位置，而调用redisplay后point会跳转
;; (with-selected-window window (goto-char pos))替代set-window-start
;;;;; file
buffer-file-name                        ;buffer-local
;; set-visited-file-name修改文件名
(find-file "./file.txt")
(with-current-buffer
    (find-file-noselect "./file.txt")
  (buffer-file-name))
(find-buffer-visiting "./file.txt")
(get-file-buffer "./file.txt")

(save-buffer)
(write-buffer "./file.el")
;; 底层的文件读写函数
;; (insert-file-contents filename &optional visit beg end replace)
;; (write-region start end filename &optional append visit lockname mustbenew)
;; 文件信息
(file-exists-p "./file.txt")
(file-readable-p "./file.txt")
(file-writable-p "./file.txt")
(file-executable-p "./file.txt")
(format "%o" (file-modes "./file.txt"))
;; file-regular-p file-directory-p file-symlink-p
;; file-truename链接的真实文件
(file-attributes "./file.txt")
;; 'rename-file 'copy-file 'delete-file 'make-directory
;; 'set-file-times 'set-file-modes 'set-file-name-coding-system
;;; file name 操作
(file-name-directory "./file.txt")
(file-name-nondirectory "./file.txt")
(file-name-sans-extension "./file.txt")
(file-name-extension "./file.txt")
(file-name-sans-versions "./file.txt.~1~")
(file-name-absolute-p "./file.txt")
(file-name-absolute-p "~/file.txt")
(expand-file-name "file.txt")
(expand-file-name "file.txt" "~")
(file-relative-name "/foo/bar" "/shit")
(file-relative-name "/foo/bar" "/foo")
(file-name-as-directory "/foo/bar")     ;显示目录名
(directory-file-name "/foo/bar/")       ;显示为文件名
(convert-standard-filename "c:/windows")
;;; 临时文件
(make-temp-file "foo")
(make-temp-name "foo")
;;; 获得目录中的文件
(directory-files "./")
(directory-files "./" t)
(directory-files "./" nil "^test\\..*$")
(directory-files-and-attributes "./")   ;返回包括file-attributes信息
(file-expand-wildcards "*test[.cehls]*")

;;; 决定何种类型的文件名使用什么方式操作是在file-name-handler-alist定义的
;;; 它是形如(REGEXP . HANDLER)的列表
(defvar header-regexp-list 
  '(("^\\(?:\\(?:G_CONST_RETURN\\|extern\\|const\\)\\s-+\\)?[a-zA-Z][_a-zA-Z0-9]*\\\(?:\\s-*[*]*[ \t\n]+\\|\\s-+[*]*\\)\\([a-zA-Z][_a-zA-Z0-9]*\\)\\s-*(" . 1)
    ("^\\s-*#\\s-*define\\s-+\\([a-zA-Z][_a-zA-Z0-9]*\\)" . 1)))
;;;; text process
(setq foo (concat "abc"
                  (propertize "foo" 'face 'bold
                              'pointer 'hand)))
(get-text-property 3 'face foo)
(save-excursion
  (goto-char (point-min))
  (insert foo))
(get-text-property 4 'face)             ;查找某个属性的值
(text-properties-at 4 foo)              ;得到某位置上文本的所有属性
(let ((str "abc"))
  (put-text-property 0 3 'face 'bold str)
  str)
;; (set-text-properties START END nil)  可直接设置属性，如去掉属性
;; remove-text-properties & remove-list-of-text-properties 去掉区域的指定文本属性
;; 查找文本属性
(next-property-change 1 foo)
(next-single-property-change 1 'pointer foo)
(next-property-change 1 foo)
(previous-property-change 6 foo)
(previous-single-property-change 6 'face foo)
(text-property-any 0 6 'face 'bold foo)
(text-property-not-all 2 6 'face 'underline foo)





