-- neuen Job hinzufügen

exec jobs.sp_add_job @job_name='CreateTableTest', @description='Create Table Test'

exec jobs.sp_add_jobstep @job_name='CreateTableTest',
@command=N'if not exists (select * from sys.tables where object_id = object_id(''Test''))
create table [dbo].[test]([testid] int not null);',
@credential_name = 'myjobcred',
@target_group_name = 'ServerGroup1'

exec jobs.sp_start_job 'CreateTableTest'


-- Job stoppen falls notwendig -- in der jobs datebank !
select * from jobs.job_executions;

-- exec jobs.sp_stop_job 'hier die id aus jobs.job_executions'
exec jobs.sp_stop_job '54E8D923-C149-400A-B88E-E9CA8361E0F4'

Select * from jobs.job_executions
where is_active = 1 and job_name = 'CreateTableTest'
go





