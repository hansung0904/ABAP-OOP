* Reference 변수 선언

DATA : splitter TYPE REF TO cl_gui_splitter_container,
       container TYPE REF TO cl_gui_custom_container,
       container_1 TYPE REF TO cl_gui_container,
       container_2 TYPE REF TO cl_gui_container,
       g_grid1  TYPE REF TO cl_gui_alv_grid,
       g_grid2 TYPE REF TO cl_gui_alv_grid.

* container 인스턴스 생성
CREATE OBJECT container
    EXPORTING container_name = ' CONTAINER_1'.

* splitter라는 이름을 가진 인스턴스 생성
CREATE OBJECT splitter
    EXPORTING parent = container
              rows = 2
              columns = 2.
              
* CL_GUI_SPLITTER_CONTAINER 클래스의 get_container 메소드를 호출해서 각 영역에서 정의한 container_1과 container_2릃 ㅏㄹ당
CALL METHOD splitter->get_container
    EXPORTING
        row = 1
        column = 1
    RECEIVING
        container = container_1.
        
CALL METHOD splitter->get_container
    EXPORTING
        row = 1
        column = 2
    RECEIVING
        container = container_2.

* container_1, container_2에 Application Control인 g_grid1과 g_grid2를 부모 자식 관계로 연결.
CREATE OBJECT g_girl1
    EXPORTING i_parent=container_1.        

CREATE OBEJCT g_girl2
    EXPORTING i_parent=container_2.    