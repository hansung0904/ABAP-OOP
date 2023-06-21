* Reference 변수 선언
DATA : g_custom_container1 TYPE REF TO cl_gui_custom_container, g_grid1 TYPE REF TO cl_gui_alv_grid.

* Container Control 인스턴스 생성
CREATE OBJECT g_custom_container1
    EXPORTING container_name = 'CONTAINER_1'.

* ALV Grid Control 인스턴스를 생성
CREATE OBJECT g_grid1
    EXPORTING i_parent = g_custom_container1.
    
* 필요한 함수 및 이벤트를 호출해서 기능 구현
** list display
CALL METHOD g_grid1->set_table_for_first_display
    EXPORTING
        i_structure_name = 'ZOOPEMPL'    
    CHANGING
        it_outtab   =  it_zoopempl.
        
* Desturctor Method를 호출해서 Custom Container를 Destroy하고, 두 개의 Instance를 clear한다.
IF NOT g_custom_container1 IS INITIAL.
    " destroy custom containers
    CALL METHOD g_custom_container1->free
        EXCEPTIONS
            cnt1_system_error = 1
            cnt1_error = 2.
            
    CALL METHOD cl_gui_cfw=>flush
        EXCEPTIONS
            cnt1_system_error = 1
            cnt1_error = 2.
            
    CLEAR g_custom_container1.
    CLEAR g_grid1.
ENDIF.            