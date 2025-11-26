@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista Proyeccion Cronograma.'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_BONO_SCHEDULE
  as projection on ZI_BONO_SCHEDULE
{
  key InvestId,
  key ScheduleItem,
  PaymentDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  NominalAmort,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  InterestAmount,
  AppliedRate,
  CerAdjustment,
  PaymentReceived,
  CurrencyCode,
  
  /* Associations */
  _Header : redirected to parent ZC_HEADER_INVE
}
