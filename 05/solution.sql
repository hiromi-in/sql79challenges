SELECT title, budget / COUNT(emp_id) allocated_budget_per_emp
FROM hiromi_ms_emp_projects e
FULL JOIN hiromi_ms_projects p ON e.project_id = p.id 
GROUP BY title, budget
ORDER BY allocated_budget_per_emp DESC

SELECT *
FROM hiromi_ms_projects