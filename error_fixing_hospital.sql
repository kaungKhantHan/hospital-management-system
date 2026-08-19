


## lock up table
select * 
from hospitaldb.fact_appointment as ap;
-- select * 
-- from hospitaldb.dim_department as dp;
-- select * 
-- from hospitaldb.dim_doctors as d;
-- select * 
-- from hospitaldb.dim_patient as p;
-- select * 
-- from hospitaldb.dim_date as date;

# change the encoded error "Appointment cost"
-- SELECT AppointmentCost FROM fact_appointment WHERE AppointmentCost LIKE 'Â£%' LIMIT 10;
-- SET SQL_SAFE_UPDATES = 0;

-- SET SQL_SAFE_UPDATES = 0;

-- UPDATE fact_appointment
-- SET AppointmentCost = REPLACE(AppointmentCost, 'Â£', '£')
-- WHERE AppointmentCost LIKE 'Â£%';

-- SET SQL_SAFE_UPDATES = 1;  -- turn it back on afterward, good habit

### _______

