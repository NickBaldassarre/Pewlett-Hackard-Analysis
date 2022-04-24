-- Group and count eligible mentors by title
SELECT COUNT(emp_no), title
INTO mentorship_titles
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT DESC;

-- Get current titles for eligible mentors
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
	e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO corrected_mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
    AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no, t.to_date DESC;

-- Group and count eligible mentors by current title
SELECT COUNT(emp_no), title
FROM corrected_mentorship_eligibility
GROUP BY title
ORDER BY COUNT DESC;

-- Create a list that contains all current employees by current title
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title
INTO current_titles
FROM employees as e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (t.to_date = '9999-01-01')
ORDER BY e.emp_no;

-- Group and count all current employees by current title
SELECT COUNT(emp_no), title
FROM current_titles
GROUP BY title
ORDER BY COUNT DESC;

-- Get current titles for eligible mentors with extended eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
	e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO extended_mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
    AND (e.birth_date BETWEEN '1963-01-01' AND '1965-12-31')
ORDER BY e.emp_no, t.to_date DESC;

-- Group and count mentors by current title using extended eligibility requirements
SELECT COUNT(emp_no), title
FROM extended_mentorship_eligibility
GROUP BY title
ORDER BY COUNT DESC;