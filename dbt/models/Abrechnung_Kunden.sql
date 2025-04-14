select id,
	Kdnr,
	Verlagsname,
	Region
from {{ ref('Staging_Abrechnung_Kunden') }}