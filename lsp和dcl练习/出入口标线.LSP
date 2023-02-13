(defun c:2()
  (setq a3 (getpoint "交点:\n") a1 (getpoint "直线点1:\n"))
  (command "circle" a3 a1)
  (setq c (entlast) a2 (getpoint "直线点2:\n"))
  (command "erase" c "")
  (command "line" a1 a3 "") (setq l11 (entlast))
  (command "line" a2 a3 "") (setq l22 (entlast))
  (command "rotate" l11 "" a1 "c" 45) (setq l1 (entlast))
  (command "rotate" l22 "" a2 "c" -45) (setq l2 (entlast))
;;;修剪里面的线
  (setq b1 (getpoint "内部点1:\n") b2 (getpoint "内部点2:\n"))
  (command "trim" l1 l2 "" "f" b1 b2 "" "")
  (command "pedit" "m" l1 l2 "" "" "w" 0.45 "j" "" "") (setq pl (entlast))
  (setq s (distance a1 a3) n (/ s 3) n (rtos n 2 0) n (atoi n))
  (repeat n
  (command "offset" 2 pl a3 "") (setq pl (entlast)))
  (command "ucs" "ob" l11)
  (command "copy" l11 "" a3 "@0,-0.5") (setq l1 (entlast))
  (command "ucs" "")
  (setq c1 (list (cadr (assoc 10 (entget l1))) (caddr (assoc 10 (entget l1)))) c2 (list (cadr (assoc 11 (entget l1))) (caddr (assoc 11 (entget l1)))));获取点坐标
;;;修剪外面的线
  (command "point" c1 c2 "");作点
  (repeat n
    (command "trim" l11 "" "f" c2 c1 "" ""))
  (command "ucs" "ob" l22)
  (command "copy" l22 "" a3 "@0,0.5") (setq l2 (entlast))
  (command "ucs" "")
  (setq d1 (list (cadr (assoc 10 (entget l2))) (caddr (assoc 10 (entget l2)))) d2 (list (cadr (assoc 11 (entget l2))) (caddr (assoc 11 (entget l2)))));获取点坐标
  (command "point" d1 d2 "");作点
  (repeat n
  (command "trim" l22 "" "f" d2 d1 "" ""))
  (command "erase" l11 l22 l1 l2 c1 c2 d1 d2 "")
  
;;;  (setq a1 (getpoint "点1:\n") a2 (getpoint "点2:\n") a3 (getpoint "点3:\n") a4 (getpoint "点4:\n"))
;;;  (command "trim" ss "" "f" a1 a2 "" "f" a3 a4 "" "")
;;;  (prin1)
  )