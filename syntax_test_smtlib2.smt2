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

(declare-fun y () Int)
; ^                           keyword
;            ^                entity.name
;                 ^^^         storage.type

(declare-fun f (Int Bool) Int)
; ^                           keyword
;            ^                entity.name
;               ^^^           storage.type
;                   ^^^^      storage.type
;                         ^^^ storage.type

(assert (or (<= y 0) (> y 0)))
;        ^^         variable.function
;            ^^     keyword.operator
;                 ^ constant.numeric

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

(define-fun xforall () Int yforall)
;           ^^^^^^^                - variable.function
;                          ^^^^^^^ - variable.function

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
; ^^^^^^^^^                        keyword
;           ^                      entity.name
;                ^^^               storage.type
;                     ^^^^         constant.numeric

(define-fun x0 () Int #xFFa)
;           ^^                     entity.name
;            ^                     - constant.numeric

(declare-sort MyType)
; ^^^^^^^^^^^                      keyword
;             ^^^^^^               entity.name


(define-sort Set (T) (Array T Bool))
; ^^^^^^^^^^                       keyword
;            ^^^                   entity.name
;                     ^^^^^        storage.type
;                             ^^^^ storage.type

(declare-datatypes ((Value 0)) (
; ^^^^^^^^^^^^^^^^                 keyword
;                    ^^^^^         entity.name
;                          ^       constant.numeric
  (
    (VBool (bool-value Bool))
;    ^^^^^                         entity.name
;                      ^^^^        storage.type
    (VInt (int-value Int))
;    ^^^^                          entity.name
;                    ^^^           storage.type
    (VSet (set-value (Set Value))))))
;    ^^^^                          entity.name
;                     ^^^          storage.type
;                         ^^^^^    storage.type

(define-fun BigFunc ((S MyType)) Bool
;^^^^^^^^^^                           keyword
;           ^^^^^^^                   entity.name
;                     ^               variable.parameter
;                                ^^^^ storage.type
    ; Require that all instances of MyType equal S
;   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment
    (forall ((T MyType) (i Int)) (= S T)))
;    ^^^^^^ variable.function
;                          ^^^ storage.type

; -----------------------------------------------------------------------------
; A long series of tests checking that comments can appear in various places.

(
    ;comment
    assert (forall ((x Int)) (> 0 x)))
;                    ^                   variable.parameter
;                      ^^^               storage.type
;                             ^          keyword.operator
;                               ^        constant.numeric

(assert
    ;comment
    (forall ((x Int)) (> 0 x)))
;             ^                   variable.parameter
;               ^^^               storage.type
;                      ^          keyword.operator
;                        ^        constant.numeric

(assert (
    ;comment
    forall ((x Int)) (> 0 x)))
;            ^                   variable.parameter
;              ^^^               storage.type
;                     ^          keyword.operator
;                       ^        constant.numeric

(assert (forall
    ;comment
    ((x Int)) (> 0 x)))
;     ^                   variable.parameter
;       ^^^               storage.type
;              ^          keyword.operator
;                ^        constant.numeric

(assert (forall (
    ;comment
    (x Int)) (> 0 x)))
;    ^                   variable.parameter
;      ^^^               storage.type
;             ^          keyword.operator
;               ^        constant.numeric

(assert (forall ((
    ;comment
    x Int)) (> 0 x)))
;   ^                   variable.parameter
;     ^^^               storage.type
;            ^          keyword.operator
;              ^        constant.numeric

(assert (forall ((x
;                 ^     variable.parameter
    ;comment
    Int)) (> 0 x)))
;   ^^^               storage.type
;          ^          keyword.operator
;            ^        constant.numeric

(assert (forall ((x Int
;                 ^                   variable.parameter
;                   ^^^               storage.type
    ;comment
    )) (> 0 x)))
;       ^          keyword.operator
;         ^        constant.numeric

(assert (forall ((x Int)
;                 ^                   variable.parameter
;                   ^^^               storage.type
    ;comment
    ) (> 0 x)))
;      ^          keyword.operator
;        ^        constant.numeric

(assert (forall ((x Int))
;                 ^                   variable.parameter
;                   ^^^               storage.type
    ;comment
    (> 0 x)))
;    ^          keyword.operator
;      ^        constant.numeric

(assert (forall ((x Int)) (
;                 ^                   variable.parameter
;                   ^^^               storage.type
    ;comment
    > 0 x)))
;   ^          keyword.operator
;     ^        constant.numeric

(assert (forall ((x Int)) (>
;                 ^                   variable.parameter
;                   ^^^               storage.type
;                          ^          keyword.operator
    ;comment
    0 x)))
;   ^        constant.numeric

(assert (forall ((x Int)) (> 0
;                 ^                   variable.parameter
;                   ^^^               storage.type
;                          ^          keyword.operator
;                            ^        constant.numeric
    ;comment
    x)))

(assert (forall ((x Int)) (> 0 x
;                 ^                   variable.parameter
;                   ^^^               storage.type
;                          ^          keyword.operator
;                            ^        constant.numeric
    ;comment
    )))

(assert (forall ((x Int)) (> 0 x)
;                 ^                   variable.parameter
;                   ^^^               storage.type
;                          ^          keyword.operator
;                            ^        constant.numeric
    ;comment
    ))

(assert (forall ((x Int)) (> 0 x))
;                 ^                   variable.parameter
;                   ^^^               storage.type
;                          ^          keyword.operator
;                            ^        constant.numeric
    ;comment
    )

(declare-fun $is_init (Int $State) Bool)
;            ^^^^^^^^                     entity.name
;                      ^^^                storage.type
;                                  ^^^^   storage.type
