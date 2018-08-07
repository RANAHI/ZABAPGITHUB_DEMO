*&---------------------------------------------------------------------*
*& Report ZGIT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZGIT.

SELECT  matnr,
        ersda,
        ernam,
*        laeda,
*        aenam,
        vpsta FROM mara INTO TABLE @DATA(lit_mara) UP TO 5 ROWS.

IF sy-subrc = 0.
  cl_demo_output=>display( lit_mara ).
ENDIF.
