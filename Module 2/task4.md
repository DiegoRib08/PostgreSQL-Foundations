PSQL equivalent to '.schema' is '\d table_name' (run in postgres command-line)

### Results ###
Table "public.courses"
┌──────────────────┬─────────┬───────────┬──────────┬──────────────────────────────┐
│      Column      │  Type   │ Collation │ Nullable │           Default            │
├──────────────────┼─────────┼───────────┼──────────┼──────────────────────────────┤
│ id               │ integer │           │ not null │ generated always as identity │
│ course_code      │ text    │           │ not null │                              │
│ course_name      │ text    │           │ not null │                              │
│ credit_hours     │ integer │           │          │                              │
│ semester         │ text    │           │          │                              │
│ percentage_grade │ real    │           │          │                              │
│ is_planned       │ boolean │           │ not null │ true                         │
│ is_in_progress   │ boolean │           │ not null │                              │
│ is_completed     │ boolean │           │ not null │                              │
└──────────────────┴─────────┴───────────┴──────────┴──────────────────────────────┘
Indexes:
    "courses_pkey" PRIMARY KEY, btree (id)
Check constraints:
    "courses_credit_hours_check" CHECK (credit_hours >= 0)
    "courses_percentage_grade_check" CHECK (percentage_grade >= 0::double precision)