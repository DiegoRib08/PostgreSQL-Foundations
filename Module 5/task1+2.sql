-- Categorical column: semester; Numeric column: credit_hours
SELECT semester, COUNT(*) AS courses, SUM(credit_hours) AS credits
FROM courses
GROUP BY semester
ORDER BY semester ASC;
/* Results
┌───────────┬─────────┬─────────┐
│ semester  │ courses │ credits │
├───────────┼─────────┼─────────┤
│ Fall 2026 │       5 │      19 │
│ ∅         │       1 │       0 │
└───────────┴─────────┴─────────┘
*/