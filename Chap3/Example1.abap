** Instatiation
DATA: g_grid TYPE REF TO cl_gui_alv_grid.
      g_custom_container TYPE REF TO cl_gui_custom_container.
DATA: g_container TYPE scrfname VALUE 'CCCONTAINER'.

** Toolbar Exclude
DATA: gt_toolbar_excluding TYPE ui_functions.
DATA: gs_toolbar_excluding TYPE ui_func.

** Fieldcatalog
DATA: gt_fieldcatalog TYPE lvc_t_fcta,
      gt_fieldcatalog_ln LIKE LINE OF gt_fieldcatalog.

** Dropdown List
DATA: lt_dropdown TYPE lvc_t_drop,
      ls_dropdown TYPE lvc_s_drop.
      
** 제외 대상 버튼
IF chk1 = 'X'.
    APPEND cl_gui_alv_gird=>mc_fc_detail TO gt_toolbar_excluding.
        TO gt_toolbar_excluding.
ENDIF.
IF chk2 = 'X'.
    gs_toolbar_excluding = '&CHECK'.
    APPEND gs_toolbar_excluding TO gt_toolbar_excluding.
ENDIF.
IF chk3 = 'X'.
    gs_toolbar_excluding = '&REFRESH'.
    APPEND gs_toolbar_excluding TO gt_toolbar_excluding.
ENDIF.

** Dropdown List 구성
* 첫 번째 listbox 는 '1'로 handle
ls_dropdown-handle = '1'.
ls_dropdown-value = 'A1'.
APPEND ls_dropdown To lt_dropdown.

ls_dropdown-handle = '1'.
ls_dropdown-value = 'A2'.
APPEND ls_dropdown TO lt_dropdown.

CALL METHOD g_grid->set_drop_down_table
    EXPORTING
        it_drop_down = lt_dropdown.

* Field Catalog에 만들어놓은 Dropdown Table 연결
* 부서 코드
CLEAR gt_fieldcatalog_ln.
gt_fieldcatalog_ln-fieldname = 'CODE_DEPT'.
gt_fieldcatalog_ln-edit = 'X'.
gt_fieldcatalog_ln-drdn_hndl = '1'.
APPEND gt_fieldcatalog_ln TO gt_fieldcatalog.

* 통화표시
CLEAR gt_fieldcatalog_ln.
gt_fieldcatalog_ln-fieldname = 'WAERS'.
gt_fieldcatalog_ln-edit = ' '.
gt_fieldcatalog_ln-drdn_hndl = '2'.
APPEND gt_fieldcatalog_ln TO gt_fieldcatalog.

** 메소드에 매개변수 반영
CALL METHOD g_grid->set_table_for_first_display
    EXPORTING
        i_structure_name = 'zdalvempl'
        it_toolbar_excluding = gt_toolbar_excluding
    CHANGING
        it_outtba = it_zdalvempl[]
        it_fieldcatalog = gt_fieldcatalog.
        
** 조회 화면을 구성하는 SELECTION-SCREEN 영역 추가
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH TITLE text-001.
SELECT-OPTIONS p_dept FOR zdalvempl-code_dept.
SELECT-OPTIONS p_empno FOR zdalvempl-no_empl.
SELECT-OPTIONS p_name FOR zdalvempl-name_empl.
SELECTION-SCREEN END FO BLOCK b1.
SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE text-002.
PARAMETERS: chk1 AS CHECKBOX,
            chk2 AS CHECKBOX,
            chk3 AS CHECKBOX.
SELECTION-SCREEN END OF BLOCK b2.                    

