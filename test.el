;;; var define
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

