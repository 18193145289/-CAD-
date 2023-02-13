;;;视口比例自适应
(defun c:vv()
  (setvar "osmode" 1)
  (setq a1 (getpoint "第一点：\n") a2 (getpoint "第二点：\n"))
  (command "zoom" "end" a1 "end" a2)
  (setvar "osmode" 15359)
  (prin1))
;;;坐标转换
(defun c:s3()
  (setq a1 (getpoint "第一点：\n") a2 (getpoint "第二点：\n"))
  (command "ucs" a1 a2 "")
  (command "plan" "")
  (prin1))
;;;多条直线合并成多段线
(defun c:21()
  (setq ss (ssget))
  (command "pedit" "m" ss "" "y" "j" "" "")
  (prin1))
;;;多条多段线合并成一条多段线
(defun c:22()
  (setq ss (ssget))
  (command "pedit" "m" ss "" "j" "" "")
  (prin1))
;;;高度3mm单行文本
(defun c:3t()
  (setq a (getpoint "指定基点：\n"))
  (command "text" a 3 0)
  (prin1))
;;;视口锁定与解锁
(defun c:vs()
  (setq ss (ssget))
  (command "mview" "l" "on" ss))
(defun c:vx()
  (setq ss (ssget))
  (command "mview" "l" "off" ss ""))
;;;多边形视口
(defun c:v4()
  (command "-vports" "p"))
;;;打断于点
(defun c:bf()
  (setq ss (ssget))
  (command "break" ss "f"))
;;;阵列
(defun c:3q()
  (setq ss (ssget) n1 (getint "列数：\n") d1 (getint "距离：\n") n2 (getint "行数：\n") d2 (getint "距离：\n"))
;;;  (if (= n1 "")
;;;    (setq n2 (getint "行数：\n") d (getint "距离：\n")))
;;;  (setq d1 (getint "距离：\n") n2 (getint "行数：\n"))
  (command "array" ss "" "col" n1 d1 "r" n2 d2 ""))