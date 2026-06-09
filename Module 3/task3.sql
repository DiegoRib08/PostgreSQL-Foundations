-- Use 'BETWEEN' to filter a numeric or date range
SELECT course_code, course_name, credit_hours FROM courses WHERE credit_hours BETWEEN 0 AND 3 ORDER BY credit_hours ASC;
/* Shows course info for courses worth 0-3 credits (inclusive), in ascending credit order
Results
┌─────────────┬───────────────────────┬──────────────┐
│ course_code │      course_name      │ credit_hours │
├─────────────┼───────────────────────┼──────────────┤
│ SPN-050     │ Proficiency Spanish   │            0 │
│ MTH-123-03  │ Elementary Statistics │            3 │
└─────────────┴───────────────────────┴──────────────┘
*/