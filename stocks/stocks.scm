lang #scheme

(define tab1 (list 2 9 11 5 1 6 10))
(define tab2 '())

;; (define (profit tab n)
		;; (cond 
		;; ((or (null? tab) (null? (cdr tab))) 
				;; (display "DONE!\nn= ")
                                ;; (display n)
                                ;; (newline))
		;; (else
                 ;; (let (iter tab n x)
                        ;; (cond 
			;; ((> (- (car tab) x) n) 
                         ;; (set! n (- (car (cdr tab)) x))
                         ;; (display (string-append "New high: " n)))
                        ;; (iter (cdr tab) n x)))
                   ;; (iter tab n (car tab))))
		;; ((profit (cdr tab) n)))
;; 
(define (profit-no-loop tab)
	((define low (car tab))
	(define diff 0)
	(define res 0)
	(define (funct low diff res)
		(cond ((> (car (cdr tab)) low) (set! diff (- (car (cdr tab)) low)))
			((< res diff) (set! res diff))
			(else 
				(set! low (car (cdr tab)))) (res)) 
	(funct low diff res)
	))
)


(profit-no-loop tab1)
(display (string-append "this is\n" "bullshit!!!"))						
