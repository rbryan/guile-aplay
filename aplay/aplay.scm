(define-module (aplay aplay)
	       #:use-module (ice-9 popen)
	       #:use-module (rnrs io ports)
	       #:use-module (rnrs bytevectors)
	       #:export (
			 open-audio-stream
			 play-value
			 play-bytevector
			 play-audio-file
			 load-audio-file
			 close-audio-stream
			  )
	       )

(define (open-audio-stream rate channels)
  (open-pipe (format #f "aplay --rate=~a --channels=~a" rate channels)
	     OPEN_WRITE))

(define (play-value stream value)
  (put-u8 stream value))

(define (play-bytevector stream bvec)
  (put-bytevector stream bvec))

(define (load-audio-file filename)
  (let* ((fport (open-file filename "r")))
    (get-bytevector-all fport)))

(define (play-audio-file stream filename)
  (put-bytevector stream (load-audio-file filename)))

(define (close-audio-stream stream)
  (close-pipe stream))
			    
