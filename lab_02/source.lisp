;;;; Набиев Ф., ФиЛП, Лабораторная работа #2

;;; 1)
;; a)
(caadr '((blue cube) (red pyramid))) ; red
;; b)
(cdar '((abc) (def) (ghi))) ; nil
;; c)
(cadr '((abc) (def) (ghi))) ; (def)
;; d)
(caddr '((abc) (def) (ghi))) ; (ghi)

;;; 2)
(list 'Fred 'and Wilma) ; error
(list 'Fred '(and Wilma)) ; (Fred (and Wilma))
(cons nil nil) ; (nil)
(cons t nil) ; (t)
(cons nil t) ; (nil . t)
(list nil) ; (nil)
(cons (t) nil) ; error
(list '(one two) '(free temp)) ; ((one two) (free temp))
(cons 'Fred '(and Wilma)) ; (Fred and Wilma)
(cons 'Fred '(Wilma)) ; (Fred Wilma)
(list nil nil) ; (nil nil)
(list t nil) ; (t nil)
(list nil t) ; (nil t)
(cons t (list nil)) ; (t nil)
(list (t) nil) ; error
(cons '(one two) '(free temp)) ; ((one two) free temp)

;;; 3)
(defun f1 (ar1 ar2 ar3 ar4)
  (list (list ar1 ar2) (list ar3 ar4)))
(f1 'ar1 'ar2 'ar3 'ar4)

(defun f2 (ar1 ar2)
  (list (list ar1) (list ar2)))
(f2 'ar1 'ar2)

(defun f3 (ar1)
  (list (list (list ar1))))
(f3 'ar1)

