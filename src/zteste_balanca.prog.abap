*&---------------------------------------------------------------------*
*& Report  ZTESTE_BALANCA
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ZTESTE_BALANCA.
CALL METHOD cl_gui_frontend_services=>execute
  EXPORTING
   application            = 'taskkill'
   parameter              = '/f /IM Balanca_Web_XE7.exe'.

*CALL METHOD cl_gui_frontend_services=>execute
*  EXPORTING
*    application            = 'C:\Leonardo\SAP-ABAP\Desenvolvimento\Peso_Balança\Balança_delphi\Debug\Win32\Balanca_Web_XE7.exe'

*.

*CALL FUNCTION 'RZL_SLEEP'
* EXPORTING
*    SECONDS        = 5
*  EXCEPTIONS
*    ARGUMENT_ERROR = 1
*    OTHERS         = 2.


*CALL METHOD cl_gui_frontend_services=>execute
*  EXPORTING
*   application            = 'taskkill'
*   parameter              = '/f /IM Balanca_Web_XE7.exe'.
