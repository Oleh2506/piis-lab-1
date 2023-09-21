select arrivals.city, total_departures + total_arrivals as total_flights
from
    (select a.city, count(*) as total_arrivals
     from columnstore_bts.flights f
     join columnstore_bts.airports a on f.dest = a.iata_code
     group by a.city) as arrivals
    join
    (select a.city, count(*) as total_departures
     from columnstore_bts.flights f
     join columnstore_bts.airports a on f.origin = a.iata_code
     group by a.city) as departures
    on departures.city = arrivals.city
order by arrivals.city;

select arrivals.city, total_departures + total_arrivals as total_flights
from
    (select a.city, count(*) as total_arrivals
     from innodb_bts.flights f
     join innodb_bts.airports a on f.dest = a.iata_code
     group by a.city) as arrivals
    join
    (select a.city, count(*) as total_departures
     from innodb_bts.flights f
     join innodb_bts.airports a on f.origin = a.iata_code
     group by a.city) as departures
    on departures.city = arrivals.city
order by arrivals.city;