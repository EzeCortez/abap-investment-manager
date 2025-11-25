# 📊 SAP RAP Portfolio: Treasury Management (End-to-End)

### Resumen Ejecutivo
Implementación de una aplicación transaccional Full-Stack en **ABAP Cloud (RAP)** para la gestión de portafolios de inversión corporativos. El proyecto demuestra el dominio completo del "Golden Path" de SAP, desde la creación de tablas con sintaxis moderna hasta el despliegue del frontend Fiori Elements.

**Foco Principal:** Demostrar la capacidad de construir y exponer una jerarquía de datos compleja (Cabecera 1:N Pagos) para la gestión de activos financieros variables (Renta Fija).

### 🚀 Arquitectura y Tecnologías
* **Backend Framework:** **RAP (RESTful Application Programming Model)**, utilizando Managed Implementation para gestionar el ciclo de vida (CRUD).
* **Data Model (CDS):** Vistas **Root** y **Composition** para manejar la relación 1:N entre la inversión y su cronograma de pagos.
* **Lógica:** Clase `ZCL_FIN_MATH` (ABAP OO) para encapsular la lógica de **cálculo de ROI** y las **validaciones de coherencia**.
* **Frontend:** SAP Fiori Elements (UI) generado automáticamente vía OData V4.
* **Control:** Implementación de reglas de **Seguridad Global** (`get_global_authorizations`) y **Mapeo** (Traducción de CamelCase a snake_case).
* **Version Control:** abapGit.

### 🌟 Funcionalidades Clave (MVP Actual)
1.  **Gestión de Renta Fija:** Estructura de datos funcional para registrar y almacenar **Cronogramas de Pagos** (amortización e interés).
2.  **Motor de Cálculo Básico:** Estructura para el cálculo de ROI con chequeo de división por cero.
3.  **Transaccionalidad:** Habilitación de las operaciones **Create, Read, Update, Delete (CRUD)** completas.
4.  **Audit Trail:** Campos de auditoría (`CreatedBy`, `CreatedAt`) gestionados por el framework.

---
*Desarrollado como parte de mi portafolio profesional SAP ABAP Developer.*
