(
    select arr_delays.city, total_arr_delay + total_dep_delay as total_delay
    from
        (select a.city, sum(f.dep_delay) as total_dep_delay
         from columnstore_bts.flights f
         join columnstore_bts.airports a on f.origin = a.iata_code
         group by a.city) as dep_delays
        join
        (select a.city, sum(f.arr_delay) as total_arr_delay
         from columnstore_bts.flights f
         join columnstore_bts.airports a on f.dest = a.iata_code
         group by a.city) as arr_delays
        on dep_delays.city = arr_delays.city
    order by total_arr_delay + total_dep_delay
    limit 1
)
union
(
    select arr_delays.city, total_arr_delay + total_dep_delay as total_delay
    from
        (select a.city, sum(f.dep_delay) as total_dep_delay
         from columnstore_bts.flights f
         join columnstore_bts.airports a on f.origin = a.iata_code
         group by a.city) as dep_delays
        join
        (select a.city, sum(f.arr_delay) as total_arr_delay
         from columnstore_bts.flights f
         join columnstore_bts.airports a on f.dest = a.iata_code
         group by a.city) as arr_delays
        on dep_delays.city = arr_delays.city
    order by total_arr_delay + total_dep_delay desc
    limit 1
);

(
    select arr_delays.city, total_arr_delay + total_dep_delay as total_delay
    from
        (select a.city, sum(f.dep_delay) as total_dep_delay
         from innodb_bts.flights f
         join innodb_bts.airports a on f.origin = a.iata_code
         group by a.city) as dep_delays
        join
        (select a.city, sum(f.arr_delay) as total_arr_delay
         from innodb_bts.flights f
         join innodb_bts.airports a on f.dest = a.iata_code
         group by a.city) as arr_delays
        on dep_delays.city = arr_delays.city
    order by total_arr_delay + total_dep_delay
    limit 1
)
union
(
    select arr_delays.city, total_arr_delay + total_dep_delay as total_delay
    from
        (select a.city, sum(f.dep_delay) as total_dep_delay
         from innodb_bts.flights f
         join innodb_bts.airports a on f.origin = a.iata_code
         group by a.city) as dep_delays
        join
        (select a.city, sum(f.arr_delay) as total_arr_delay
         from innodb_bts.flights f
         join innodb_bts.airports a on f.dest = a.iata_code
         group by a.city) as arr_delays
        on dep_delays.city = arr_delays.city
    order by total_arr_delay + total_dep_delay desc
    limit 1
);