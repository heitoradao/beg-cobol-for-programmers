       IDENTIFICATION DIVISION.
       PROGRAM-ID. Listing5-10.
       AUTHOR. Michael Coughlan.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 PlayerGuess-A    PIC 9  VALUE 0.
           88 Rock-A        VALUE 1.
           88 Paper-A       VALUE 2.
           88 Scissors-A    VALUE 3.

       01 PlayerGuess-B    PIC 9  VALUE 0.
           88 Rock-B        VALUE 1.
           88 Paper-B       VALUE 2.
           88 Scissors-B    VALUE 3.

       PROCEDURE DIVISION.
       BEGIN.
           DISPLAY "Guess for player A (1=rock, 2=scissors, 3=paper) : "
               WITH NO ADVANCING
           ACCEPT PlayerGuess-A

           DISPLAY "Guess for player B (1=rock, 2=scissors, 3=paper) : "
               WITH NO ADVANCING
           ACCEPT PlayerGuess-B

           DISPLAY 'VALUE OF A IS ' PlayerGuess-A
           DISPLAY 'VALUE OF B IS ' PlayerGuess-B

           EVALUATE  TRUE    ALSO    TRUE
            WHEN Rock-A      ALSO    Rock-B      DISPLAY "Draw"
            WHEN Rock-A      ALSO    Paper-B     DISPLAY "B wins (RxP)"
            WHEN Rock-A      ALSO    Scissors-B  DISPLAY "A wins RxS"
            WHEN Paper-A     ALSO    Rock-B      DISPLAY "A wins PxR"
            WHEN Paper-A     ALSO    Paper-B     DISPLAY "Draw"
            WHEN Paper-A     ALSO    Scissors-B  DISPLAY "B wins (PxS)"
            WHEN Scissors-A  ALSO    Rock-B      DISPLAY "B wins (SxR)"
            WHEN Scissors-A  ALSO    Paper-B     DISPLAY "A wins (SxP)"
            WHEN Scissors-A  ALSO    Scissors-B  DISPLAY "Draw"
            WHEN OTHER   DISPLAY "Evaluate problem"
           END-EVALUATE
           STOP RUN
           .

