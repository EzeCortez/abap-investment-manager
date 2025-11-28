@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista Proyeccion Cronograma'
@Metadata.ignorePropagatedAnnotations: true

@UI.headerInfo: {
    typeName: 'Cuota',
    typeNamePlural: 'Cuotas del Bono',
    title: { type: #STANDARD, value: 'ScheduleItem' }
}

define view entity ZC_BONO_SCHEDULE
  as projection on ZI_BONO_SCHEDULE
{
  @UI.hidden: true
  key InvestId,

  @UI.lineItem:       [{ position: 10, label: '# Cuota' }]
  @UI.identification: [{ position: 10, label: 'Número de Cuota' }]
  key ScheduleItem,

  @UI.lineItem:       [{ position: 20, label: 'Fecha de Pago' }]
  @UI.identification: [{ position: 20, label: 'Fecha Vencimiento' }]
  PaymentDate,

  @UI.lineItem:       [{ position: 30, label: 'Amortización Capital' }]
  @UI.identification: [{ position: 30, label: 'Amortización' }]
  @Semantics.amount.currencyCode: 'CurrencyCode'
  NominalAmort,

  @UI.lineItem:       [{ position: 40, label: 'Interés (Cupón)' }]
  @UI.identification: [{ position: 40, label: 'Interés' }]
  @Semantics.amount.currencyCode: 'CurrencyCode'
  InterestAmount,

  @UI.lineItem:       [{ position: 50, label: 'Tasa Aplicada %' }]
  @UI.identification: [{ position: 50, label: 'Tasa %' }]
  AppliedRate,

  @UI.lineItem:       [{ position: 60, label: 'Ajuste CER' }]
  @UI.identification: [{ position: 60, label: 'Ajuste CER' }]
  CerAdjustment,

  @UI.lineItem:       [{ position: 70, label: 'Pagado?' }]
  @UI.identification: [{ position: 70, label: 'Pagado?' }]
  PaymentReceived,
  
  @UI.hidden: true
  CurrencyCode,
  
  /* Associations */
  _Header : redirected to parent ZC_HEADER_INVE
}
