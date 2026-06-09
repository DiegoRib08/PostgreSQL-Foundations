-- One query combining 'WHERE' (with 'AND' or 'OR'), 'IN', 'ORDER BY' and 'LIMIT'
SELECT semester, course_code, course_name, credit_hours -- Shows course code, course name and credit hours
FROM courses -- Looks for info from table of courses
WHERE semester IN ('Fall 2026', 'Spring 2027') -- Filters for 2026-27 courses
AND credit_hours > 0 -- Filters for courses worth credits (this would also filter out LABS that are part of other courses)
ORDER BY semester ASC, credit_hours DESC -- Order by semester: 'Fall 2026', then 'Spring 2026' (alphabetical). Then sort each semester's courses by credit hours
LIMIT 12; -- Limits to 12 courses (usually the max you can take per year in college without petitioning for more)
/* Results
┌───────────┬─────────────┬───────────────────────────────┬──────────────┐
│ semester  │ course_code │          course_name          │ credit_hours │
├───────────┼─────────────┼───────────────────────────────┼──────────────┤
│ Fall 2026 │ PSY-110S-02 │ The Psychological Sciences    │            4 │
│ Fall 2026 │ CSC-120-01  │ Programming Problem Solving 1 │            4 │
│ Fall 2026 │ ART-100A-01 │ Introduction to Art           │            4 │
│ Fall 2026 │ FYS-100-00  │ Pick your FYS at Preview      │            4 │
│ Fall 2026 │ MTH-123-03  │ Elementary Statistics         │            3 │
└───────────┴─────────────┴───────────────────────────────┴──────────────┘
*/