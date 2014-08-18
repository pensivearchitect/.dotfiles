(defun edmacro-subseq (seq start &optional end)
  "Return the subsequence of SEQ from START to END.
If END is omitted, it defaults to the length of the sequence.
If START or END is negative, it counts from the end."
  (if (stringp seq) (substring seq start end)
    (let (len)
      (and end (< end 0) (setq end (+ end (setq len (length seq)))))
      (if (< start 0) (setq start (+ start (or len (setq len (length seq))))))
      (cond ((listp seq)
	     (if (> start 0) (setq seq (nthcdr start seq)))
	     (if end
		 (let ((res nil))
		   (while (>= (setq end (1- end)) start)
		     (cl-push (cl-pop seq) res))
		   (nreverse res))
	       (copy-sequence seq)))
	    (t
	     (or end (setq end (or len (length seq))))
	     (let ((res (make-vector (max (- end start) 0) nil))
		   (i 0))
	       (while (< start end)
		 (aset res i (aref seq start))
		 (setq i (1+ i) start (1+ start)))
	       res))))))
(defmacro cl-push (x place) (list 'setq place (list 'cons x place)))
(defmacro cl-pop (place)
  (list 'car (list 'prog1 place (list 'setq place (list 'cdr place)))))
(defmacro cl-pop2 (place)
  (list 'prog1 (list 'car (list 'cdr place))
	(list 'setq place (list 'cdr (list 'cdr place)))))

(provide 'cl-patch)
