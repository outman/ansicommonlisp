; example 1
; dotimes (var count-form [result-form])
; incf place [delta-form] => new-value
(defun sum(n)
  (let ((s 0))
    (dotimes (i n s)
      (incf s i))))

(print (sum 20))

; example 2
(defun addn(n)
  #'(lambda (x)
      (+ x n)))

(print (funcall (addn 10) 20))
