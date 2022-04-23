-- Group and count eligible mentors by title
SELECT COUNT(emp_no), title
INTO mentorship_titles
FROM mentorship_eligibility
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