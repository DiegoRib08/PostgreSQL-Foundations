-- Return subset of columns, filter by numeric condition, sort descending, limit to top 5
SELECT course_code, course_name, credit_hours FROM courses WHERE credit_hours > 0 ORDER BY credit_hours ASC LIMIT 5;
/* Shows course info for courses worth at least 1 credit
Results
┌─────────────┬───────────────────────────────┬──────────────┐
│ course_code │          course_name          │ credit_hours │
├─────────────┼───────────────────────────────┼──────────────┤
│ MTH-123-03  │ Elementary Statistics         │            3 │
│ PSY-110S-02 │ The Psychological Sciences    │            4 │
│ CSC-120-01  │ Programming Problem Solving 1 │            4 │
│ ART-100A-01 │ Introduction to Art           │            4 │
│ FYS-100-00  │ Pick your FYS at Preview      │            4 │
└─────────────┴───────────────────────────────┴──────────────┘
*/