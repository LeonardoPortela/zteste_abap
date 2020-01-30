FUNCTION ZFMMM_RECEBE_PESO.
*"----------------------------------------------------------------------
*"*"Interface local:
*"  IMPORTING
*"     VALUE(P_ESTACAO) TYPE  STRING
*"     VALUE(P_IP) TYPE  STRING
*"     VALUE(P_PESO) TYPE  STRING
*"  EXPORTING
*"     VALUE(P_RESULT) TYPE  STRING
*"----------------------------------------------------------------------

  DATA: WA_PESO TYPE ZTBMMRECEBEPESO.


**

  CLEAR WA_PESO.
  WA_PESO-DATA = SY-DATUM.
  WA_PESO-HORA = SY-UZEIT.
  WA_PESO-ESTACAO = P_ESTACAO.
  WA_PESO-IP = P_IP.
  WA_PESO-PESO = P_PESO.

  SELECT MAX( TICKET ) FROM ZTBMMRECEBEPESO INTO WA_PESO-TICKET.

  WA_PESO-TICKET =  WA_PESO-TICKET + 1.


  INSERT ZTBMMRECEBEPESO FROM WA_PESO.


  IF SY-SUBRC = 0.

    " P_RESULT =  'Peso Recebido'.
    " P_TICKET = WA_PESO-TICKET.
    P_RESULT =  WA_PESO-TICKET.
    CONCATENATE 'Peso Recebido/Ticket:' P_RESULT INTO P_RESULT.
    EXIT.
  ENDIF.

  IF SY-SUBRC <> 0.
    P_RESULT = 'Erro de Comunicação'.
    "P_TICKET = -1.

    EXIT.
  ENDIF.




ENDFUNCTION.
