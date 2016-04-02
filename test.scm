
(add-to-load-path "./")

(use-modules (aplay aplay))

(define audio-port (open-audio-stream 44440 1))

(play-audio-file audio-port (list-ref (command-line) 1))

(close-audio-port audio-port)
