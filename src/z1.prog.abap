*&---------------------------------------------------------------------*
*& Report Z1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z1.

SELECT  matnr,
        ersda,
        ernam,
        laeda,
        aenam,
        vpsta FROM mara INTO TABLE @DATA(lit_mara) UP TO 5 ROWS.

IF sy-subrc = 0.
  READ TABLE lit_mara INTO DATA(lwa_mara) WITH KEY matnr = 'LINER'.
  IF sy-subrc = 0.
    WRITE : lwa_mara.
  ENDIF.
ENDIF.
