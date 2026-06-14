SELECT course_code, course_name,
    CASE WHEN credit_hours > 0 THEN 'For-Credit' ELSE 'Not-For-Credit' END AS CreditValue
FROM courses;
/* Results
┌─────────────┬───────────────────────────────┬────────────────┐
│ course_code │          course_name          │  creditvalue   │
├─────────────┼───────────────────────────────┼────────────────┤
│ SPN-050     │ Proficiency Spanish           │ Not-For-Credit │
│ PSY-110S-02 │ The Psychological Sciences    │ For-Credit     │
│ CSC-120-01  │ Programming Problem Solving 1 │ For-Credit     │
│ MTH-123-03  │ Elementary Statistics         │ For-Credit     │
│ ART-100A-01 │ Introduction to Art           │ For-Credit     │
│ FYS-100-00  │ Pick your FYS at Preview      │ For-Credit     │
└─────────────┴───────────────────────────────┴────────────────┘
*/