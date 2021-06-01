create master key encryption by password='Deal@2013';
go

create database scoped credential myjobcred with identity = 'jobcred',
secret = 'Deal@2013';
go

create database scoped credential mymastercred with identity = 'mastercred',
secret = 'Deal@2013';
go


--Target Group erstellen auf diese sich die "credentials" ausführen lassen 
use naki_jobs
exec jobs.sp_add_target_group 'ServerGroup1'

exec jobs.sp_add_target_group_member 'ServerGroup1',
@target_type='SqlServer',
@refresh_credential_name='mymastercred',
@server_name='nakisqldbserver.database.windows.net'














