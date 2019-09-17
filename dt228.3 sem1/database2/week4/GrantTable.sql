
grant select on student to ychen;
grant select on stage to ychen;
grant update (studentname) on student to ychen;

select studentname
from ychen.student;

update ychen.student
set studentname = 'niub'
where studentname like 'Jill Doake';
commit;
