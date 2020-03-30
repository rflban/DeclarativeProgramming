(reduce #'+ nil)
(reduce #'* nil)
(reduce #'+ '(2))
(reduce #'* '(2))
(reduce #'* '(word))

(+)
(*)

(reduce #'list nil)
(reduce #'list '(2))
(reduce #'list '(2 3))

(list)

(reduce #'cons nil)
(reduce #'cons '(2))
(reduce #'cons '(2 3))

(defun foo (arg1 arg2) 1)
(reduce #'foo nil)
(reduce #'foo '(2))
(reduce #'foo '(2 3))

