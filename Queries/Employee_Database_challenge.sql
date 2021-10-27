-- create retirement titles table
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as ti ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO filtered_retirement_titles
FROM retirement_titles AS rt
ORDER BY emp_no, to_date DESC;

-- table of retirees by title
SELECT 	COUNT(emp_no), title  
INTO retiring_titles
FROM filtered_retirement_titles
GROUP BY title
ORDER BY COUNT(title) DESC;


-- Mentorship eligibility table
SELECT DISTINCT ON (e.emp_no) e.first_name,
    e.last_name,
    e.birth_date,
    d.from_date,
    d.to_date,
    t.title

FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN titles as t
ON e.emp_no = t.emp_no

--INTO mentorship_eligibilty
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;