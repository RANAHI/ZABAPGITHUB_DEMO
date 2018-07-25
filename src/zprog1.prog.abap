*&---------------------------------------------------------------------*
*& Report ZPROG1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZPROG1.

SELECT  matnr,
        ersda,
        ernam,
        laeda,
        aenam,
        vpsta FROM mara INTO TABLE @DATA(lit_mara) UP TO 5 ROWS.

IF sy-subrc = 0.
*cl_demo_output=>display( lit_mara ).
read table lit_mara into data(lwa_mara) with key matnr = 'LINER'.
IF sy-subrc = 0.
write : lwa_mara.
endif.

*read table lit_mara into data(lwa_mara) with key matnr = 'R-COVER'.
*IF sy-subrc = 0.
*write : lwa_mara.
*endif.

ENDIF.
