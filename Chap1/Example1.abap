CLASS lcl_cargo_plane IMPLEMENTATION.
    METHOD Constructor.
        CALL METHOD super->Constructor(im_name = im_name
                                       im_planetype = im_planetype).
        max_cargo = im_cargo.
    ENDMETHOD.
ENDCLASS.

CLASS lcl_airplane DEFINITION.
    PUBLIC SECTION.
        CONSTANTS: pos_l TYPE i VALUE 30.

        METHODS: Constructor IMPORTING
                 im_name TYPE string
                 im_planetype TYPE saplane-planetype,
                 display_attributes.
CLASS-METHODS: display_n_o_airpalnes.

PEIRVATE SECTION.