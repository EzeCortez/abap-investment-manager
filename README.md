# 📊 SAP BTP Treasury & Compliance Manager

### Resumen Ejecutivo
Sistema *End-to-End* desarrollado en **ABAP Cloud** (RAP) para la gestión y auditoría de portafolios de inversión corporativos. 

El objetivo principal de este proyecto es solucionar la falta de integridad en los datos financieros crudos, proporcionando una "fuente de verdad" pre-validada y lista para auditoría (Audit-Ready) que cumple con estándares de **Compliance Fiscal**.

### 🚀 Arquitectura y Tecnologías
Este proyecto sigue el modelo de programación **RAP (RESTful Application Programming Model)** sobre S/4HANA:

* **Backend Logic:** ABAP OO (Clases globales para cálculos financieros complejos).
* **Data Model:** CDS View Entities (Root & Child hierarchy) con asociaciones y composiciones.
* **Business Logic:** Behavior Definitions (Managed Implementation) para validaciones CRUD y manejo de estados.
* **Frontend:** SAP Fiori Elements (List Report & Object Page) generado automáticamente vía anotaciones OData V4.
* **Version Control:** abapGit.

### 🌟 Funcionalidades Clave (Features)
1.  **Motor de Cálculo Financiero:** Clase `ZCL_FIN_MATH` que realiza cálculos de ROI (Retorno de Inversión) y devengo de intereses en tiempo real.
2.  **Validación de Compliance:** Reglas de negocio estrictas implementadas en el Behavior Pool para asegurar la integridad del dato antes de la persistencia (ej. validación de Base Imponible vs. Precio de Compra).
3.  **Gestión de Renta Fija:** Estructura relacional compleja para manejar cronogramas de pagos de bonos (amortización + interés).
4.  **Auditoría Automática:** Campos de control (`CreatedBy`, `CreatedAt`, `UUID`) gestionados automáticamente por el framework.

### 🛠️ Instalación
Este proyecto puede ser clonado en tu sistema SAP BTP o S/4HANA on-premise utilizando **abapGit**.

1.  Instala el plugin de abapGit en Eclipse ADT.
2.  Crea un nuevo repositorio online y pega la URL de este repo.
3.  Haz "Pull" para importar los objetos en tu paquete local (`$TMP` o `Z...`).

---
*Desarrollado como parte de mi portafolio profesional SAP ABAP Developer.*
