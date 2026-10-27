        identification division.
       program-id. widrawalChecker.
       author. vinoth.
       data division.
         working-storage section.
           01  account-number            pic 9(10).
           01  account-balance           pic 9(10)v99.
           01  withdrawal-amount         pic 9(10)v99.
           01  new-balance               pic 9(10)v99.
           01  withdrawal-amount-display  pic Z(10)99.
           01  new-balance-display       pic Z(10)99.

       procedure division.
       main.
           display ' '.
           display 'Enter account number: '.
           accept account-number.
           display 'Enter account balance: '.
           accept account-balance.
           display 'Enter withdrawal amount: '.
           accept withdrawal-amount.
           if withdrawal-amount > account-balance
             display 'Insufficient funds. Withdrawal denied.'
           end-if.
           if withdrawal-amount <= 0 or
              function mod(withdrawal-amount, 100) not = 0
             display 'Invalid withdrawal amount. Please enter a positive amount in multiples of 100.'
           else
             subtract withdrawal-amount from account-balance
               giving new-balance
             move withdrawal-amount to withdrawal-amount-display
             move new-balance to new-balance-display
             display 'Withdrawal successful. Withdrawal amount: '
               function trim(withdrawal-amount-display)
             display 'New balance: '
               function trim(new-balance-display)
           end-if.
           stop run.
       end program widrawalChecker.
