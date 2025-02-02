-- deliverable 1
SELECT DISTINCT ON (e.emp_no)e.emp_no, e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO unique_titles
FROM employees as e
right join titles as t
on e.emp_no = t.emp_no
WHERE (e.birth_date between '1952-01-01' and '1955-12-31' )
and (t.to_date = '9999-01-01')
ORDER BY e.emp_no;

select * from unique_titles

--number of employees by their most recent job title who are about to retire.
select  count (title), title
into retiring_titles
from unique_titles
group by title
order by count(title) desc

--Deliverable 2: mentorship eligibility
select distinct on (e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
into mentorship_eligibility
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
right join titles as t
on t.emp_no=e.emp_no
where de.to_date = '9999-01-01'
and (e.birth_date between '1965-01-01' and '1965-12-31')
