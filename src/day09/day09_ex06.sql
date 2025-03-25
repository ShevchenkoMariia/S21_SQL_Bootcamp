create or replace function fnc_person_visits_and_eats_on_date(pperson varchar='Dmitriy',pprice int=500, pdate date='2022-01-08')
returns table (
        pizzeria_name varchar
) as $$
begin
	return query
        select distinct pz.name FROM person_visits pv
            JOIN person p on p.id=pv.person_id
            JOIN pizzeria pz on pz.id=pv.pizzeria_id
            JOIN menu m on m.pizzeria_id=pz.id
        WHERE p.name = pperson AND pv.visit_date = pdate AND m.price < pprice;
end;
$$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
