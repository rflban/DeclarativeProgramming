;;; через функционалы
(defun table_create (countries capitals)
  (mapcar #'cons countries capitals))

(defun get_capital (tbl country)
  (reduce #'(lambda (val1 val2) (or val1 val2))
          (mapcar #'(lambda (row)
                      (cond ((equal (car row) country) (cdr row))
                            (t nil)))
                  tbl)))

(defun get_country (tbl capital)
  (reduce #'(lambda (val1 val2) (or val1 val2))
          (mapcar #'(lambda (row)
                      (cond ((equal (cdr row) capital) (car row))
                            (t nil)))
                  tbl)))

;;; рекурсивно
(defun table_create (countries capitals)
  (cond ((cdr countries)
         (cons (cons (car countries) (car capitals))
               (table_create (cdr countries) (cdr capitals))))
        (t
         (list (cons (car countries) (car capitals))))))

(defun get_capital (tbl country)
  (cond ((null tbl) nil)
        ((equal (caar tbl) country) (cdar tbl))
        (t (get_capital (cdr tbl) country))))

(defun get_country (tbl capital)
  (cond ((null tbl) nil)
        ((equal (cdar tbl) capital) (caar tbl))
        (t (get_country (cdr tbl) capital))))

;;; тестирование
(setq countries '(Russia France Germany))
(setq capitals '(Moscow Paris Berlin))

(setq table (table_create countries capitals))

(identity countries)
(identity capitals)
(identity table)

(get_capital table 'Russia) ; Moscow
(get_capital table 'Germany) ; Berlin
(get_capital table 'France) ; Paris
(get_capital table 'USA) ; Nil

(get_country table 'Berlin) ; Germany
(get_country table 'Moscow) ; Russia
(get_country table 'Paris) ; France
(get_country table 'Washington) ; Nil

