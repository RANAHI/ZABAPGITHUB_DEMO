class ZCL_GIT definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF t_aufk,
        aufnr TYPE  aufnr,
        auart TYPE aufart,
        autyp TYPE auftyp,
        refnr TYPE aufrefnr,
        ernam TYPE auferfnam,
        erdat TYPE auferfdat,
      END OF t_aufk .
  types:
    BEGIN OF t_afko,
        aufnr TYPE  aufnr,
        gltrp TYPE  co_gltrp,
        gstrp TYPE pm_ordgstrp,
        ftrms TYPE co_ftrms,
        gltrs TYPE co_gltrs,
        gstrs TYPE co_gstrs,
        gstri TYPE co_gstri,
      END OF t_afko .

  data:
    tt_aufk1 TYPE TABLE OF t_aufk .
  data:
    tt_afko1 TYPE TABLE OF t_afko .
  data:
    it_aufk TYPE TABLE OF t_aufk .
  data:
    it_afko TYPE TABLE OF t_afko .

  methods GET_ORDER
    exporting
      !IT_AUFK like TT_AUFK1 .
  methods GET_ORDER_HEADER
    importing
      !IT_AUFK like TT_AUFK1
    exporting
      !IT_AFKO like TT_AFKO1 .
  methods DISPLAY_ORDER
    exporting
      !IT_AUFK like TT_AUFK1 .
  methods DISPLAY_ORDER_MASTER
    changing
      !IT_AFKO like TT_AFKO1 .
protected section.
private section.
ENDCLASS.



CLASS ZCL_GIT IMPLEMENTATION.


  METHOD display_order.

    cl_demo_output=>display( it_aufk ).

  ENDMETHOD.


  METHOD display_order_master.

    cl_demo_output=>display( it_afko ).

  ENDMETHOD.


  METHOD get_order.

    SELECT aufnr,
    auart,
    autyp,
    refnr,
    ernam,
    erdat
   FROM aufk INTO TABLE @it_aufk UP TO 10 ROWS.

    IF sy-subrc = 0.

      DATA : o_git TYPE REF TO zcl_git.
      CREATE OBJECT o_git.

      CALL METHOD o_git->get_order_header
        EXPORTING
          it_aufk = it_aufk
        IMPORTING
          it_afko = it_afko.

      CALL METHOD o_git->display_order
        IMPORTING
          it_aufk = it_aufk.

      CALL METHOD o_git->display_order_master
        CHANGING
          it_afko = it_afko.




    ENDIF.
  ENDMETHOD.


  METHOD get_order_header.

    IF it_aufk IS NOT INITIAL.

      SELECT  aufnr,
              gltrp,
              gstrp,
              ftrms,
              gltrs,
              gstrs,
              gstri
        FROM afko
        INTO TABLE @it_afko
        FOR ALL ENTRIES IN @it_aufk
        WHERE aufnr = @it_aufk-aufnr.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
