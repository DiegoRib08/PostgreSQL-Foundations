SELECT * FROM courses WHERE semester = 'Fall 2026' AND is_planned = TRUE; -- Shows all courses planned for Fall 2026 semester
/* Results
┌────┬─────────────┬───────────────────────────────┬──────────────┬───────────┬──────────────────┬────────────┬────────────────┬──────────────┐
│ id │ course_code │          course_name          │ credit_hours │ semester  │ percentage_grade │ is_planned │ is_in_progress │ is_completed │
├────┼─────────────┼───────────────────────────────┼──────────────┼───────────┼──────────────────┼────────────┼────────────────┼──────────────┤
│  2 │ PSY-110S-02 │ The Psychological Sciences    │            4 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
│  3 │ CSC-120-01  │ Programming Problem Solving 1 │            4 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
│  4 │ MTH-123-03  │ Elementary Statistics         │            3 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
│  6 │ FYS-100-00  │ Pick your FYS at Preview      │            4 │ Fall 2026 │                ∅ │ t          │ f              │ f            │
└────┴─────────────┴───────────────────────────────┴──────────────┴───────────┴──────────────────┴────────────┴────────────────┴──────────────┘
*/
-- In August, I would update is_in_progress, setting them to TRUE
BEGIN;
    UPDATE courses SET is_in_progress = TRUE WHERE semester = 'Fall 2026' AND is_planned = TRUE; -- Changes planned Fall 2026 course to in progress
    SELECT * FROM courses; -- Show all courses and info to check changes
ROLLBACK; -- Reverts changes (for now) since I haven't started the semester yet
/* Results
┌────┬─────────────┬───────────────────────────────┬──────────────┬───────────┬──────────────────┬────────────┬────────────────┬──────────────┐
│ id │ course_code │          course_name          │ credit_hours │ semester  │ percentage_grade │ is_planned │ is_in_progress │ is_completed │
├────┼─────────────┼───────────────────────────────┼──────────────┼───────────┼──────────────────┼────────────┼────────────────┼──────────────┤
│  1 │ SPN-050     │ Proficiency Spanish           │            0 │ ∅         │                ∅ │ t          │ f              │ t            │
│  5 │ ART-100A-01 │ Introduction to Art           │            4 │ Fall 2026 │                ∅ │ f          │ f              │ f            │
│  2 │ PSY-110S-02 │ The Psychological Sciences    │            4 │ Fall 2026 │                ∅ │ t          │ t              │ f            │
│  3 │ CSC-120-01  │ Programming Problem Solving 1 │            4 │ Fall 2026 │                ∅ │ t          │ t              │ f            │
│  4 │ MTH-123-03  │ Elementary Statistics         │            3 │ Fall 2026 │                ∅ │ t          │ t              │ f            │
│  6 │ FYS-100-00  │ Pick your FYS at Preview      │            4 │ Fall 2026 │                ∅ │ t          │ t              │ f            │
└────┴─────────────┴───────────────────────────────┴──────────────┴───────────┴──────────────────┴────────────┴────────────────┴──────────────┘
*/