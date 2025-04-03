-- 1. Qual o departamento com maior número de pessoas? 

select Dname, count(e.ssn) as total_Empregado
from department d join employee e 
where d.Dnumber = e.Dnu
group by Dnumber
order by total_Empregado DESC
limit 1;

-- A coluna Dnu é usada frequentemente para junções entre employee e department. 
-- O índice B-Tree melhora a performance de JOIN e GROUP BY
create index idx_employee_Dnu on employee(Dnu);


-- 2. Quais são os departamentos por cidade? 

SELECT dl.Dlocation as location_department, GROUP_CONCAT(d.Dname SEPARATOR ', ') AS departments
FROM department d
JOIN dept_locations dl ON d.Dnumber = dl.Dnumber
GROUP BY dl.Dlocation;

-- A coluna Dnumber é usada no JOIN entre department e dept_locations. 
-- O índice B-Tree acelera a busca e o agrupamento.
create index idx_dept_locations_Dnumber on dept_locations(Dnumber);

-- 3. Relação de empregrados por departamento 

select d.Dname as Number_department, GROUP_CONCAT(e.fname SEPARATOR ', ')  as Name_employee
from employee e join department d on Dnu = Dnumber
group by Dname;

-- A coluna Dnu é usada no JOIN entre employee e department. 
-- O uso de um índice B-Tree melhora significativamente a performance dessa junção e do GROUP BY.
CREATE INDEX idx_employee_dnu ON employee(Dnu);






