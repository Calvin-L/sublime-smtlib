; SYNTAX TEST "smtlib2.sublime-syntax"

; To run these tests you will need to open this file in Sublime Text.  This
; file MUST be located in the SMT-LIB package inside your packages directory.
; Then run Tools > Build from the menu.

; test syntax
; ^^^^^^^^^^^ comment

(declare-const x Int)
; ^                  keyword
;              ^     entity.name
;                ^^^ storage.type

(declare-fun f (Int Bool) Int)
; ^                           keyword
;            ^                entity.name
;               ^^^           storage.type
;                   ^^^^      storage.type
;                         ^^^ storage.type

(assert (forall ((y Int)) (or (<= y 0) (> y 0))))
; ^                                   keyword
;        ^^^^^^                       variable.function
;                 ^                   variable.parameter
;                   ^^^               storage.type
;                          ^^         variable.function
;                              ^^     keyword.operator
;                                   ^ constant.numeric

(assert (exists ((x (Array Int Int)) (y Int)) (or (<= y 0) (> y 0))))
; ^                                     keyword
;        ^^^^^^                         variable.function
;                 ^                     variable.parameter
;                    ^^^^^              storage.type
;                          ^^^          storage.type
;                              ^^^      storage.type
;                                     ^ variable.parameter

(define-fun k ((x Int)) Int (+ x 1))
; ^^^^^^^^^                        keyword
;           ^                      entity.name
;               ^                  variable.parameter
;                 ^^^              storage.type
;                       ^^^        storage.type
;                            ^     keyword.operator
;                                ^ constant.numeric

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

(define-fun x () Int #xFFa)
(define-fun y () Int #b010)
(declare-sort MyType)
