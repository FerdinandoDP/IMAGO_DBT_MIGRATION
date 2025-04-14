select *,
case 
	when  Zahlungsdatum is null 
		then 'Missing payment'
when datediff(day, ReDatum, Zahlungsdatum) > 30 
	then 'Delayed Payment'
else 'On Time'
	end as Payment_state
from {{ ref('Staging_Abrechnung_Rechnungen') }}