-- Use 'LIKE' to find rows whose text matches substring pattern
SELECT course_code, course_name, credit_hours FROM courses WHERE course_code LIKE '%CSC%';
/* Shows course info for compsci courses
Results
┌─────────────┬───────────────────────────────┬──────────────┐
│ course_code │          course_name          │ credit_hours │
├─────────────┼───────────────────────────────┼──────────────┤
│ CSC-120-01  │ Programming Problem Solving 1 │            4 │
└─────────────┴───────────────────────────────┴──────────────┘
*/