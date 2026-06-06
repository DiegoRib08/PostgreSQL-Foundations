INSERT INTO courses (course_code, course_name, credit_hours, semester, is_in_progress, is_completed) VALUES
    ('SPN-050', 'Proficiency Spanish', 0, 'Fall 2026', FALSE, TRUE),
    ('PSY-110S-02', 'The Psychological Sciences', 4, 'Fall 2026', FALSE, FALSE),
    ('CSC-120-01', 'The Psychological Sciences', 4, 'Fall 2026', FALSE, FALSE),
    ('MTH-123-03', 'Elementary Statistics', 3, 'Fall 2026', FALSE, FALSE),
    ('ART-100A-01', 'Introduction to Art', 4, 'Fall 2026', FALSE, FALSE),
    ('FYS-100-00', 'Pick your FYS at Preview', 4, 'Fall 2026', FALSE, FALSE);
/*
Table after inserting courses:
┌────┬─────────────┬────────────────────────────┬──────────────┬───────────┬──────────────────┬────────────┬────────────────┬──────────────┐
│ id │ course_code │        course_name         │ credit_hours │ semester  │ percentage_grade │ is_planned │ is_in_progress │ is_completed │
├────┼─────────────┼────────────────────────────┼──────────────┼───────────┼──────────────────┼────────────┼────────────────┼──────────────┤
│  1 │ SPN-050     │ Proficiency Spanish        │            0 │ Fall 2026 │                ∅ │ t          │ f              │ t            │
│  2 │ PSY-110S-02 │ The Psychological Sciences │            4 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
│  3 │ CSC-120-01  │ The Psychological Sciences │            4 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
│  4 │ MTH-123-03  │ Elementary Statistics      │            3 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
│  5 │ ART-100A-01 │ Introduction to Art        │            4 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
│  6 │ FYS-100-00  │ Pick your FYS at Preview   │            4 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
└────┴─────────────┴────────────────────────────┴──────────────┴───────────┴──────────────────┴────────────┴────────────────┴──────────────┘
*/