
## show appointment table
select * 
from hospitaldb.fact_appointment as ap;

select AppointmentID
, AppointmentType
, Status
, FollowUpRequired

from hospitaldb.fact_appointment as ap
where status like "Att%" and FollowUpRequired = "Yes"
;

## check values of status
SELECT Status
, COUNT(*) 
FROM fact_appointment 
GROUP BY Status;
## ____

## create view
use hospitaldb;

create or replace view vw_appointments_full as (
select 	ap.AppointmentID
,	ap.AppointmentType
,	ap.DurationMinutes
,	ap.WaitMinutes
,	ap.Status
,	ap.AppointmentCost
,	ap.Outcome
,	ap.FollowUpRequired
,	dt.Date
,	dt.Year
,	dt.Quarter
,	dt.MonthName
,	dt.DayName
,	dt.IsWeekend
,	dp.DepartmentName
,	dp.Location
,	dp.ServiceType
,	d.DoctorName
,	d.Grade
,	d.YearsExperience
,	p.PatientName
,	p.DateOfBirth
,	p.Gender
,	p.PostcodeArea
,	p.BloodGroup
,	p.PriorityGroup
from fact_appointment as ap
left join dim_date as dt on ap.DateKey = dt.DateKey
left join dim_department as dp on ap.DepartmentID = dp.DepartmentID
left join dim_doctors as d on ap.DoctorID = d.DoctorID
left join dim_patient as p on ap.PatientID = p.PatientID
);

select count(*) from vw_appointments_full where DoctorName is null;
select count(*) from vw_appointments_full where PatientName is null;
select count(*) from vw_appointments_full where DepartmentName is null;

select count(*) as row_count,
       datediff(max(Date), min(Date)) + 1 as expected_days
from dim_date;

## this time view for only cleaned data table for fact table of appointment
create or replace view vw_appointments_clean as
select 
    *,
    case 
        when AppointmentID is null or DateKey is null then 'Incomplete'
        else 'Complete'
    end as DataQualityFlag
from fact_appointment;

