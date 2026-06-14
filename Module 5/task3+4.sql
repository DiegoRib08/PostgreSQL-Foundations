SELECT semester, COUNT(*) AS courses, SUM(credit_hours) AS credits
FROM courses
GROUP BY semester
HAVING SUM(credit_hours) > 0
ORDER BY semester ASC;
/* Task 4 - why this wouldn't have worked with the condition in WHERE instead of HAVING:
HAVING checks conditions after grouping, WHERE checks before; putting it in HAVING lets me get the total credits per semester (SUM), then check that value per semester as a condition.

Task 3 Results
┌───────────┬─────────┬─────────┐
│ semester  │ courses │ credits │
├───────────┼─────────┼─────────┤
│ Fall 2026 │       5 │      19 │
└───────────┴─────────┴─────────┘
*/