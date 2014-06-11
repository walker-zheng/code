;;; code snippets
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;	ansi common lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;	第三章 list
;; our-copy-list
(defun our-copy-list (lst)
 (if (atom lst)
     lst
     (cons (car lst) (our-copy-list (cdr lst)))))

;; our-copy-tree 双重递归
(defun our-copy-tree (tr)
  (if (atom tr)
      tr
      (cons (our-copy-tree (car tr))
            (our-copy-tree (cdr tr)))))
(our-copy-tree '((1 3) 1 (3 3) 2 3)) 
(our-copy-list '((1 3) 1 (3 3) 2 3))

;; list subs
(substitute 'y 'x '(and (integerp x) (zerop (mod x 2))))
;; tree subs
(subst 'y 'x '(and (integerp x) (zerop (mod x 2))))

;; len
(defun our-len (lst)
    (if (null lst)
        0
        (+ (len (cdr lst)) 1)))
(our-len '((1 3) 1 (3 3) 2 3))
(our-len '( 1 2 2 3))

;;; set
(member 'b '(a b c))
;; 重写默认方法
(member 'b '(a b (z)) :test #'equal)

;;; 并集，交集，补集
 (union '(a b c) '(c b s))
 (intersection '(a b c) '(b b c))
 (set-difference '(a b c d e) '(b e))

;;; sequences包括lists和vectors
(subseq '(a b c d) 1 2)
(subseq '(a b c d) 1)

(defun our-mirror (lst)
  (equal lst
         (reverse lst)))
(defun our-mirror? (s)
  (let ((len (length s)))
    (and (evenp len)
         (let ((mid (/ len 2)))
           (equal (subseq s 0 mid)
                  (reverse (subseq s mid)))))))
(our-mirror '((1 3) 1 3 1 (1 3)))
(our-mirror? '((1 3) 1 3 1 (1 3)))
(our-mirror? '( 1 3 3 1))

;; sort (destructive)
(sort '(0 2 1 3 8) #'<)
(defun nthmost (n lst)
  (nth (- n 1)
       (sort (copy-list lst) #'>)))
(nthmost 3 '(1 3 0 8 5))		;; 零索引

;; test
 (every #'oddp '(1 3 5))
(some #'evenp '(1 2 3))
(every #'> '(1 3 5) '(0 2 4))		;; 测试次数为最短序列

;; reverse with stack 
(defun our-reverse (lst)
  (let ((acc nil))
    (dolist (elt lst)
      (push elt acc))
    acc))
(our-reverse '(1 3 4 5 2))
;; pushnew 新元素入栈
(let ((x '(a b)))
     (pushnew 'c x)
     (pushnew 'a x)
     x)


;;; dotted list
(cons 'a 'b)
'(a . (b . (c . nil)))

;;; assoc list
(setf trans '((+ . "add") (- . "subtract")))
(assoc '+ trans)

;;; 广度优先搜索 breadth-first search
(defun shortest-path (start end net)
  (bfs end (list (list start)) net))

(defun bfs (end queue net)
  (if (null queue)
      nil
      (let ((path (car queue)))
        (let ((node (car path)))
          (if (eql node end)
              (reverse path)
              (bfs end
                   (append (cdr queue)
                           (new-paths path node net))
                   net))))))

(defun new-paths (path node net)
  (mapcar #'(lambda (n)
              (cons n path))
          (cdr (assoc node net))))

(setf min '((a b c) (b c) (c d)))
(shortest-path 'a 'd min)


;;; debug
(trace new-paths)
(trace bfs)
(trace shortest-path)
(untrace)


;;;; 顺序并集
(defun new-union (start end)
  (let ((one (car end)))
    (if (null end)
        start
        (if (member one start)
            (new-union start (cdr end))
            (new-union (append start (list one)) (cdr end))))))
(trace new-union)
(untrace new-union)
 (new-union '(a b c) '(b a d))

;;;;	第四章 特殊数据结构
;; array init get & set
(setf arr (make-array '(2 3) :initial-element nil))
(setf (aref arr 0 0) 'b)
(aref arr 0 0)
arr
;; vector
 (setf vec (make-array 4 :initial-element 1))
(vector "a" "str" 4)
(svref vec 0)		;; 比sref快，简单向量

;;; 二叉搜索
(defun bin-search (obj vec)
  (let ((len (length vec)))
    (and (not (zerop len))
         (finder obj vec 0 (- len 1)))))

(defun finder (obj vec start end)
  ;; 打印搜索过程
  (format t "~A~%" (subseq vec start (+ end 1)))
  (let ((range (- end start)))
    (if (zerop range)
        (if (eql obj (aref vec start))
            obj
            nil)
        (let ((mid (+ start (round (/ range 2)))))
          (let ((obj2 (aref vec mid)))
            (if (< obj obj2)
                (finder obj vec start (- mid 1))
                (if (> obj obj2)
                    (finder obj vec (+ mid 1) end)
                    obj)))))))
(bin-search  #(0 1 2 3 4 5 6 7 8 9))
;;	(+ 3 (round (/ 5 3)))
(trace bin-search)

;; string & char
(sort "elbow" #'char<)
(char "abc" 1)		;; 比aref快，序列与数组的函数都可以用在字串

(let ((str (copy-seq "Merlin")))
  (setf (char str 3) #\k)
  str)
(equal "fred" "Fred")
(string-equal "fred" "Fred")
(format nil "~A or ~A" "truth" "dare")
(concatenate 'string "not " "to worry")

;;; sequences
;;; 列表仅允许循序存取，向量为随机存取
(our-mirror "abbcbba")
(our-mirror? "abbbba")
 (position #\a "fantasia" :start 3 :end 5)
;	参数 	用途 					缺省值
;	:key 	应用至每个元素的函数 	identity
;	:test 	作来比较的函数 			eql
;	:from-end 	若为真，反向工作。 	nil
;	:start 	起始位置 				0
;	:end 	若有给定，结束位置。 	nil
(position '(a b) '((a b) (c d)))
(position '(a b) '((a b) (c d)) :test #'equal)

(defun second-word (str)
  (let ((p1 (+ (position #\  str) 1)))
    (subseq str p1 (position #\  str :start p1))))
(second-word "Form follows function")
(position-if #'oddp '(2 3 4 5))

;; 谓词解读，为fun+key的形式更好理解，以下等价
(find-if #'(lambda (x)
             (eql (car x) 'complete))
         lst)
(find 'complete lst :key #'car)

(remove-duplicates "abracadabra")
(reduce #'intersection '((b r a d 's) (b a d) (c a t)))	;重复调用func

;; 解析日期
(defun tokens (str test start)
  (let ((p1 (position-if test str :start start)))
    (if p1
        (let ((p2 (position-if #'(lambda (c)
                                   (not (funcall test c)))
                               str :start p1)))
          (cons (subseq str p1 p2)
                (if p2
                    (tokens str test p2)
                    nil)))
        nil)))

(defun constituent (c)
  (and (graphic-char-p c)
       (not (char= c #\ ))))
(defun parse-date (str)
  (let ((toks (tokens str #'constituent 0)))
    (list (parse-integer (first toks))
n          (parse-month (second toks))
          (parse-integer (third toks)))))

(defconstant month-names
  #("jan" "feb" "mar" "apr" "may" "jun"
    "jul" "aug" "sep" "oct" "nov" "dec"))

(defun parse-month (str)
  (let ((p (position str month-names
                         :test #'string-equal)))
    (if p
        (+ p 1)
        nil)))
(parse-date "16 Aug 1980")

;; str转integer
(defun read-integer (str)
  (if (every #'digit-char-p str)
      (let ((accum 0))
        (dotimes (pos (length str))
          (setf accum (+ (* accum 10)
                         (digit-char-p (char str pos)))))
        accum)
    nil))


;;;; 4.6结构
;; 宏自动生成make-point 、 point-p 、 copy-point 、 point-x 及 point-y
;; 等函数
(defstruct point
  x
  y)
(setf p (make-point :x 9 :y 0))
(point-x p)
(setf (point-y p) 2)

; 改名&显示
(defstruct (point (:conc-name p)
                  (:print-function print-point))
  (x 0)
  (y 0))
(defun print-point (p stream depth)
  (format stream "#<~A, ~A>" (px p) (py p)))
(make-point)
(px p)

;;; 二叉搜索树
(defstruct (node (:print-function
                  (lambda (n s d)
                    (format s "#<~A>" (node-elt n)))))
  elt (l nil) (r nil))

(defun bst-insert (obj bst <)
  (if (null bst)
      (make-node :elt obj)
      (let ((elt (node-elt bst)))
        (if (eql obj elt)
            bst
            (if (funcall < obj elt)
                (make-node
                   :elt elt
                   :l (bst-insert obj (node-l bst) <)
                   :r (node-r bst))
                (make-node
                   :elt elt
                   :r (bst-insert obj (node-r bst) <)
                   :l (node-l bst)))))))

(defun bst-find (obj bst <)
  (if (null bst)
      nil
      (let ((elt (node-elt bst)))
        (if (eql obj elt)
            bst
            (if (funcall < obj elt)
                (bst-find obj (node-l bst) <)
                (bst-find obj (node-r bst) <))))))

(defun bst-min (bst)
  (and bst
       (or (bst-min (node-l bst)) bst)))

(defun bst-max (bst)
  (and bst
       (or (bst-max (node-r bst)) bst)))
(defun bst-remove (obj bst <)
  (if (null bst)
      nil
      (let ((elt (node-elt bst)))
        (if (eql obj elt)
            (percolate bst)
(if (funcall < obj elt)
    (make-node
     :elt elt
     :l (bst-remove obj (node-l bst) <)
     :r (node-r bst))
    (make-node
     :elt elt
     :r (bst-remove obj (node-r bst) <)
     :l (node-l bst)))))))

(defun percolate (bst)
  (let ((l (node-l bst)) (r (node-r bst)))
    (cond ((null l) r)
          ((null r) l)
          (t (if (zerop (random 2))
                 (make-node :elt (node-elt (bst-max l))
                            :r r
                            :l (bst-remove-max l))
                 (make-node :elt (node-elt (bst-min r))
                            :r (bst-remove-min r)
                            :l l))))))
 
(defun bst-remove-min (bst)
  (if (null (node-l bst))
      (node-r bst)
      (make-node :elt (node-elt bst)
                 :l (bst-remove-min (node-l bst))
                 :r (node-r bst))))

(defun bst-remove-max (bst)
  (if (null (node-r bst))
      (node-l bst)
      (make-node :elt (node-elt bst)
                 :l (node-l bst)
                 :r (bst-remove-max (node-r bst)))))
(defun bst-traverse (fn bst)
  (when bst
    (bst-traverse fn (node-l bst))
    (funcall fn (node-elt bst))
    (bst-traverse fn (node-r bst))))

(setf nums nil)
(dolist (x '(5 8 4 2 1 9 6 7 3))
    (setf nums (bst-insert x nums #'<)))
(bst-find 2 nums #'<)
(setf nums (bst-remove 2 nums #'<))
(bst-traverse #'princ nums)

;;; 4.8 哈希
(setf ht (make-hash-table))
(gethash 'color ht)
(setf (gethash 'color ht) 'red)
(setf (gethash 'apricot ht) t)
(remhash 'apricot ht)
 (maphash #'(lambda (k v)
               (format t "~A = ~A~%" k v))
           ht)
(setf bugs (make-hash-table))
(push "Doesn't take keyword arguments."
        (gethash #'bst-insert bugs))
(gethash #'bst-insert bugs)
(remhash #'bst-insert bugs)

(setf writers (make-hash-table :test #'equal))
(setf (gethash '(ralph waldo emerson) writers) t)


;;; 5. 控制流
(progn
    (format t "a")
    (format t "b")
    (+ 11 12))
(block head
    (format t "Here we go.")
    (return-from head 'idea)
    (format t "We'll never see this."))
(block nil
    (return 27))
(dolist (x '(a b c d e))
    (format t "~A " x)
    (if (eql x 'c)
        (return 'done)))
(defun foo ()
  (return-from foo 27))
;	(foo)
;; tagbody&go
(tagbody
   (setf x 0)
 top
   (setf x (+ x 1))
   (format t "~A " x)
   (if (< x 10) (go top)))
;; 词法语境
(let ((x 7)
      (y 2))
  (format t "Number")
  (+ x y))
((lambda (x) (+ x 1)) 3)
;; 把责任交给 lambda ，因为进入一个 let 等同于执行一个函数调用
(let ((x 2)
      (y (+ x 1)))		; x为函数实参，不能引用let的形参
  (+ x y))
;; 嵌套let
(let* ((x 1)
         (y (+ x 1)))
    (+ x y))
;; let let* 初始化为nil
(let (x y)
    (list x y))
;; 一一绑定 宏
(destructuring-bind (w (x y) . z) '(a (b c) d e)
    (list w x y z))
;; 条件 when 与unless相反
(when (oddp that)
  (format t "Hmm, that's odd.")
  (+ that 1))
(if (oddp that)
    (progn
      (format t "Hmm, that's odd.")
      (+ that 1)))
(defun our-member (obj lst)
  (if (atom lst)
      nil
      (if (eql (car lst) obj)
          lst
          (our-member obj (cdr lst)))))
;; 顺序求值，直到为t
(defun our-member (obj lst)
  (cond ((atom lst) nil)
        ((eql (car lst) obj) lst)
        (t (our-member obj (cdr lst)))))
;; 系列键值比较 case
;; typecase宏的键值为类型修饰符，比较用typep
(defun month-length (mon)
  (case mon
    ((jan mar may jul aug oct dec) 31)
    ((apr jun sept nov) 30)
    (feb (if (leap-year) 29 28))
    (otherwise "unknown month")))

;;; 迭代 do
(defun show-squares (start end)
  (do ((i start (+ i 1)))
      ((> i end) 'done)
    (format t "~A ~A~%" i (* i i))))
(show-squares 1 10)
;; 超过一个变量时，会获得前一次迭代的值；do*不会
(let ((x 'a))
    (do ((x 1 (+ x 1))
         (y x x))			;; 
        ((> x 5))
      (format t "(~A ~A)  " x y)))
(let ((x 'a))
    (do* ((x 1 (+ x 1))
         (y x x))
        ((> x 5))
      (format t "(~A ~A)  " x y)))
;; 初始列表的第三个表达式皆可省略(nil)
(dolist (x '(a b c d) 'done)
    (format t "~A " x))
(dotimes (x 5 x)
  (format t "~A " x))
;; do更新和累积：具有多变量的 do 循环，体现了产生与累积的本质对称性，允许可以无副作用地表达迭代过程
(defun factorial (n)
  (do ((j n (- j 1))
       (f 1 (* j f)))
    ((= j 0) f)))
(factorial 5)
;;; 函数 mapc 和 mapcar 很像，但不会 cons 一个新列表作为返回值，所以使
;;; 用的唯一理由是为了副作用。它们比 dolist 来得灵活，因为可以同时遍历
;;; 多个列表：
; mapc总是返回第二个参数
(mapc #'(lambda (x y)
          (format t "~A ~A  " x y))
      '(hip flip slip)
      '(hop flop slop))

;; 多值可以原封不地通过任何数量的返回
(get-decoded-time)
(values 'a nil (+ 2 4))
((lambda () ((lambda () (values 1 2)))))
(values)		;;无实参，是可能不返回的
;; 接收多值，多去少补(nil)
(multiple-value-bind (x y z) (values 1 2 3)
    (list x y z))
(multiple-value-bind (s m h) (get-decoded-time)
    (format t "~A:~A:~A" h m s))
;; 传参
(multiple-value-call #'+ (values 1 2 3))
(multiple-value-call #'list (values 'a 'b 'c))
(multiple-value-list (values 'a 'b 'c))

;; 终止 abort
(defun super ()
  (catch 'abort
    (sub)
    (format t "We'll never see this.")))

(defun sub ()
  (throw 'abort 99))
;;	(super)
;;	error中断执行，会将控制权转移到调用树更高点；如error handler，进入
;;	中断循环；unwind-protect 确保控制权移交时，第二个表达式有被求值
;; (progn
;;     (error "Oops!")
;;     (format t "After the error."))

(setf x 1)
(catch 'abort
    (unwind-protect
      (throw 'abort 99)
      (setf x 2)))

;; 日期计算
(setf mon '(31 28 31 30 31 30 31 31 30 31 30 31))
(apply #'+ mon)
(setf nom (reverse mon))
(setf sums (maplist #'(lambda (x)
                          (apply #'+ x))
                      nom))

(defconstant month
  #(0 31 59 90 120 151 181 212 243 273 304 334 365))

(defconstant yzero 2000)

(defun leap? (y)
  (and (zerop (mod y 4))
       (or (zerop (mod y 400))
           (not (zerop (mod y 100))))))

(defun date->num (d m y)
  (+ (- d 1) (month-num m y) (year-num y)))

(defun month-num (m y)
  (+ (svref month (- m 1))
     (if (and (> m 2) (leap? y)) 1 0)))

(defun year-num (y)
  (let ((d 0))
    (if (>= y yzero)
        (dotimes (i (- y yzero) d)
          (incf d (year-days (+ yzero i))))
        (dotimes (i (- yzero y) (- d))
          (incf d (year-days (+ y i)))))))

(defun year-days (y) (if (leap? y) 366 365))

(mod 23 5)
(mapcar #'leap? '(1904 1900 1600))

(defun num->date (n)
  (multiple-value-bind (y left) (num-year n)
    (multiple-value-bind (m d) (num-month left y)
      (values d m y))))

(defun num-year (n)
  (if (< n 0)
      (do* ((y (- yzero 1) (- y 1))
            (d (- (year-days y)) (- d (year-days y))))
           ((<= d n) (values y (- n d))))
      (do* ((y yzero (+ y 1))
            (prev 0 d)
            (d (year-days y) (+ d (year-days y))))
           ((> d n) (values y (- n prev))))))

(defun num-month (n y)
  (if (leap? y)
      (cond ((= n 59) (values 2 29))
            ((> n 59) (nmon (- n 1)))
            (t        (nmon n)))
      (nmon n)))

(defun nmon (n)
  (let ((m (position n month :test #'<)))
    (values m (+ 1 (- n (svref month (- m 1)))))))

(defun date+ (d m y n)
  (num->date (+ (date->num d m y) n)))

(multiple-value-list (date+ 17 12 1997 60))
(multiple-value-list (date->num 4 9 2013))
(num->date 5000)


;;;; 6. 函数
;;	全局函数
;;	defun将表达式翻译成 setf表达式
(setf (symbol-function 'add2)
      #'(lambda (x) (+ x 2)))

(defun primo (lst) (car lst))
(defun (setf primo) (val lst)
  (setf (car lst) val))
(let ((x (list 'a 'b 'c)))
  (setf (primo x) 480)
  x)
(defun foo (x)
  "Implements an enhanced paradigm of diversity"
  x)
(foo '(1 3 c))
(documentation 'foo 'function)

;;	局部函数
;;	labels 表达式所定义的局部函数，可以被其他任何在此定义的函数引用，
;;	包括自己
(labels ((add10 (x) (+ x 10))
         (consa  (x) (cons 'a x)))
  (consa (add10 3)))

(labels ((len (lst)
           (if (null lst)
               0
               (+ (len (cdr lst)) 1))))
  (len '(a b c)))

;; (do ((x a (b x))
;;      (y c (d y)))
;;     ((test x y) (z x y))
;;   (f x y))
;; (labels ((rec (x y)
;;            (cond ((test x y)
;;                   (z x y))
;;                  (t
;;                   (f x y)
;;                   (rec (b x) (d y))))))
;;   (rec a c))

;;	参表
(defun our-funcall (fn &rest args)
  (apply fn args))
(defun pilosoph (thing &optional property)
  (list thing 'is property))
(defun philosoph (thing &optional (property 'fun))
  (list thing 'is property))
(pilosoph  'list)
(philosoph  'list)
(our-funcall #'list 'a)
;;	key 参表；顺序无关，标签
(defun keylist (a &key x y z)
  (list a x y z))
(keylist 1 :y 2)
(destructuring-bind ((&key w x) &rest y) '((:w 3) a)
  (list w x y))

;;;	utils
(defun single? (lst)
  (and (consp lst) (null (cdr lst))))

(defun append1 (lst obj)
  (append lst (list obj)))

(defun map-int (fn n)
  (let ((acc nil))
    (dotimes (i n)
      (push (funcall fn i) acc))
    (nreverse acc)))

(defun filter (fn lst)
  (let ((acc nil))
    (dolist (x lst)
      (let ((val (funcall fn x)))
        (if val (push val acc))))
    (nreverse acc)))

(defun most (fn lst)
  (if (null lst)
      (values nil nil)
      (let* ((wins (car lst))
             (max (funcall fn wins)))
        (dolist (obj (cdr lst))
          (let ((score (funcall fn obj)))
            (when (> score max)
              (setf wins obj
                    max  score))))
        (values wins max))))

(map-int #'(lambda (x) (random 100))
         10)
(filter #'(lambda (x)
            (and (evenp x) (+ x 10)))
        '(1 2 3 4 5 6 7))
(most #'length '((a b) (a b c) (a)))

;;	closures
;;	函数引用到自由的词法变量时，称之为闭包；只要函数还存在，变量就必须
;;	一起存在；闭包结合了函数与环境，当一个函数引用到周围词法环境的某个
;;	东西时，闭包就被隐式地创建出来了
(defun combiner (x)
  (typecase x
    (number #'+)
    (list #'append)
    (t #'list)))
(defun combine (&rest args)
  (apply (combiner (car args))
         args))
(combine 2 3)
(combine '(1 3) '(a b))


(setf fn (let ((i 3))
           #'(lambda (x) (+ x i))))
(funcall fn 2)
(defun add-to-list (num lst)
  (mapcar #'(lambda (x)
              (+ x num))
          lst))

(defun make-adder (n)
  #'(lambda (x)
      (+ x n)))
(setf add27 (make-adder 27))
(funcall add27 5)

(let ((counter 0))
  (defun reset ()
    (setf counter 0))
  (defun stamp ()
    (setf counter (+ counter 1))))
(list (stamp) (stamp) (reset) (stamp))

(mapcar (complement #'oddp)
        '(1 2 3 4 5 6))
(defun our-complement (f)
  #'(lambda (&rest args)
      (not (apply f args))))
(our-complement #'oddp
                '(1 3 2 4 3))

;;;	6.6 函数构造器
(defun compose (&rest fns)
  (destructuring-bind (fn1 . rest) (reverse fns)
    #'(lambda (&rest args)
        (reduce #'(lambda (v f) (funcall f v))
                rest
                :initial-value (apply fn1 args)))))

(defun disjoin (fn &rest fns)
  (if (null fns)
      fn
      (let ((disj (apply #'disjoin fns)))
        #'(lambda (&rest args)
            (or (apply fn args) (apply disj args))))))

(defun conjoin (fn &rest fns)
  (if (null fns)
      fn
      (let ((conj (apply #'conjoin fns)))
        #'(lambda (&rest args)
            (and (apply fn args) (apply conj args))))))

(defun curry (fn &rest args)
  #'(lambda (&rest args2)
      (apply fn (append args args2))))

(defun rcurry (fn &rest args)
  #'(lambda (&rest args2)
      (apply fn (append args2 args))))

(defun always (x) #'(lambda (&rest args) x))

;;	(compose #'a #'b #'c)
;;	#'(lambda (&rest args) (a (b (apply #'c args))))
(mapcar (compose #'list #'round #'sqrt)
        '(4 9 16 25))
(mapcar (disjoin #'integerp #'symbolp)
        '(a "a" 2 3))
(mapcar (conjoin #'integerp #'symbolp)
        '(a "a" 2 3))

cddr = (compose #'cdr #'cdr)
nth  = (compose #'car #'nthcdr)
atom = (compose #'not #'consp)
= (rcurry #'typep 'atom)
<= = (disjoin #'< #'=)
listp = (disjoin #'< #'=)
= (rcurry #'typep 'list)
1+ = (curry #'+ 1)
= (rcurry #'+ 1)
1- = (rcurry #'- 1)
;;	mapcan =
;; (compose (curry #'apply #'nconc) #'mapcar
complement = (curry #'compose #'not)

(curry #'+ 3)
(rcurry #'+ 3)

(funcall (curry #'- 3) 2)
(funcall (rcurry #'- 3) 2)
(- 1)

;;	接受一个参数并原封不动返回此参数的函数constantly:	always identity
(always +)
(identity +)

;;	6.7 动态作用域
;;	局部变量几乎总是是词法变量，而全局变量总是是特别变量。
(let ((x 10))
  (defun foo ()
    x))
(let ((x 20)) (foo))
(let ((x 20))
    (declare (special x))
    (foo))

(let ((*print-base* 16))
    (princ 32))

;;	6.8 编译
(defun foo (x) (+ x 1))
(compiled-function-p #'foo)
(compile 'foo)				;;编译函数
;;	compile-file

;;	6.9 递归
;;	1. 函数编程，副作用低
;;	2. 递归数据结构，如列表
;;	3. 优雅性，相比迭代
;;	切分变小 + 基本用例
;;	某些算法通常递归表达最自然，而某些用迭代自然
;;	效率：	1. 尾递归，好编译器的速度应该和迭代差不多
;;			2. 显而易见的递归，不一定是最有效率的（重复计算）；如fib
(defun fib (n)
  (if (<= n 1)
      1
      (+ (fib (- n 1))
         (fib (- n 2)))))
;; 迭代版
(defun fib (n)
  (do ((i n (- i 1))
       (f1 1 (+ f1 f2))
       (f2 1 f1))
      ((<= i 1) f1)))



;;;	7. IO
;;	字符流与二进制流
;;	输入缺省是从 *standard-input* 流读取。输出缺省是在
;;	*standard-output* 流；
(setf path (make-pathname :name "myfile"))
(setf str (open path :direction :output
                       :if-exists :supersede))
(format str "Something~%")
(close str)
;; (setf str (open path :direction :input))
;; (read-line str)
;; (close str)
;;	with-open-file宏，打开、读写、关闭；(close在unwind-protect中)
(with-open-file (str path :direction :output
                          :if-exists :supercede)
  (format str "Something~%"))

;;	read-line & read（读lisp表达式）
(progn
    (format t "Please enter your name: ")
    (read-line))
(defun pseudo-cat (file)
  (with-open-file (str file :direction :input)
    (do ((line (read-line str nil 'eof)
               (read-line str nil 'eof)))
        ((eql line 'eof))
      (format t "~A~%" line))))
(setf path-s (make-pathname :name "compress.lisp"))
(pseudo-cat path-s)

;; (read)
;; (ask-number)
(read-from-string "a b c")

;;;	output	~S使用prin1，~A使用princ，~F右对齐浮点
(prin1 "Hello")
(princ "Hello")
(format nil "Dear ~A, ~% Our records indicate..."
                                              "Mr. Malatesta")
(format t "~S  ~A" "z" "z")
(format nil "~10,2,0,'*,' F" 26.21875)
;;	当 format 取整数时，它不保证会向上进位或向下舍入。就是说
;;	(format nil "~,1F" 1.25) 可能会是 "1.2" 或 "1.3"


;;;	字串替换
(defstruct buf
  vec (start -1) (used -1) (new -1) (end -1))

(defun bref (buf n)
  (svref (buf-vec buf)
         (mod n (length (buf-vec buf)))))

(defun (setf bref) (val buf n)
  (setf (svref (buf-vec buf)
               (mod n (length (buf-vec buf))))
        val))

(defun new-buf (len)
  (make-buf :vec (make-array len)))

(defun buf-insert (x b)
  (setf (bref b (incf (buf-end b))) x))

(defun buf-pop (b)
  (prog1
      (bref b (incf (buf-start b)))
    (setf (buf-used b) (buf-start b)
          (buf-new  b) (buf-end   b))))

(defun buf-next (b)
  (when (< (buf-used b) (buf-new b))
    (bref b (incf (buf-used b)))))

(defun buf-reset (b)
  (setf (buf-used b) (buf-start b)
        (buf-new  b) (buf-end   b)))

(defun buf-clear (b)
  (setf (buf-start b) -1 (buf-used  b) -1
        (buf-new   b) -1 (buf-end   b) -1))

(defun buf-flush (b str)
  (do ((i (1+ (buf-used b)) (1+ i)))
      ((> i (buf-end b)))
    (princ (bref b i) str)))

(defun file-subst (old new file1 file2)
  (with-open-file (in file1 :direction :input)
    (with-open-file (out file2 :direction :output
                         :if-exists :supercede)
      (stream-subst old new in out))))

(defun stream-subst (old new in out)
  (let* ((pos 0)
         (len (length old))
         (buf (new-buf len))
         (from-buf nil))
    (do ((c (read-char in nil :eof)
            (or (setf from-buf (buf-next buf))
                (read-char in nil :eof))))
        ((eql c :eof))
      (cond ((char= c (char old pos))
             (incf pos)
             (cond ((= pos len)            ; 3
                    (princ new out)
                    (setf pos 0)
                    (buf-clear buf))
                   ((not from-buf)         ; 2
                    (buf-insert c buf))))
            ((zerop pos)                   ; 1
             (princ c out)
             (when from-buf
               (buf-pop buf)
               (buf-reset buf)))
            (t                             ; 4
             (unless from-buf
               (buf-insert c buf))
             (princ (buf-pop buf) out)
             (buf-reset buf)
             (setf pos 0))))
    (buf-flush buf out)))
(file-subst " th" " z" "test1" "test2")

;;;	read-macro
;;;	派发 (dispatching)读取宏，而第一个字符叫做派发字符 (dispatching
;;;	character)。所有预定义的派发读取宏使用井号 ( # )作为派发字符。我们
;;;	已经见过好几个。举例来说， #' 是 (function ...) 的缩写，同样的 '
;;;	是 (quote ...) 的缩写。#(...) ，产生一个向量； #nA(...) 产生数组；
;;;	#\ 产生一个字符； #S(n ...) 产生一个结构
;;;	函数与哈希表不能被写出与读回来，而#<...>确保使用者不会有这样的幻觉。 
(car (read-from-string "'a"))


;;;;	8. 符号
;;	任何存在垂直杠 (vertical bar)之间的字符序列将被视为符号。当这种符
;;	号被读入时，不会有大小写转换，而宏字符与其他的字符被视为一般字符
(symbol-name 'abc)
(list '|Lisp 1.5| '|| '|abc| '|ABC|)
;;	每个符号都有一个属性列表（property-list）或称为 plist 。函数 get
;;	接受符号及任何类型的键值，然后返回在符号的属性列表中，与键值相关的
;;	数值
(get 'alizarin 'color )
(setf (get 'alizarin 'color) 'red)
(setf (get 'alizarin 'transparency) 'high)
(symbol-plist 'alizarin)
;;	符号可以有名字、 主包（home package）、作为变量的值、作为函数的值以及带有一个属性列表
;;	name package value function plist
;;	在 Common Lisp 里，属性列表用得不多。他们大部分被哈希表取代了
;;	符号是实质的对象，比较像结构，而不是名字

;;	概念上来说，包是将名字映射到符号的符号表（symbol-tables）。每个普
;;	通的符号都属於一个特定的包。符号属於某个包，我们称为符号被包扣押
;;	（intern）了。函数与变量用符号作为名称。包藉由限制哪个符号可以访问
;;	来实现模组性（modularity），也是因为这样，我们才可以引用到函数与变
;;	量。
;;	不是所有的符号都会被扣押。有时候有一个自由的（uninterned）符号是有
;;	用的，这和公用电话本是一样的原因。自由的符号叫做 gensyms
(intern "RANDOM-SYMBOL")
(defpackage "MY-APPLICATION"
            (:use "COMMON-LISP" "MY-UTILITIES")
            (:nicknames "APP")
            (:export "WIN" "LOSE" "DRAW"))
(in-package my-application)

;;	defpackage 伴随着一个 in-package ，确保当前包是 my-application 。
;;	所有其它未修饰的符号会被扣押至 my-application ── 除非之后有别的
;;	in-package 出现。当一个文件被载入时，当前的包总是被重置成载入之前
;;	的值

;;	在 keyword 包的符号 (称为关键字)有两个独特的性质：它们总是对自己求
;;	值，以及可以在任何地方引用它们。但如果是用一般符号写成的话，它只在
;;	被定义的包内正常工作，除非关键字也被导出了

;;	当符号是特别变量（special variable）的名字时，变量的值存在符号的
;;	value 栏位。symbol-value 函数引用到那个栏位，所以在符号与特殊变量
;;	的值之间，有直接的连接关系。

;;	一个作为词法变量的符号只不过是个占位符（placeholder）。编译器会将
;;	其转为一个寄存器（register）或内存位置的引用位址。在最后编译出来的
;;	代码中，我们无法追踪这个符号 (除非它被保存在调试器「debugger」的某
;;	个地方)。因此符号与词法变量的值之间是没有连接的；只要一有值，符号
;;	就消失了。


;;;	随机文本
(defparameter *words* (make-hash-table :size 10000))

(defconstant maxword 100)

(defun read-text (pathname)
  (with-open-file (s pathname :direction :input)
    (let ((buffer (make-string maxword))
          (pos 0))
      (do ((c (read-char s nil :eof)
              (read-char s nil :eof)))
          ((eql c :eof))
        (if (or (alpha-char-p c) (char= c #\'))
            (progn
              (setf (aref buffer pos) c)
              (incf pos))
            (progn
              (unless (zerop pos)
                (see (intern (string-downcase
                               (subseq buffer 0 pos))))
                (setf pos 0))
              (let ((p (punc c)))
                (if p (see p)))))))))

(defun punc (c)
  (case c
    (#\. '|.|) (#\, '|,|) (#\; '|;|)
    (#\! '|!|) (#\? '|?|) ))

(let ((prev `|.|))
  (defun see (symb)
    (let ((pair (assoc symb (gethash prev *words*))))
      (if (null pair)
          (push (cons symb 1) (gethash prev *words*))
          (incf (cdr pair))))
    (setf prev symb)))
(defun generate-text (n &optional (prev '|.|))
  (if (zerop n)
      (terpri)
      (let ((next (random-next prev)))
        (format t "~A " next)
        (generate-text (1- n) next))))

(defun random-next (prev)
  (let* ((choices (gethash prev *words*))
         (i (random (reduce #'+ choices
                            :key #'cdr))))
    (dolist (pair choices)
      (if (minusp (decf i (cdr pair)))
          (return (car pair))))))

;;;	9. 数字
;;;	四种不同类型的数字：整数、浮点数、比值与复数；比值与复数概念上是两
;;;	部分的结构
;;	函数 mod 仅返回 floor 返回的第二个返回值；而 rem 返回 truncate 返
;;	回的第二个返回值；函数 numerator 与 denominator 返回比值或整数的分
;;	子与分母
;;	
(+ 1.0 2)
(+ #c(0 1.0) 2)			;;	有浮点时，转浮点
(+ #c(1 -1) #c(2 1))	;;	复数虚数0时，转为实数
(list (complexp #c(1 0.1)))
(mapcar #'float '(1 2/3 .5))
(truncate 1.3)
(defun our-truncate (n)
  (if (> n 0)
      (floor n)
      (ceiling n)))
(mapcar #'round '(-2.5 -1.5 1.5 2.5))
(mapcar #'signum '(-2 -0.0 0.0 0 .5 3))	;;	判断正负，返回-1 0 1
(random 2)		;;	0<=x<n
(random 1.0)
;;	回文串
(defun palindrome? (x)
  (let ((mid (/ (length x) 2)))
    (equal (subseq x 0 (floor mid))
           (reverse (subseq x (ceiling mid))))))
(palindrome? "abbbcbbba")

;;	比较
(= 1 1.0)	;;	参数类型一致，比较值
(eql 1 1.0)

(multiple-value-bind (w x y z) (values 1000 100 10 1))
(<= w x y z)
(and (<= w x) (<= x y) (<= y z))

(/= w x y z)
(and (/= w x) (/= w y) (/= w z)
     (/= x y) (/= y z) (/= y z))

