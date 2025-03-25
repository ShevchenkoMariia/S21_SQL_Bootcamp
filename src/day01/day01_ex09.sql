SELECT name
  FROM pizzeria
 WHERE id NOT IN (
        SELECT pizzeria_id
        FROM person_visits);

SELECT name
  FROM pizzeria AS p
 WHERE NOT EXISTS (
        SELECT DISTINCT pizzeria_id
        FROM person_visits AS pv
        WHERE pv.pizzeria_id = p.id);
