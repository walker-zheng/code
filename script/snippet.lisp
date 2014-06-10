;; Copyright (C) 2010 ahei

;; Author: ahei <ahei0802@gmail.com>
;; URL: http://code.google.com/p/dea/source/browse/trunk/my-lisps/snippet.lisp
;; Time-stamp: <2013-09-06 17:13:38 ������ by tech33>

;; This  file is free  software; you  can redistribute  it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 3,
;; or (at your option) any later version.

;; This file is  distributed in the hope that  it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You  should have  received a  copy of  the GNU  General Public
;; License along with  GNU Emacs; see the file  COPYING.  If not,
;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301, USA.

;;; 	cl snippet

(defun factorial (n)
  (do ((j n (- j 1))
       (f 1 (* j f)))
      ((= j 0) f)))
(trace factorial)
(factorial 5)
(multiple-value-bind (x y z) (values 1 2 3)
  (list x y z))

;;; ��������
(fboundp '+)
(symbol-function '+)
(setf (symbol-function 'add2)
      #'(lambda (x) (+ x 2)))
(add2 3)

;; defun������ɱ��ʽΪ setf ���ʽ
;; (setf f) �ĺ��������У���һ��ʵ�δ����µ���ֵ����ʣ�ŵ�ʵ�δ����˴��� f �Ĳ���
(defun primo (lst) (car lst))
(defun (setf primo) (val lst)
  (setf (car lst) val))

