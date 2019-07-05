*&---------------------------------------------------------------------*
*& Report ZGIT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgit.

SELECT  matnr,
        ersda,
        ernam,
        laeda,
        aenam,
        vpsta FROM mara INTO TABLE @DATA(lit_mara) UP TO 5 ROWS.

IF sy-subrc = 0.
  LOOP AT lit_mara ASSIGNING FIELD-SYMBOL(<lfs_mara>).
    WRITE : <lfs_mara>.
  ENDLOOP.
ENDIF.
