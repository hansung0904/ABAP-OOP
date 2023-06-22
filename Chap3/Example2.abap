** Instantiation
DATA: g_grid TYPE REF TO cl_gui_alv_grid,
      g_custom_container TYPE REF TO cl_gui_custom_container.
DATA: g_container TYPE scrfname VALUE 'CCCONTAINER'.

** Filter
DATA: gt_filter TYPE lvc_t_filt,
      ls_filter TYPE lvc_s_filt.

** Variant
DATA: x_save,
      x_default,
      g_repid LIKE sy-repid,
      g_log_grp LIKE sy-tcode,
      g_usr_name LIKE sy-uname,
      gs_variant TYPE disvariant.
      
** 두 번째, 필터 적용
CLEAR: ls_filter.
    
    ls_filter-fieldname = 'TENURE'.
    ls_filter-sign = 'I'.
    ls_filter-option = 'BT'.
    ls_filter-low = '20'.
    ls_filter-high = '30'.
    APPEND ls_filter TO pt_filt.

** 세 번째, variant 적용
* IS_VARIANT
g_repid = sy-repid.
g_log_grp = sy-tcode.
g_usr_name = sy-uname.
gs_variant-report = sy-repid.
gs_variant-variant = p_var1.
IF g_log_grp = 'SEU_INT' OR g_log_grp IS INITIAL.
    gs_variant-log_group = ' '.
ELSE.
    gs_variant-log_group = g_log_grp.
ENDIF.
gs_variant-username = g_usr_name.

* I_SAVE
x_save = 'A'.

*I_DEFAULT
x_default = 'X'.

* 메소드 매개변수 반영
CALL METHOD g_grid->set_table_for_first_display
    EXPORTING
        i_structure_name = 'zoopempl'
        i_default = x_default
        is_variant = gs_variant
        i_save = x_save
    CHANGING
        it_outtab = it_zoopempl[]
        it_filter = gt_filter.
        
* 조회 화면 구성하는 SELECTION-SCREEN 영역
SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-001.
SELECT-OPTIONS p_dept FOR zoopempl-code_dept.
SELECT-OPTIONS p_empno FOR zoopempl-no_empl.
SELECT-OPTIONS p_name FOR zoopempl-name_empl.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-002.
PARAMETERS: p_var1(12).
SELECTION-SCREEN END FO BLOCK b2.

