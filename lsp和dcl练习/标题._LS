(defun c:bt()
;;;  (getvar "cmdecho" 0)
  (setq osm (getvar "osmode"))
  (setvar "osmode" 0)
  (setq dig_id (load_dialog "D:\\蒋子英工作与划水\\lsp和dcl练习\\标题.DCL"))
  (new_dialog "bt" dig_id)
  (start_image "j")
  (slide_image 0 0 (dimx_tile "j") (dimy_tile "j") "D:\\蒋子英工作与划水\\lsp和dcl练习\\标题.sld")
  (end_image)
  (action_tile "accept" "(hqz) (done_dialog 1)")
  (action_tile "cancel" "(done_dialog 0)")
  (action_tile "xs" "(hqz)")
  (action_tile "bxs" "(hqz)")
  (setq st (start_dialog))
  (unload_dialog dig_id)
  (if (= st 1) (draw))
  (setvar "osmode" osm)
  (prin1)
  )
;;;获取对话框字符串的值
(defun hqz()
  (setq c (get_tile "c")
	b (atoi (get_tile "b"))
	xs(atoi (get_tile "xs"))
	bxs(atoi (get_tile "bxs"))
  )
)
(defun draw()
  (setq a (getpoint "选一点："))
  (cond ((= b 0) (setq b "1:10" bs 10))
	((= b 1) (setq b "1:20" bs 20))
	((= b 2) (setq b "1:30" bs 30))
	((= b 3) (setq b "1:35" bs 35))
	((= b 4) (setq b "1:50" bs 50))
	((= b 5) (setq b "1:80" bs 80))
	((= b 6) (setq b "1:100" bs 100))
	((= b 7) (setq b "1:150" bs 150))
	((= b 8) (setq b "1:200" bs 200))
	)
  (setq	h (* 4 bs))
  (command "text" a h 0 c)
;;;  修改文字颜色
  (setq wz (entlast));保存文字图元
  (setq wz (entget wz));提取文字数据
  (setq wz (cons (cons 62 3) wz));将颜色点对信息插入到文字数据中
  (entmod wz)
;;;  修改文字样式
  (setq ysn (cons 7 "FS"))
  (setq yso (assoc 7 wz))
  (setq wz (subst ysn yso wz))
  (entmod wz)
;;;  文字下划线
  (setq c1 (strlen c);得到文字长度
	xc (* (/ c1 2) h);得到线长度
	d (polar a pi xc);线的终点
	o (polar a (* 3 (/ pi 2)) 1)
	x (polar a (* 3 (/ pi 2)) (* 0.5 (/ h 2.5))))
  (command "line" a d "");先画上面的线
  (setq x1 (entlast));保存上面的线
  (command "offset" (* 0.5 (/ h 2.5)) x1 o "");画下面的线
  (setq x2 (entlast));保存下面的线
  (command "move" x1 x2 "" a x)
  (command "mirror" x1 x2 "" a x "y")
	;;;  修改颜色及线宽
  (setq x1 (entget x1) x2 (entget x2))
  (setq x1 (cons (cons 62 104) x1) x2 (cons (cons 62 3) x2))
  (entmod x1) (entmod x2)
  (setq x1 (cons (cons 370 35) x1))
  (entmod x1)
;;;  比例
  (if (= xs 1) (progn (setq dy (cdr (assoc 11 x2)))
	       (command "text" dy (* 2.5 bs) 0 b)
  	       (setq bl (entlast))
;;;  改颜色和样式
  	       (setq bl (entget bl))
  	       (setq bl (cons (cons 62 3) bl))
   	       (entmod bl)
	       (setq ysn (cons 7 "FS"))
               (setq yso (assoc 7 bl))
               (setq b1 (subst ysn yso bl))
               (entmod b1))))


