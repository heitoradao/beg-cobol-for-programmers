       IDENTIFICATION DIVISION.
       PROGRAM-ID. Listing7-3.
       AUTHOR. Michael Coughlan.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
          SELECT EmployeeFile ASSIGN TO "Employee.dat"
                 ORGANIZATION IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD EmployeeFile.
           COPY 'EMPLOYEE.CPY'.

       PROCEDURE DIVISION.
       Begin.
           OPEN EXTEND EmployeeFile
           PERFORM GetEmployeeData
           PERFORM UNTIL EmployeeDetails = SPACES
               WRITE EmployeeDetails
      *         AFTER ADVANCING 1 LINE
               PERFORM GetEmployeeData
           END-PERFORM
           CLOSE EmployeeFile
           DISPLAY "************* End of Input ****************"

           OPEN INPUT EmployeeFile
           READ EmployeeFile
             AT END SET EndOfEmployeeFile TO TRUE
           END-READ
           PERFORM UNTIL EndOfEmployeeFile
              DISPLAY EmployeeDetails
              READ EmployeeFile
                AT END SET EndOfEmployeeFile TO TRUE
              END-READ
           END-PERFORM
           CLOSE EmployeeFile
           STOP RUN
           .

       GetEmployeeData.
           DISPLAY "nnnnnnnnnSSSSSSSSSSSSSSSFFFFFFFFFFyyyyMMddG"
           ACCEPT EmployeeDetails
      *    MOVE "\n" TO LineEnding
           .
