;;; rec
(defun sum-state (state1 state2)
  (cons (or (car state1) (car state2))
        (+ (cdr state1) (cdr state2))))

(defun deep-sum-even (lst lo hi state)
  (cond ((null lst) (cons nil 0))
        ((listp (car lst)) (sum-state (deep-sum-even (car lst) lo hi state)
                                      (deep-sum-even (cdr lst) lo hi state)))
        ((and (numberp (car lst))
              (evenp (car lst))
              (>= (car lst) lo)
              (<= (car lst) hi)) (sum-state (cons t (car lst))
                                            (deep-sum-even (cdr lst) lo hi state)))
        (t (deep-sum-even (cdr lst) lo hi state))))

(defun insert (lst k val)
  (cond ((or (null lst) (eq k 0)) (cons val lst))
        (t (cons (car lst) (insert (cdr lst) (cond ((numberp k) (- k 1))
                                                   (t nil)) val)))))

(defun f-help (lst k state)
  (insert lst k (cond ((car state) (cdr state))
                      (t nil))))

(defun f (lst k lo hi)
  (f-help lst k (deep-sum-even lst lo hi '(nil . 0))))

(defun concat (l1 l2)
  (cond ((null l1) l2)
        (t (cons (car l1) (concat (cdr l1) l2)))))

(defun to-linear (lst)
  (cond ((null lst) nil)
        ((listp (car lst)) (concat (to-linear (car lst)) (to-linear (cdr lst))))
        (t (cons (car lst) (to-linear (cdr lst))))))

;;; func
(defun filter (predicate lst)
  (reverse (reduce #'(lambda (state item)
                       (cond ((funcall predicate item) (cons item state))
                             (t state)))
                   (cons nil lst))))

(defun f-help1 (lst k nums)
  (insert lst k (cond ((null nums) nil)
                      (t (reduce #'+ nums)))))

(defun f (lst k lo hi)
  (f-help1 lst k (filter #'(lambda (item)
                             (cond ((and (numberp item)
                                         (evenp item)
                                         (>= item lo)
                                                    (<= item hi)) t)
                                   (t nil)))
                         (to-linear lst))))

;;; test
(setq l0 '(1 2 (f d 2 3 4) (3 5 g) gf))
(setq l1 '(1 2 (f d 2 3 4) (3 5 (6) g) gf))
(setq l2 '(1 5 (f d 5 3 4) (3 5 (6) g) gf))
(setq l3 '(1 2 (f d -2 3 4) (3 5 (6) g) gf))
(setq l4 '(1 2 3 (3 4 (a b 2) 3 5) (2)))

(sum-state '(nil . 5) '(t . 4))

(insert '(0 1 2 4 5 6 7) 3 3)
(insert '(0 1 2 4 5 6 7) nil 3)

(deep-sum-even l0 2 3 '(nil . 0))
(deep-sum-even l1 2 4 '(nil . 0))
(deep-sum-even l2 2 3 '(nil . 0))
(deep-sum-even l3 -2 2 '(nil . 0))

(f-help l1 0 '(nil . 111))
(f-help l1 0 '(t . 111))

(f l1 0 2 4)
(f l2 0 2 3)
(f l1 nil 2 4)
(f l2 nil 2 3)
(f l4 nil 2 5)

(concat '(1 2 3 4 5) '(6 7 8 9))

(to-linear (f l1 nil 2 5))
(to-linear (f l4 nil 2 5))

