*&---------------------------------------------------------------------*
*& Report  Z_TESTAR_COMUNIC
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT Z_TESTAR_COMUNIC.


**Variaveis
 DATA:
    LV_IP_BAL    TYPE STRING,
    LV_TICKET    TYPE /SMB/INT,
    LV_PESO      TYPE LVS_SUM_WEIGHT.


**CHAMAR PROGRAMA DE CAPTURA

CALL METHOD cl_gui_frontend_services=>execute
  EXPORTING
    application            = 'C:\balanca\Balanca_Web_XE7.exe'.





 SELECT SINGLE IP
    FROM /ABSD/DT_PORTBAL
   INTO LV_IP_BAL
    WHERE CODBAL = '0004'
    AND   CENTRO = '0101'.



WAIT UP TO 12 SECONDS.

**Recuperar ultimo TICKET

   SELECT MAX( TICKET )
     FROM ZTBMMRECEBEPESO
     INTO  LV_TICKET
    WHERE  IP = '192.168.1.144'
    AND USADO = ' '.






   SELECT MAX( PESO )
     FROM ZTBMMRECEBEPESO
     INTO  LV_PESO
    WHERE  TICKET  = LV_TICKET
    AND USADO = ' '.






  WRITE: / 'Peso:',  LV_PESO.

  UPDATE ZTBMMRECEBEPESO
    SET: USADO = 'S'
     WHERE  IP = '192.168.1.144'.

**com o ID do peso recuperar o peso









write: / 'IP da balança: ' , LV_IP_BAL.
