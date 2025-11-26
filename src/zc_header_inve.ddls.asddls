@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista Proyeccion Header.'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_HEADER_INVE
  provider contract transactional_query  // <--- Esta es la clave
  as projection on ZI_HEADER_INVE
{
  key InvestId,
      AssetType,
      Description,      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      NominalAmount,
      CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalBuyPrice,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      LocalTaxBasis,
      Status,
      CreatedBy,
      CreatedAt,
      _Schedule : redirected to composition child ZC_BONO_SCHEDULE
}

