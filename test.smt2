
; test syntax
(declare-const x Int)
(declare-fun f (Int Bool) Int)
(assert (forall ((y Int)) (or (<= y 0) (> y 0))))
(assert (exists ((x (Array Int Int)) (y Int)) (or (<= y 0) (> y 0))))
(define-fun k ((x Int)) Int (+ x 1))

(check-sat)
(get-model)
(push)
(pop)
(echo "hello")
(echo "hello
    with a newline")
(echo "hello ""with inner quotes"" "  also  "another string")
(echo "hello

with ""quotes""

and newlines")
(eval y)
