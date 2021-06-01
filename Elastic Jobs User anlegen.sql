-- In Master Datenbank ausführen!

create login mastercred with password='Deal@2013'
create user mastercred from login mastercred

create login jobcred with password='Deal@2013'
create user jobcred from login jobcred

-- in der Ziel Datenbank ausführen
create user jobcred from login jobcred

grant alter on schema::dbo to jobcred
grant create table to jobcred

/*
-- Job stoppen falls notwendig
select * from jobs.job_executions;

exec jobs.sp_stop_job 'hier die id aus jobs.job_executions'
*/



