CREATE VIEW per_semester_breakdown AS
SELECT semester, COUNT(*) AS courses, SUM(credit_hours) AS credits
FROM courses
GROUP BY semester
ORDER BY semester ASC;

SELECT * FROM per_semester_breakdown;
/* Results
┌───────────┬─────────┬─────────┐
│ semester  │ courses │ credits │
├───────────┼─────────┼─────────┤
│ Fall 2026 │       5 │      19 │
│ ∅         │       1 │       0 │
└───────────┴─────────┴─────────┘
*/