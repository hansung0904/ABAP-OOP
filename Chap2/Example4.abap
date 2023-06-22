** Instantiation
DATA : g_grid TYPE REF TO cl_gui_alv_grid,
       g_custom_container TYPE REF TO cl_gui_custom_container.

** Parameters
DATA : gt_fieldcatalog  TYPE lvc_t_fcat,
       gt_fieldcatalog_ln LIKE LINE OF gt_fieldcatalog.
       
** 생성한 Screen에 로직 추가
PROCESS BEFORE OUTPUT.
    MODULE pbo_0100.
    
PROCESS AFTER INPUT.
    MODULE pai_0100.
    
FORM init.
** gui status define.
    SET PF-STATUS 'MAIN100'.

** instance create
    IF g_custom_container IS INITIAL.
        CREATE OBJECT g_custom_container
            EXPORTING container_name = 'CONTAINER'.
        CREATE OBJECT OBJECT g_grid
            EXPORTING i_parent = g_custom_container.
    ENDIF.
    
    PERFORM build_cat.
ENDFORM.

** 필드 카탈로그 구성 상세 로직
FORM build_cat.
    CLEAR gt_fieldcatalog.

    CLEAR gt_fieldcatalog_ln.
    gt_fieldcatalog_ln_fieldname = 'NAME_EMPL'.
    IF p_right = 'X'.
        gt_fieldcatalog_in-just = 'R'.
    ENDIF.
    IF p_left = 'X'.
        gt_fieldcatalog_in-just = 'L'.
    ENDIF.
    IF p_center = 'X'.
        gt_fieldcatalog_in-just = 'C'.
    ENDIF.
    APPEND gt_fieldcatalog_ln TO gt_fieldcatalog.

    CLEAR gt_fieldcatalog_ln.
        gt_fieldcatalog_ln-fieldname = 'NO_TEL'.
        gt_fieldcatalog_ln-tech = 'X'.
        APPEND gt_fieldcatalog_ln TO gt_fieldcatalog.

    CLEAR gt_fieldcatalog_ln.
    gt_fieldcatalog_ln-fieldname = 'ANNUAL_SALARY'.
    gt_fieldcatalog_ln-no_sign = 'X'.
    APPEND gt_fieldcatalog_ln TO gt_fieldcatalog.
    
    CLEAR gt_fieldcatalog_ln.
        gt_fieldcatalog_ln-fieldname = 'TENURE'.
        gt_fieldcatalog_ln-lzero = 'X'.
        APPEND gt_fieldcatalog_ln TO gt_fieldcatalog.

        CLEAR gt_fieldcatalog_ln.
        gt_fieldcatalog_ln-fieldname = 'CODE_DEPT'.
        gt_fieldcatalog_ln-edit_mask = 'LL____부'
        APPEND gt_fieldcatalog_ln TO gt_fieldcatalog.

        CLEAR gt_fieldcatalog_ln.
        gt_fieldcatalog_ln-fieldname = 'DATE_ENTER'.
        IF p_bksh = 'X'.
            gt_fieldcatalog_ln-edit_mask = '____:__:__'.
        ENDIF.
        IF p_div = 'X'.
            gt_fieldcatalog_ln-edit_mask = '==ZDATE1'.
        ENDIF.
        APPEND gt_fieldcatalog_ln TO gt_fieldcatalog.
    ENDFORM.