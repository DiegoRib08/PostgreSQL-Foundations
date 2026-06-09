BEGIN;
    DELETE FROM courses WHERE is_planned = FALSE; -- Delete courses that aren't planned (courses I'm just thinking about)
    SELECT * FROM courses; -- Show all courses and info to confirm deletion
ROLLBACK; -- Revert deletion
SELECT * FROM courses; -- Show all courses and info to confirm restoration
/* Results
BEGIN
DELETE 1
┌────┬─────────────┬───────────────────────────────┬──────────────┬───────────┬──────────────────┬────────────┬────────────────┬──────────────┐
│ id │ course_code │          course_name          │ credit_hours │ semester  │ percentage_grade │ is_planned │ is_in_progress │ is_completed │
├────┼─────────────┼───────────────────────────────┼──────────────┼───────────┼──────────────────┼────────────┼────────────────┼──────────────┤
│  1 │ SPN-050     │ Proficiency Spanish           │            0 │ ∅         │                ∅ │ t          │ f              │ t            │
│  2 │ PSY-110S-02 │ The Psychological Sciences    │            4 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
│  3 │ CSC-120-01  │ Programming Problem Solving 1 │            4 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
│  4 │ MTH-123-03  │ Elementary Statistics         │            3 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
│  6 │ FYS-100-00  │ Pick your FYS at Preview      │            4 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
└────┴─────────────┴───────────────────────────────┴──────────────┴───────────┴──────────────────┴────────────┴────────────────┴──────────────┘
ROLLBACK
┌────┬─────────────┬───────────────────────────────┬──────────────┬───────────┬──────────────────┬────────────┬────────────────┬──────────────┐
│ id │ course_code │          course_name          │ credit_hours │ semester  │ percentage_grade │ is_planned │ is_in_progress │ is_completed │
├────┼─────────────┼───────────────────────────────┼──────────────┼───────────┼──────────────────┼────────────┼────────────────┼──────────────┤
│  1 │ SPN-050     │ Proficiency Spanish           │            0 │ ∅         │                ∅ │ t          │ f              │ t            │
│  2 │ PSY-110S-02 │ The Psychological Sciences    │            4 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
│  3 │ CSC-120-01  │ Programming Problem Solving 1 │            4 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
│  4 │ MTH-123-03  │ Elementary Statistics         │            3 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
│  5 │ ART-100A-01 │ Introduction to Art           │            4 │ Fall 2026 │                ∅ │ f          │ f              │ f            │
│  6 │ FYS-100-00  │ Pick your FYS at Preview      │            4 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
└────┴─────────────┴───────────────────────────────┴──────────────┴───────────┴──────────────────┴────────────┴────────────────┴──────────────┘
*/