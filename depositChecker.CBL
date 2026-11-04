        identification division.
        program-id. depositChecker.
        author. vinoth.
        data division.
          working-storage section.
            01  raw-input            pic x(30).
            01  trimmed-input       pic x(30).
            01  input-len           pic 9(3) value 0.
            01  i                   pic 9(3).
            01  char-val            pic x(1).
            01  dot-count           pic 9(2) value 0.
            01  decimal-places     pic 9(2) value 0.
            01  after-dot          pic 9(1) value 0.
            01  valid-flag         pic 9(1) value 1.
            01  num-value          pic 9(6)v99.
            01  max-amount         pic 9(6)v99 value 500000.00.
            01  min-amount         pic 9(6)v99 value 1.00.

        procedure division.
        main.
            accept raw-input.
            move function trim(raw-input) to trimmed-input.
            if trimmed-input = spaces
              display 'INVALID'
              stop run
            end-if.

            compute input-len = function length(function trim(trimmed-input)).

            move 1 to valid-flag.
            move 0 to dot-count.
            move 0 to decimal-places.
            move 0 to after-dot.

            perform varying i from 1 by 1 until i > input-len
              move trimmed-input(i:1) to char-val
              if char-val = '.'
                add 1 to dot-count
                if dot-count > 1
                  move 0 to valid-flag
                end-if
                move 1 to after-dot
              else
                if char-val < '0' or char-val > '9'
                  move 0 to valid-flag
                end-if
                if after-dot = 1
                  add 1 to decimal-places
                end-if
              end-if
            end-perform.

            if valid-flag = 0 or dot-count > 1
              display 'INVALID'
              stop run
            end-if.

            if decimal-places > 2
              display 'INVALID'
              stop run
            end-if.

            if trimmed-input(1:1) = '-'
              display 'INVALID'
              stop run
            end-if.

            move trimmed-input to num-value.

            if num-value < min-amount or num-value > max-amount
              display 'INVALID'
            else
              display 'VALID'
            end-if.
            stop run.
        end program depositChecker.
