@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista Interface Cronograma'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_BONO_SCHEDULE as select from zbono_schedule as Schedule
  association to parent ZI_HEADER_INVE as _Header
    on $projection.InvestId = _Header.InvestId
{
  key invest_id as InvestId,
  key schedule_item as ScheduleItem,
  Schedule.payment_date as PaymentDate,
  Schedule.currency_code as CurrencyCode,
  @Semantics.amount.currencyCode : 'CurrencyCode'
  Schedule.nominal_amort as NominalAmort,
  @Semantics.amount.currencyCode : 'CurrencyCode'
  Schedule.interest_amount as InterestAmount,
  Schedule.applied_rate as AppliedRate,
  Schedule.cer_adjustment as CerAdjustment,
  Schedule.payment_received as PaymentReceived,     
  _Header 
}
