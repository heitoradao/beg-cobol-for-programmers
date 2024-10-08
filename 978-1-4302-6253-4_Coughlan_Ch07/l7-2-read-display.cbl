      *------------------------------------------------------
       IDENTIFICATION DIVISION.
      *------------------------------------------------------
       PROGRAM-ID. Listing7-2.
       AUTHOR. Michael Coughlan.

      *------------------------------------------------------
       ENVIRONMENT DIVISION.
      *------------------------------------------------------
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
          SELECT EmployeeFile ASSIGN TO "Employee.dat"
                 ORGANIZATION IS SEQUENTIAL.

      *------------------------------------------------------
       DATA DIVISION.
      *------------------------------------------------------
       FILE SECTION.
       FD EmployeeFile.
           COPY "EMPLOYEE.CPY".

      *------------------------------------------------------
       PROCEDURE DIVISION.
      *------------------------------------------------------
       Begin.
           OPEN INPUT EmployeeFile
           READ EmployeeFile
             AT END SET EndOfEmployeeFile TO TRUE
           END-READ
           PERFORM UNTIL EndOfEmployeeFile
             PERFORM 230000-ProcessFile
             PERFORM 200000-ReadHeader
           END-PERFORM
           PERFORM 210000-CloseFile
           STOP RUN
           .


       200000-ReadHeader.
           READ EmployeeFile
             AT END SET EndOfEmployeeFile TO TRUE
           END-READ
           .


       210000-CloseFile.
           CLOSE EmployeeFile
           .

       230000-ProcessFile.
           DISPLAY EmpForename SPACE EmpSurname ' - '
                   EmpDOB '/' EmpMOB '/' EmpYOB
           .

