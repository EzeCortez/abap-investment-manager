CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR header RESULT result.

    METHODS calculatefinancials FOR DETERMINE ON SAVE
      IMPORTING keys FOR header~calculatefinancials.

ENDCLASS.

CLASS lhc_Header IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

    METHOD get_global_authorizations.
        if requested_authorizations-%create eq if_abap_behv=>mk-on.
          result-%create = if_abap_behv=>auth-allowed.
        endif.
      ENDMETHOD.

METHOD CalculateFinancials.

    READ ENTITIES OF ZI_HEADER_INVE IN LOCAL MODE
      ENTITY Header
      FIELDS ( NominalAmount TotalBuyPrice )
      WITH CORRESPONDING #( keys )
      RESULT DATA(inversiones).

    DATA: update_lines TYPE TABLE FOR UPDATE ZI_HEADER_INVE,
          update_line  TYPE STRUCTURE FOR UPDATE ZI_HEADER_INVE.

    LOOP AT inversiones INTO DATA(inversion).


      DATA(lv_risk_status) = ' '. " Neutro

      IF inversion-TotalBuyPrice > 0.
        IF inversion-TotalBuyPrice < inversion-NominalAmount.
           lv_risk_status = 'S'.
        ELSE.
           lv_risk_status = 'R'.
        ENDIF.
      ENDIF.

      update_line-%tky   = inversion-%tky.
      update_line-Status = lv_risk_status.
      update_line-%control-Status = if_abap_behv=>mk-on.
      APPEND update_line TO update_lines.

    ENDLOOP.

    IF update_lines IS NOT INITIAL.
      MODIFY ENTITIES OF ZI_HEADER_INVE IN LOCAL MODE
        ENTITY Header
        UPDATE FROM update_lines.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
