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
