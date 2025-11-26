@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista Interface Inversiones'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo: {
    typeName: 'Inversión',
    typeNamePlural: 'Inversiones',
    title: { type: #STANDARD, value: 'Description' }
}
define root view entity ZI_HEADER_INVE
  as select from zheader_inve as Inversion 
  composition [0..*] of ZI_BONO_SCHEDULE as _Schedule
{
  @UI.lineItem: [{ position: 10, label: 'ID Inversión' }]
  key invest_id as InvestId,
      @UI.lineItem: [{ position: 20, label: 'Tipo Activo' }]
      @UI.selectionField: [{ position: 10 }] // Esto crea un filtro arriba
      asset_type as AssetType,
      @UI.lineItem: [{ position: 30, label: 'Descripción' }]
      description as Description,
      @UI.lineItem: [{ position: 40, label: 'Monto Nominal' }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      nominal_amount as NominalAmount,
      @UI.lineItem: [{ position: 40, label: 'Currency' }]
      currency_code as CurrencyCode,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      @UI.lineItem: [{ position: 40, label: 'Precio Total de Compra' }]
      total_buy_price as TotalBuyPrice,      
      @Semantics.amount.currencyCode : 'CurrencyCode'
      local_tax_basis as LocalTaxBasis,
      status as Status,
      created_by as CreatedBy,
      created_at as CreatedAt,
      _Schedule
}
