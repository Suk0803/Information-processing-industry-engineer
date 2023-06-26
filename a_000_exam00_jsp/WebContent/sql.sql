
select custno, custname, phone, address, 
to_char(joindate, 'yyyy-mm-dd') joindate, 
decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원', '누락') grade,
city 
from member_tbl_02
order by custno asc;

select custno, custname, phone, address, 
	to_char(joindate, 'yyyy-mm-dd') joindate, grade, city 
from member_tbl_02;