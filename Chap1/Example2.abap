CLASS lcl_airplane DEFINITION.
    PUBLIC SECTION.
        CONSTANTS: pos_l TYPE i VALUE 30.

        METHODS: Constructor IMPORTING
                 im_name TYPE string
                 im_planetype TYPE saplane-planetype,
                 display_attributes.

        CLASS-METHODS : display_n_o_airplanes.
            
    PRIVATE SECTION.
        
        DATA : name TYPE string, planetype TYPE saplane-planetype.
        CLASS-DATA : n_o_airplanes TYPE i.
ENDCLASS.