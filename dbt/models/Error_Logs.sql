{{ config(
    materialized='incremental'
) }}

select ERROR_MESSAGE,ERROR_DATE,TABLE_NAME,ROW_ID
from (
    SELECT 'detected NULL value for ReId' AS ERROR_MESSAGE, GETDATE() AS ERROR_DATE, 'Staging_Abrechnung_Positionen' AS TABLE_NAME, id AS ROW_ID
    FROM {{ ref('Staging_Abrechnung_Positionen') }}
    WHERE ReId is null
    
    UNION ALL

    SELECT 'detected NULL value for ReId' AS ERROR_MESSAGE, GETDATE() AS ERROR_DATE, 'Staging_Abrechnung_Positionen' AS TABLE_NAME, id ROW_ID
    FROM {{ ref('Staging_Abrechnung_Positionen') }}
    WHERE KdNr is null or KdNr not in (
    select distinct KdNr
    from {{ ref('Staging_Abrechnung_Kunden') }}
)
)