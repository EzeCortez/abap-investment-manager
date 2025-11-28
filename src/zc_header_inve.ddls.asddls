@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista Proyeccion Header'
@Metadata.ignorePropagatedAnnotations: true

@UI.headerInfo: {
    typeName: 'Inversión',
    typeNamePlural: 'Inversiones',
    title: { type: #STANDARD, value: 'Description' }
}

define root view entity ZC_HEADER_INVE
  provider contract transactional_query
  as projection on ZI_HEADER_INVE
{
      
      @UI.facet: [
        
        { id: 'DatosGenerales',
          purpose: #STANDARD,
          type: #IDENTIFICATION_REFERENCE,
          label: 'Información General',
          position: 10 },

        
        { id: 'Cronograma',
          purpose: #STANDARD,
          type: #LINEITEM_REFERENCE,
          label: 'Cronograma de Pagos',
          position: 20,
          targetElement: '_Schedule' } 
      ]

      @UI.hidden: true
      key InvestId,

      @UI.lineItem:       [{ position: 10, label: 'Tipo Activo', criticality: 'StatusCriticality' }]
      @UI.selectionField: [{ position: 10 }]
      @UI.identification: [{ position: 10, label: 'Tipo de Activo' }]
      AssetType,

      @UI.lineItem:       [{ position: 20, label: 'Descripción' }]
      @UI.identification: [{ position: 20, label: 'Descripción' }]
      Description,

      @UI.lineItem:       [{ position: 30, label: 'Monto Nominal' }]
      @UI.identification: [{ position: 30, label: 'Monto Nominal' }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      NominalAmount,

      
      
      @UI.hidden: true
      CurrencyCode,

      @UI.lineItem:       [{ position: 40, label: 'Precio Compra' }]
      @UI.identification: [{ position: 40, label: 'Precio Total Compra' }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalBuyPrice,

      @UI.lineItem:       [{ position: 50, label: 'Base Imponible' }]
      @UI.identification: [{ position: 50, label: 'Base Imponible' }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      LocalTaxBasis,

      @UI.lineItem:       [{ position: 60, label: 'Estado', criticality: 'StatusCriticality' }]
      Status,
      
      @UI.hidden: true
      StatusCriticality, 

      CreatedBy,
      CreatedAt,

      _Schedule : redirected to composition child ZC_BONO_SCHEDULE
}
