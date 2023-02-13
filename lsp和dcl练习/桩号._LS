(defun c:zh()
  setq a (getpoint "ѡһ�㣺\n")
  setq b (polar a 0 1200)
  (command "ellipse" a b 300))