* reference variables 선언

DATA : g_docking_container1 TYPE REF TO cl_gui_docking_container,
       g_grid1 TYPE REF TO cl_gui_alv_grid.

DATA : g_repid  LIKE sy-repid,
       g_dynnr  TYPE sy-dynnr.

IF g_docing_container1 IS INITIAL.
    CREATE OBJECT g_docking_container1
        EXPORTING repid = g_repid
                  dynnr = g_dynnr
                  side  = g_docking_container1->dock_at_left
                  extension = 600.
ENDIF.       