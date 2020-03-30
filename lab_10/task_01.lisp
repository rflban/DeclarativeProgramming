(defun lvl2len (lol)
  (cond ((null lol) 0)
        (t (+ (length (car lol))
              (lvl2len (cdr lol))))))

(lvl2len nil) ; 0
(lvl2len '((1 2) (3 4))) ; 4

