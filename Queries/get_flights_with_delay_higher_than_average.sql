select f.fl_num, (f.arr_delay + f.dep_delay) as total_delay
from columnstore_bts.flights f
where (f.arr_delay + f.dep_delay) > (select avg(arr_delay + dep_delay) from columnstore_bts.flights);

select f.fl_num, (f.arr_delay + f.dep_delay) as total_delay
from innodb_bts.flights f
where (f.arr_delay + f.dep_delay) > (select avg(arr_delay + dep_delay) from innodb_bts.flights);