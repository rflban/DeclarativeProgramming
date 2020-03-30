(defun filter (predicate lst)
  (cond ((null lst) nil)
        (t (cond ((funcall predicate (car lst))
                  (cons (car lst) (filter predicate (cdr lst))))
                 (t (filter predicate (cdr lst)))))))

(defun select-odd (nums)
  (filter #'oddp nums))

(defun select-even (nums)
  (filter #'evenp nums))

(defun sum-all-odd (nums)
  (reduce #'+ (select-odd nums)))

(defun sum-all-even (nums)
  (reduce #'+ (select-even nums)))

(setq digits '(0 1 2 3 4 5 6 7 8 9))

(select-odd digits)
(sum-all-odd digits)

(select-even digits)
(sum-all-even digits)

