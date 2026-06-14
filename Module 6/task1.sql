SELECT course_code, course_name, credit_hours
FROM courses
WHERE credit_hours > (SELECT AVG(credit_hours) FROM courses);
/* Results
┌─────────────┬───────────────────────────────┬──────────────┐
│ course_code │          course_name          │ credit_hours │
├─────────────┼───────────────────────────────┼──────────────┤
│ PSY-110S-02 │ The Psychological Sciences    │            4 │
│ CSC-120-01  │ Programming Problem Solving 1 │            4 │
│ ART-100A-01 │ Introduction to Art           │            4 │
│ FYS-100-00  │ Pick your FYS at Preview      │            4 │
└─────────────┴───────────────────────────────┴──────────────┘
*/