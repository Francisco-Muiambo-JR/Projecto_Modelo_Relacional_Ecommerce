use company;

-- Número de empregados por departamento e localidade 
create or replace view employee_department as 
select d.Dname, dp.Dlocation as localizacao, count(e.ssn) as Numero_empregados
from employee e 
join department d on e.Dnu = d.Dnumber
join dept_locations dp on d.Dnumber = dp.Dnumber
group by d.Dname, dp.Dlocation
order by d.Dname, dp.Dlocation; ;

-- Lista de departamentos e seus gerentes 
create or replace view employee_department_geren  as 
select Dname as Nome_department, concat(fname, ' ', Lname) as Nome_Gerente
from department d join employee e on d.Mgr_ssn = e.ssn
order by Dname ASC;

-- Projetos com maior número de empregados (ex: por ordenação desc)
create or replace view project_empregados as
select Pname, count(Dnu) as Numero_empregado
from Project p join employee e on p.Dnum = e.Dnu
group by Pname
order by Pname;

-- Lista de projetos, departamentos e gerentes
create or replace view project_dept_gerent as 
select p.Pname as project, Dname as department, GROUP_CONCAT(e.fname SEPARATOR ', ') as Nome_Gerente
from Project p join employee e on p.Dnum = e.Dnu
join department d on d.Dnumber = p.Dnum
group by p.Pname
order by Nome_Gerente;

-- Quais empregados possuem dependentes e se são gerentes
create or replace view empregados_gerente_dependent as
select concat(fname, ' ', Lname) as Nome_complete, d.Dependent_name,
CASE WHEN dd.Mgr_ssn = e.ssn THEN 'Sim' ELSE 'Não' END AS Gerente
from employee e join dependent d on d.Essn = e.ssn
join department dd on dd.Dnumber = e.Dnu 
order by Nome_complete;


-- criacão de Usuário
-- Criar usuário GERENTE com senha
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'senha123';

-- Permissões para o GERENTE
GRANT SELECT ON employee TO 'gerente'@'localhost';
GRANT SELECT ON department TO 'gerente'@'localhost';
GRANT SELECT ON dept_locations TO 'gerente'@'localhost';
GRANT SELECT ON employee_department TO 'gerente'@'localhost';
GRANT SELECT ON employee_department_geren TO 'gerente'@'localhost';
GRANT SELECT ON project_empregados TO 'gerente'@'localhost';
GRANT SELECT ON project_dept_gerent TO 'gerente'@'localhost';
GRANT SELECT ON empregados_gerente_dependent TO 'gerente'@'localhost';

-- Criar usuário FUNCIONÁRIO com senha
CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'senha123';

-- Permissões para o FUNCIONÁRIO
GRANT SELECT ON employee TO 'funcionario'@'localhost';
GRANT SELECT ON dependent TO 'funcionario'@'localhost';
GRANT SELECT ON empregados_gerente_dependent TO 'funcionario'@'localhost';
GRANT SELECT ON project_empregados TO 'funcionario'@'localhost';










