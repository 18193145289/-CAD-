(defun c:1111()
  (setq a1 (getpoint "d1:\n") a2 (getpoint "d2:\n") a3 (list (/ (+ (car a1) (car a2)) 2) (/ (+ (cadr a1) (cadr a2)) 2)) b1 (polar a1 0 5) b2 (polar b1 (* 3 (/ pi 2)) 1) b3 (polar b2 0 4) b4 (polar a3 (* 3 (/ pi 2))) b5 (polar a1 (* 3 (/ pi 2)) 1) b6 (polar a5 0 4))
  (command "pline" "w" 0.2 "" a1 b1 b2 b3 b4 b5 b6 a1 ""))