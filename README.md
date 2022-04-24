# An Analysis of Pewlett Hackard's Employee Database 
## Overview
### We analyzed employee data for Pewlett Hackard in order to determine the number of retiring employees by title, and also identified employees who are eligible to participate in the company's mentorship program.
## Results
### Counts of Retiring Employees
![Retiring Count by Title](https://github.com/NickBaldassarre/Pewlett-Hackard-Analysis/blob/1aeb002ab5f0de54fc9665bc19134fef2a239fb1/Resources/retiring_count_by_title.png)

* Over 72,000 employees are due to retire, which is roughly 30% of the current workforce.
* The majority of employees that are due to retire are either Senior Staff or Senior Engineers.
* Roughly 1550 employees are eligible to participate in the mentorship program, resulting in a ratio of approximately 50 mentees per mentor on average.
* 2 of 9 managers are due to retire.

## Summary

The data made clear that the 'Silver Tsunami' is pressing, but certain steps can be taken to help mediate its impact. We determined that over 72,000 employees, approximately 30% of the current workforce, are due to retire in the near future. This is an astonishingly high number. Over half of these retiring employees are either Senior Staff or Senior Engineers, which is in line with the current distribution of employees by title. We determined this by creating an additional table with the following query:

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

We now had a table with all current employees by title. We then counted each current employee by their current title. This confirmed that approximately 30% of each title was retiring. 
### Current Employees Grouped by Current Title
![Current Employee by Title](https://github.com/NickBaldassarre/Pewlett-Hackard-Analysis/blob/1aeb002ab5f0de54fc9665bc19134fef2a239fb1/Resources/current_employee_by_title.png)

Next we created a table to count eligible mentors by title. 
### Eligible Mentors Grouped by Title
![Mentor Count by Title](https://github.com/NickBaldassarre/Pewlett-Hackard-Analysis/blob/1aeb002ab5f0de54fc9665bc19134fef2a239fb1/Resources/mentor_count_by_title.png)

This table did not seem to contain the current title of every employee, as evidenced by the discrepancy between Engineers and Senior Engineers. We needed adjust the original query by adding t.to_date and DESC to ORDER BY. This provided the current title of the eligible employees. Now we were able to see that there wasn't actually a discrepancy in Engineer and Senior Engineer eligibilty, as the first mentorship eligibility table suggested. 
### Eligible Mentors Grouped by Current Title
![Corrected Mentor Count by Title](https://github.com/NickBaldassarre/Pewlett-Hackard-Analysis/blob/23d6d54c976fb6d461ce408238fbd2ae8823415d/Resources/corrected_mentor_count.png)

With these very restrictive eligibility requirments for the mentorship program, we would not have enough mentors to effectively train the next generation of employees. With roughly 50 mentees to every mentor, mentors would be streched too thin. It would be advisable to loosen the eligibility requirements of potential mentors by increasing the birth date range that is required. We created a table where the birth years of 1963 and 1964 were included as eligible mentors, and saw a dramatic increase in potential mentors: 
### Eligible Mentors After Loosening Eligibility Requirements
![Mentor Count by Title Extended](https://github.com/NickBaldassarre/Pewlett-Hackard-Analysis/blob/23d6d54c976fb6d461ce408238fbd2ae8823415d/Resources/mentor_count_extended.png)

Over 18,000 current employees were born in each of these two additional years, compared to the roughly 1550 born in 1965. This would result in a much more realistic ratio of 2 mentees per mentor. This adjustment to eligibilty would also yield 3 mentors that are department managers. Far better than no managers if only looking at 1965. Given than 2 managers will be retiring, this is extremely helpful. 

It should be noted that there were no employees in the datasets that were born after December, 31, 1965. This certainly puts into question the reliability of the data, and further investigation is required.
