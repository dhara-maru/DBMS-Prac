SELECT employee_id, first_name, last_name, department_name, salary
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id
WHERE salary > 50000
ORDER BY salary DESC;