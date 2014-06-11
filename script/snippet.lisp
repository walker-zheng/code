;;; code snippets
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;	ansi common lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;	������ list
;; our-copy-list
(defun our-copy-list (lst)
 (if (atom lst)
     lst
     (cons (car lst) (our-copy-list (cdr lst)))))

;; our-copy-tree ˫�صݹ�
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
;; ��дĬ�Ϸ���
(member 'b '(a b (z)) :test #'equal)

;;; ����������������
 (union '(a b c) '(c b s))
 (intersection '(a b c) '(b b c))
 (set-difference '(a b c d e) '(b e))

;;; sequences����lists��vectors
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
(nthmost 3 '(1 3 0 8 5))		;; ������

;; test
 (every #'oddp '(1 3 5))
(some #'evenp '(1 2 3))
(every #'> '(1 3 5) '(0 2 4))		;; ���Դ���Ϊ�������

;; reverse with stack 
(defun our-reverse (lst)
  (let ((acc nil))
    (dolist (elt lst)
      (push elt acc))
    acc))
(our-reverse '(1 3 4 5 2))
;; pushnew ��Ԫ����ջ
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

;;; ����������� breadth-first search
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


;;;; ˳�򲢼�
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

;;;;	������ �������ݽṹ
;; array init get & set
(setf arr (make-array '(2 3) :initial-element nil))
(setf (aref arr 0 0) 'b)
(aref arr 0 0)
arr
;; vector
 (setf vec (make-array 4 :initial-element 1))
(vector "a" "str" 4)
(svref vec 0)		;; ��sref�죬������

;;; ��������
(defun bin-search (obj vec)
  (let ((len (length vec)))
    (and (not (zerop len))
         (finder obj vec 0 (- len 1)))))

(defun finder (obj vec start end)
  ;; ��ӡ��������
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
(char "abc" 1)		;; ��aref�죬����������ĺ��������������ִ�

(let ((str (copy-seq "Merlin")))
  (setf (char str 3) #\k)
  str)
(equal "fred" "Fred")
(string-equal "fred" "Fred")
(format nil "~A or ~A" "truth" "dare")
(concatenate 'string "not " "to worry")

;;; sequences
;;; �б������ѭ���ȡ������Ϊ�����ȡ
(our-mirror "abbcbba")
(our-mirror? "abbbba")
 (position #\a "fantasia" :start 3 :end 5)
;	���� 	��; 					ȱʡֵ
;	:key 	Ӧ����ÿ��Ԫ�صĺ��� 	identity
;	:test 	�����Ƚϵĺ��� 			eql
;	:from-end 	��Ϊ�棬�������� 	nil
;	:start 	��ʼλ�� 				0
;	:end 	���и���������λ�á� 	nil
(position '(a b) '((a b) (c d)))
(position '(a b) '((a b) (c d)) :test #'equal)

(defun second-word (str)
  (let ((p1 (+ (position #\  str) 1)))
    (subseq str p1 (position #\  str :start p1))))
(second-word "Form follows function")
(position-if #'oddp '(2 3 4 5))

;; ν�ʽ����Ϊfun+key����ʽ������⣬���µȼ�
(find-if #'(lambda (x)
             (eql (car x) 'complete))
         lst)
(find 'complete lst :key #'car)

(remove-duplicates "abracadabra")
(reduce #'intersection '((b r a d 's) (b a d) (c a t)))	;�ظ�����func

;; ��������
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

;; strתinteger
(defun read-integer (str)
  (if (every #'digit-char-p str)
      (let ((accum 0))
        (dotimes (pos (length str))
          (setf accum (+ (* accum 10)
                         (digit-char-p (char str pos)))))
        accum)
    nil))


;;;; 4.6�ṹ
;; ���Զ�����make-point �� point-p �� copy-point �� point-x �� point-y
;; �Ⱥ���
(defstruct point
  x
  y)
(setf p (make-point :x 9 :y 0))
(point-x p)
(setf (point-y p) 2)

; ����&��ʾ
(defstruct (point (:conc-name p)
                  (:print-function print-point))
  (x 0)
  (y 0))
(defun print-point (p stream depth)
  (format stream "#<~A, ~A>" (px p) (py p)))
(make-point)
(px p)

;;; ����������
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

;;; 4.8 ��ϣ
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


;;; 5. ������
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
;; �ʷ��ﾳ
(let ((x 7)
      (y 2))
  (format t "Number")
  (+ x y))
((lambda (x) (+ x 1)) 3)
;; �����ν��� lambda ����Ϊ����һ�� let ��ͬ��ִ��һ����������
(let ((x 2)
      (y (+ x 1)))		; xΪ����ʵ�Σ���������let���β�
  (+ x y))
;; Ƕ��let
(let* ((x 1)
         (y (+ x 1)))
    (+ x y))
;; let let* ��ʼ��Ϊnil
(let (x y)
    (list x y))
;; һһ�� ��
(destructuring-bind (w (x y) . z) '(a (b c) d e)
    (list w x y z))
;; ���� when ��unless�෴
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
;; ˳����ֵ��ֱ��Ϊt
(defun our-member (obj lst)
  (cond ((atom lst) nil)
        ((eql (car lst) obj) lst)
        (t (our-member obj (cdr lst)))))
;; ϵ�м�ֵ�Ƚ� case
;; typecase��ļ�ֵΪ�������η����Ƚ���typep
(defun month-length (mon)
  (case mon
    ((jan mar may jul aug oct dec) 31)
    ((apr jun sept nov) 30)
    (feb (if (leap-year) 29 28))
    (otherwise "unknown month")))

;;; ���� do
(defun show-squares (start end)
  (do ((i start (+ i 1)))
      ((> i end) 'done)
    (format t "~A ~A~%" i (* i i))))
(show-squares 1 10)
;; ����һ������ʱ������ǰһ�ε�����ֵ��do*����
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
;; ��ʼ�б�ĵ��������ʽ�Կ�ʡ��(nil)
(dolist (x '(a b c d) 'done)
    (format t "~A " x))
(dotimes (x 5 x)
  (format t "~A " x))
;; do���º��ۻ������ж������ do ѭ���������˲������ۻ��ı��ʶԳ��ԣ���������޸����õر���������
(defun factorial (n)
  (do ((j n (- j 1))
       (f 1 (* j f)))
    ((= j 0) f)))
(factorial 5)
;;; ���� mapc �� mapcar ���񣬵����� cons һ�����б���Ϊ����ֵ������ʹ
;;; �õ�Ψһ������Ϊ�˸����á����Ǳ� dolist ��������Ϊ����ͬʱ����
;;; ����б�
; mapc���Ƿ��صڶ�������
(mapc #'(lambda (x y)
          (format t "~A ~A  " x y))
      '(hip flip slip)
      '(hop flop slop))

;; ��ֵ����ԭ�ⲻ��ͨ���κ������ķ���
(get-decoded-time)
(values 'a nil (+ 2 4))
((lambda () ((lambda () (values 1 2)))))
(values)		;;��ʵ�Σ��ǿ��ܲ����ص�
;; ���ն�ֵ����ȥ�ٲ�(nil)
(multiple-value-bind (x y z) (values 1 2 3)
    (list x y z))
(multiple-value-bind (s m h) (get-decoded-time)
    (format t "~A:~A:~A" h m s))
;; ����
(multiple-value-call #'+ (values 1 2 3))
(multiple-value-call #'list (values 'a 'b 'c))
(multiple-value-list (values 'a 'b 'c))

;; ��ֹ abort
(defun super ()
  (catch 'abort
    (sub)
    (format t "We'll never see this.")))

(defun sub ()
  (throw 'abort 99))
;;	(super)
;;	error�ж�ִ�У��Ὣ����Ȩת�Ƶ����������ߵ㣻��error handler������
;;	�ж�ѭ����unwind-protect ȷ������Ȩ�ƽ�ʱ���ڶ������ʽ�б���ֵ
;; (progn
;;     (error "Oops!")
;;     (format t "After the error."))

(setf x 1)
(catch 'abort
    (unwind-protect
      (throw 'abort 99)
      (setf x 2)))

;; ���ڼ���
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


;;;; 6. ����
;;	ȫ�ֺ���
;;	defun�����ʽ����� setf���ʽ
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

;;	�ֲ�����
;;	labels ���ʽ������ľֲ����������Ա������κ��ڴ˶���ĺ������ã�
;;	�����Լ�
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

;;	�α�
(defun our-funcall (fn &rest args)
  (apply fn args))
(defun pilosoph (thing &optional property)
  (list thing 'is property))
(defun philosoph (thing &optional (property 'fun))
  (list thing 'is property))
(pilosoph  'list)
(philosoph  'list)
(our-funcall #'list 'a)
;;	key �α�˳���޹أ���ǩ
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
;;	�������õ����ɵĴʷ�����ʱ����֮Ϊ�հ���ֻҪ���������ڣ������ͱ���
;;	һ����ڣ��հ�����˺����뻷������һ���������õ���Χ�ʷ�������ĳ��
;;	����ʱ���հ��ͱ���ʽ�ش���������
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

;;;	6.6 ����������
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

;;	����һ��������ԭ�ⲻ�����ش˲����ĺ���constantly:	always identity
(always +)
(identity +)

;;	6.7 ��̬������
;;	�ֲ��������������Ǵʷ���������ȫ�ֱ����������ر������
(let ((x 10))
  (defun foo ()
    x))
(let ((x 20)) (foo))
(let ((x 20))
    (declare (special x))
    (foo))

(let ((*print-base* 16))
    (princ 32))

;;	6.8 ����
(defun foo (x) (+ x 1))
(compiled-function-p #'foo)
(compile 'foo)				;;���뺯��
;;	compile-file

;;	6.9 �ݹ�
;;	1. ������̣������õ�
;;	2. �ݹ����ݽṹ�����б�
;;	3. �����ԣ���ȵ���
;;	�зֱ�С + ��������
;;	ĳЩ�㷨ͨ���ݹ�������Ȼ����ĳЩ�õ�����Ȼ
;;	Ч�ʣ�	1. β�ݹ飬�ñ��������ٶ�Ӧ�ú͵������
;;			2. �Զ��׼��ĵݹ飬��һ��������Ч�ʵģ��ظ����㣩����fib
(defun fib (n)
  (if (<= n 1)
      1
      (+ (fib (- n 1))
         (fib (- n 2)))))
;; ������
(defun fib (n)
  (do ((i n (- i 1))
       (f1 1 (+ f1 f2))
       (f2 1 f1))
      ((<= i 1) f1)))



;;;	7. IO
;;	�ַ������������
;;	����ȱʡ�Ǵ� *standard-input* ����ȡ�����ȱʡ����
;;	*standard-output* ����
(setf path (make-pathname :name "myfile"))
(setf str (open path :direction :output
                       :if-exists :supersede))
(format str "Something~%")
(close str)
;; (setf str (open path :direction :input))
;; (read-line str)
;; (close str)
;;	with-open-file�꣬�򿪡���д���رգ�(close��unwind-protect��)
(with-open-file (str path :direction :output
                          :if-exists :supercede)
  (format str "Something~%"))

;;	read-line & read����lisp���ʽ��
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

;;;	output	~Sʹ��prin1��~Aʹ��princ��~F�Ҷ��븡��
(prin1 "Hello")
(princ "Hello")
(format nil "Dear ~A, ~% Our records indicate..."
                                              "Mr. Malatesta")
(format t "~S  ~A" "z" "z")
(format nil "~10,2,0,'*,' F" 26.21875)
;;	�� format ȡ����ʱ��������֤�����Ͻ�λ���������롣����˵
;;	(format nil "~,1F" 1.25) ���ܻ��� "1.2" �� "1.3"


;;;	�ִ��滻
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
;;;	�ɷ� (dispatching)��ȡ�꣬����һ���ַ������ɷ��ַ� (dispatching
;;;	character)������Ԥ������ɷ���ȡ��ʹ�þ��� ( # )��Ϊ�ɷ��ַ�������
;;;	�Ѿ������ü�����������˵�� #' �� (function ...) ����д��ͬ���� '
;;;	�� (quote ...) ����д��#(...) ������һ�������� #nA(...) �������飻
;;;	#\ ����һ���ַ��� #S(n ...) ����һ���ṹ
;;;	�������ϣ���ܱ�д�������������#<...>ȷ��ʹ���߲����������Ļþ��� 
(car (read-from-string "'a"))


;;;;	8. ����
;;	�κδ��ڴ�ֱ�� (vertical bar)֮����ַ����н�����Ϊ���š������ַ�
;;	�ű�����ʱ�������д�Сдת���������ַ����������ַ�����Ϊһ���ַ�
(symbol-name 'abc)
(list '|Lisp 1.5| '|| '|abc| '|ABC|)
;;	ÿ�����Ŷ���һ�������б�property-list�����Ϊ plist ������ get
;;	���ܷ��ż��κ����͵ļ�ֵ��Ȼ�󷵻��ڷ��ŵ������б��У����ֵ��ص�
;;	��ֵ
(get 'alizarin 'color )
(setf (get 'alizarin 'color) 'red)
(setf (get 'alizarin 'transparency) 'high)
(symbol-plist 'alizarin)
;;	���ſ��������֡� ������home package������Ϊ������ֵ����Ϊ������ֵ�Լ�����һ�������б�
;;	name package value function plist
;;	�� Common Lisp ������б��õò��ࡣ���Ǵ󲿷ֱ���ϣ��ȡ����
;;	������ʵ�ʵĶ��󣬱Ƚ���ṹ������������

;;	��������˵�����ǽ�����ӳ�䵽���ŵķ��ű�symbol-tables����ÿ����
;;	ͨ�ķ��Ŷ����һ���ض��İ����������ĳ���������ǳ�Ϊ���ű�����Ѻ
;;	��intern���ˡ�����������÷�����Ϊ���ơ������������ĸ����ſ��Է���
;;	��ʵ��ģ���ԣ�modularity����Ҳ����Ϊ���������ǲſ������õ��������
;;	����
;;	�������еķ��Ŷ��ᱻ��Ѻ����ʱ����һ�����ɵģ�uninterned����������
;;	�õģ���͹��õ绰����һ����ԭ�����ɵķ��Ž��� gensyms
(intern "RANDOM-SYMBOL")
(defpackage "MY-APPLICATION"
            (:use "COMMON-LISP" "MY-UTILITIES")
            (:nicknames "APP")
            (:export "WIN" "LOSE" "DRAW"))
(in-package my-application)

;;	defpackage ������һ�� in-package ��ȷ����ǰ���� my-application ��
;;	��������δ���εķ��Żᱻ��Ѻ�� my-application ���� ����֮���б��
;;	in-package ���֡���һ���ļ�������ʱ����ǰ�İ����Ǳ����ó�����֮ǰ
;;	��ֵ

;;	�� keyword ���ķ��� (��Ϊ�ؼ���)���������ص����ʣ��������Ƕ��Լ���
;;	ֵ���Լ��������κεط��������ǡ����������һ�����д�ɵĻ�����ֻ��
;;	������İ����������������ǹؼ���Ҳ��������

;;	���������ر������special variable��������ʱ��������ֵ���ڷ��ŵ�
;;	value ��λ��symbol-value �������õ��Ǹ���λ�������ڷ������������
;;	��ֵ֮�䣬��ֱ�ӵ����ӹ�ϵ��

;;	һ����Ϊ�ʷ������ķ���ֻ�����Ǹ�ռλ����placeholder�����������Ὣ
;;	��תΪһ���Ĵ�����register�����ڴ�λ�õ�����λַ���������������
;;	�����У������޷�׷��������� (�������������ڵ�������debugger����ĳ
;;	���ط�)����˷�����ʷ�������ֵ֮����û�����ӵģ�ֻҪһ��ֵ������
;;	����ʧ�ˡ�


;;;	����ı�
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

;;;	9. ����
;;;	���ֲ�ͬ���͵����֣�����������������ֵ�븴������ֵ�븴������������
;;;	���ֵĽṹ
;;	���� mod ������ floor ���صĵڶ�������ֵ���� rem ���� truncate ��
;;	�صĵڶ�������ֵ������ numerator �� denominator ���ر�ֵ�������ķ�
;;	�����ĸ
;;	
(+ 1.0 2)
(+ #c(0 1.0) 2)			;;	�и���ʱ��ת����
(+ #c(1 -1) #c(2 1))	;;	��������0ʱ��תΪʵ��
(list (complexp #c(1 0.1)))
(mapcar #'float '(1 2/3 .5))
(truncate 1.3)
(defun our-truncate (n)
  (if (> n 0)
      (floor n)
      (ceiling n)))
(mapcar #'round '(-2.5 -1.5 1.5 2.5))
(mapcar #'signum '(-2 -0.0 0.0 0 .5 3))	;;	�ж�����������-1 0 1
(random 2)		;;	0<=x<n
(random 1.0)
;;	���Ĵ�
(defun palindrome? (x)
  (let ((mid (/ (length x) 2)))
    (equal (subseq x 0 (floor mid))
           (reverse (subseq x (ceiling mid))))))
(palindrome? "abbbcbbba")

;;	�Ƚ�
(= 1 1.0)	;;	��������һ�£��Ƚ�ֵ
(eql 1 1.0)

(multiple-value-bind (w x y z) (values 1000 100 10 1))
(<= w x y z)
(and (<= w x) (<= x y) (<= y z))

(/= w x y z)
(and (/= w x) (/= w y) (/= w z)
     (/= x y) (/= y z) (/= y z))

