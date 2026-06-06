CREATE TABLE courses (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_code         TEXT        NOT NULL,
    course_name         TEXT        NOT NULL,
    credit_hours        INTEGER     CHECK (credit_hours >= 0),
    semester            TEXT,
    percentage_grade    REAL,
    is_planned          BOOLEAN     NOT NULL    DEFAULT TRUE,
    is_in_progress      BOOLEAN     NOT NULL,
    is_completed        BOOLEAN     NOT NULL
);
/*
Table after initial creation:
┌────┬─────────────┬─────────────┬──────────────┬──────────┬──────────────────┬────────────┬────────────────┬──────────────┐
│ id │ course_code │ course_name │ credit_hours │ semester │ percentage_grade │ is_planned │ is_in_progress │ is_completed │
├────┼─────────────┼─────────────┼──────────────┼──────────┼──────────────────┼────────────┼────────────────┼──────────────┤
└────┴─────────────┴─────────────┴──────────────┴──────────┴──────────────────┴────────────┴────────────────┴──────────────┘
*/