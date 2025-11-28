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
  key invest_id as InvestId,
      asset_type as AssetType,
      description as Description,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      nominal_amount as NominalAmount,
      currency_code as CurrencyCode,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      total_buy_price as TotalBuyPrice,      
      @Semantics.amount.currencyCode : 'CurrencyCode'
      local_tax_basis as LocalTaxBasis,
      status as Status,
      
      case status
        when 'S' then 3 // Verde
        when 'R' then 1 // Rojo
        else 0          // Neutro
      end as StatusCriticality,
      
      created_by as CreatedBy,
      created_at as CreatedAt,
      _Schedule
}
