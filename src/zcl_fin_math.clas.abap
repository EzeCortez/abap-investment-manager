CLASS zcl_fin_math DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    " 1. Definición de Tipos (Estructuras de Datos)
    TYPES:
      BEGIN OF ts_schedule,
        payment_date     TYPE zbono_schedule-payment_date,
        payment_received TYPE zbono_schedule-payment_received,
        nominal_amort    TYPE zbono_schedule-nominal_amort,
        interest_amount  TYPE zbono_schedule-interest_amount,
      END OF ts_schedule,

      ty_roi TYPE p LENGTH 8 DECIMALS 2,
      tt_schedule TYPE STANDARD TABLE OF ts_schedule WITH EMPTY KEY.

     " 2. Definición de Métodos
    CLASS-METHODS calculate_roi
      IMPORTING
        iv_asset_type TYPE zheader_inve-asset_type
        it_schedule   TYPE tt_schedule
        iv_buy_price TYPE zheader_inve-total_buy_price
      RETURNING
        VALUE(rv_roi) TYPE ty_roi.

    CLASS-METHODS validate_tax_compliance
      IMPORTING
        iv_tax_basis TYPE zheader_inve-local_tax_basis
        iv_buy_price TYPE zheader_inve-total_buy_price
      RETURNING
        VALUE(rv_valid) TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_fin_math IMPLEMENTATION.
  METHOD calculate_roi.
    FIELD-SYMBOLS <fs_payment> TYPE ts_schedule.

    LOOP AT it_schedule ASSIGNING <fs_payment>.
    rv_roi = rv_roi + <fs_payment>-interest_amount.
    ENDLOOP.

    IF iv_buy_price <> 0.
        rv_roi = ( rv_roi / iv_buy_price ) * 100.
    ENDIF.
  ENDMETHOD.

  METHOD validate_tax_compliance.
    if iv_tax_basis > iv_buy_price.
        rv_valid = abap_false.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
