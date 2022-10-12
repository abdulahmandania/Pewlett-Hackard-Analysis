-- Deliverable 1

SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT COUNT (emp_no) FROM retirement_titles

SELECT * FROM retirement_titles

SELECT DISTINCT ON (rt.emp_no) 
					rt.emp_no, 
					rt.first_name, 
					rt.last_name, 
					rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles
SELECT COUNT (emp_no) FROM unique_titles

SELECT COUNT (ut.title) AS "count", ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY ut.count DESC;

SELECT * FROM retiring_titles;
