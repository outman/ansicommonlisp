; cons object-1 object-2 => cons
(print (cons 'a '(b c d)))

; The functions first, second, third, fourth, 
; fifth, sixth, seventh, eighth, ninth, 
; and tenth access the first, second, third,
; fourth, fifth, sixth, seventh, eighth, ninth, 
; and tenth elements of list, respectively.
(print (first (cons 'a '(b c d))))

; car => first
(print (car (cons 'a '(b c d))))

; cdr => rest
(print (cdr (cons 'a '(b c d))))

; if 
; listp object => generalized-boolean
; Returns true if object is of type list; otherwise, returns false.
(if (listp '(a b c))
           (print (+ 1 3))
           (print (+ 2 6)))

; and or
(print (and (listp '(a b c)) 1))
(print (or (listp '(a b c)) 1))

; functions
; our-third
(defun our-third(x)
  (car (cdr (cdr x))))

(print (our-third '(a b c d)))

; Recursion
; eql 
(defun our-member(obj lst)
  (if (null lst)
    nil
    (if (eql (car lst) obj)
      lst
      (our-member obj (cdr lst)))))

(print (our-member 'b '(a b c)))

; IO
; format 
(format t "~A plus ~A equals ~A. ~%" 2 3 (+ 2 3))

(defun askem(string)
  (format t "~A ~%" string)
  (read))

(print (askem "How old are you?"))

; local variable
(let ((x 1) (y 2))
  (print (+ x y)))

; let red numberp
(defun ask-number()
  (format t "Please enter a number ~%")
  (let ((val (read)))
    (if (numberp val)
      val
      (ask-number))))

; defparameter defconstant defvar 
; global params
(defparameter *glob* 99)
(print *glob*)

; const params
(defconstant limit (+ *glob* 1))
(print limit)

(boundp '*global*)

; setf remove
(let ((lst 5))
  (setf lst '(A B C D))
  (print lst)
  (setf lst (remove 'A lst)))

; Iteration
; do ({var | (var [init-form [step-form]])}*) (end-test-form result-form*) declaration* {tag | statement}*
(defun show-squares(start end)
  (do ((i start (+ i 1))) ; first expr
    ((> i end) 'done) ; second expr
    (format t "~A ~A ~%" i (* i i )))) ; declaration expr

; progn progn evaluates forms, in the order in which they are given. 
; The values of each form but the last are discarded.
(defun show-squares-recu(i end)
  (if (> i end)
    'done
    (progn
      (format -t "~A ~A ~%" i (* i i))
      (show-squares-recu (+ i 1) end))))

;dolist 
(defun out-length(lst)
  (let ((len 0))
    (dolist (obj lst)
      (setf len (+ len 1)))
    len))

(defun our-length-recur(lst)
  (if (null lst)
    0
    (+ (our-length-recur (cdr lst)) 1)))

;tail recur
(defun our-length-rec(lst len)
  (if (null lst)
    len 
    (our-length-rec (cdr lst) (+ len 1))))

; function #'
; apply
(function +)
#'+

(apply #' '(1 2 3 4))
(apply (function +) '(1 2 3 4))
(funcall #'+ 1 2 3 4 5)

; lambda
(funcall (lambda (x y) (+ x y)) 10 20)
(funcall (function (lambda (x) (+ x 100))) 20)

; types fixnum integer rational real number atom
(typep 27 'integer)
