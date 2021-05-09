
-- 1. Write a query to display the names (first_name, last_name) using alias name “First Name”, “Last Name”

SELECT first_name || ' ' || last_name AS Names FROM employees;



-- 2. Write a query to get unique department ID from employee table
 
SELECT DISTINCT department_id FROM employees;



-- 3. Write a query to get all employee details from the employee table order by first name, descending

SELECT * FROM employees
ORDER BY first_name DESC;



-- 4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary)

SELECT first_name || ' ' || last_name AS Names, salary, ROUND(0.15 * salary,2) AS PF FROM employees



-- 5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary

SELECT employee_id, first_name || ' ' || last_name AS names, salary FROM employees
ORDER BY salary DESC;



-- 6. Write a query to get the total salaries payable to employees


SELECT first_name|| ' ' || last_name AS names, job_title, employee_id, max_salary AS salary_payable, salary AS current_salary FROM employees e
INNER JOIN jobs j
ON e.job_id = j.job_id;



-- 7. Write a query to get the maximum and minimum salary from employees table

SELECT first_name|| ' ' || last_name AS names, job_title, employee_id, max_salary, min_salary FROM employees e
INNER JOIN jobs j
ON e.job_id = j.job_id;



-- 8. Write a query to get the average salary and number of employees in the employees table

SELECT DISTINCT COUNT(employee_id) AS total_employees, ROUND(AVG(salary),2) AS avg_salary FROM employees;



-- 9. Write a query to get the number of employees working with the company

SELECT DISTINCT COUNT( employee_id) AS "Tot. Num. of Emp currently working" FROM employees
WHERE employee_id NOT IN (
    SELECT employee_id FROM job_history
)

-- 10. Write a query to get the number of jobs available in the employees table

SELECT  COUNT(*) AS "Total num of jobs available" FROM employees e
INNER JOIN job_history j
ON e.employee_id = j.employee_id


-- 11. Write a query get all first name from employees table in upper case

SELECT UPPER(first_name) AS "FIRST NAME" FROM employees;



-- 12. Write a query to get first name from employees table after removing white spaces from both side

SELECT BTRIM(first_name) AS trimed_firstName FROM employees;


-- 13. Write a query to get the length of the employee names (first_name, last_name) from employees table

SELECT LENGTH(first_name) AS Len_first_name, LENGTH(last_name) AS len_last_name FROM employees;


-- 14. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000

SELECT first_name || ' ' || last_name AS name, salary FROM employees
WHERE salary NOT IN (SELECT salary FROM employees
                    WHERE salary BETWEEN 10000 AND 15000)


-- 15. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100

SELECT first_name || ' ' || last_name AS name, salary, department_id FROM employees
WHERE department_id IN (30,100) AND salary NOT IN (SELECT salary FROM employees
                                                    WHERE salary BETWEEN 10000 AND 15000)


