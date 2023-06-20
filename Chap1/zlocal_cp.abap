REPORT zlocal_cp.
TYPE-POOLS icon.
*-------------------------------------------------------------
*       CLASS lcl_airplane DEFINITION
*-------------------------------------------------------------

CLASS lcl_airplane DEFINITION. "클래스 선언부
    PUBLIC SECTION.
        CONSTANTS: pos_l TYPE i VALUE 30.
        METHODS: constructor IMPORTING
                    im_name TYPE string
                    im_planetype TYPE saplane-planetype,
                    display_attributes.
        CLASS-METHODS : display_n_o_airplanes.
    PRIVATE SECTION.
        DATA : name TYPE string,
               planetype TYPE saplane-planetype.
        CLASS-DATA : n_o_airplanes TYPE i.
ENDCLASS.    

*-------------------------------------------------------------
*       CLASS lcl_airplane IMPLEMENTATION
*-------------------------------------------------------------

CLASS lcl_airplane IMPLEMENTATION.
    METHOD constructor.
        name = im_name.
        planetype = im_planetype.
        n_o_airplanes = n_o_airplanes + 1
    ENDMETHOD.

    METHOD display_attributes.
        WRITE: / icon_ws_plane AS ICON,
               / '목적지' : ', AT pos_l name',
               / '유형'   : ', AT pos_l planetype.'
    ENDMETHOD. 
    METHOD display_n_o_airplanes.
        WRITE: /, / '비행기수',
            AT pos_l n_o_airplanes LEFT-JUSTIFIED, /.
    ENDMETHOD.
ENDCLASS.

DATA : r_plane1 TYPE REF TO lcl_airplane,
       r_plane2 TYPE REF TO lcl_airplane.

START-OF-SELECTION.
    CREATE OBJECT r_plane1
        EXPORTING
            im_name = 'BUSAN'       
            im_planetype = '747-400'.

r_plane1->display_attributes().
r_plane2->display_n_o_airplanes().

    CREATE OBJECT r_plane2
    EXPORTING
        im_name = 'SEOUL'
        im_planetype = '747-410'.

r_plane2->display_attributes().
r_plane2->display_n_o_airplanes().