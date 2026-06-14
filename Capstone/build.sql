-- Create table
DROP TABLE IF EXISTS courses CASCADE;
CREATE TABLE courses (
    id                  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_code         TEXT    NOT NULL,
    course_name         TEXT    NOT NULL,
    academic_level      TEXT    NOT NULL    CHECK (academic_level IN ('High School', 'University')),
    subject_area        TEXT    NOT NULL,
    credit_hours        REAL    NOT NULL    CHECK (credit_hours >= 0),
    percentage_grade    REAL    CHECK (percentage_grade BETWEEN 0.0 AND 100.0),
    term                TEXT    NOT NULL
);

-- Create indexes for frequently filtered columns
CREATE INDEX idx_courses_percentage_grade ON courses (percentage_grade);

-- Insert rows
INSERT INTO courses (
    course_code,
    course_name,
    academic_level,
    subject_area,
    credit_hours,
    percentage_grade,
    term
) VALUES
    -- High school courses
    ('AVI1O1', 'Visual Arts', 'High School', 'The Arts', 1.0, 93.0, 'Fall 2022'),
    ('FSF1D1', 'Core French', 'High School', 'World Languages', 1.0, 98.0, 'Fall 2022'),
    ('ENG1D1', 'English', 'High School', 'English', 1.0, 85.0, 'Fall 2022'),
    ('HPA21', 'High Performance Athlete (HPA)', 'High School', 'Health and PE', 2.0, 96.0, '2022-23'),
    ('CGC1D1', 'Issues in Canadian Geography', 'High School', 'Social Sciences', 1.0, 91.0, 'Spring 2023'),
    ('SNC1W1', 'Science', 'High School', 'Natural Sciences', 1.0, 93.0, 'Spring 2023'),
    ('MTH1W1', 'Mathematics', 'High School', 'Mathematics', 1.0, 91.0, 'Spring 2023'),
    ('CHC2D1', 'Canadian History', 'High School', 'Social Sciences', 1.0, 83.0, 'Summer 2023'),
    ('LWSBD1', 'Level 1 Spanish', 'High School', 'World Languages', 1.0, 97.0, 'Fall 2023'),
    ('CHV2O1', 'Civics and Citizenship', 'High School', 'Social Sciences', 0.5, 89.0, 'Fall 2023'),
    ('GLC2O1', 'Career Studies', 'High School', 'Social Sciences', 0.5, 96.0, 'Fall 2023'),
    ('ENG2D1', 'English', 'High School', 'English', 1.0, 99.0, 'Fall 2023'),
    ('HPA 21', 'High Performance Athlete (HPA)', 'High School', 'Health and PE', 2.0, 93.0, '2023-24'),
    ('ICS3U1', 'Intro to Computer Science', 'High School', 'Computer Science', 1.0, 95.0, 'Spring 2024'),
    ('SNC2D1', 'Science', 'High School', 'Natural Sciences', 1.0, 91.0, 'Spring 2024'),
    ('MPM2D1', 'Principles of Mathematics', 'High School', 'Mathematics', 1.0, 86.0, 'Spring 2024'),
    ('NBE3U1', 'English', 'High School', 'English', 1.0, 78.0, 'Summer 2024'),
    ('ENG4U1', 'English', 'High School', 'English', 1.0, 93.0, 'Summer 2024'),
    ('MCR3U1', 'Functions', 'High School', 'Mathematics', 1.0, 94.0, 'Fall 2024'),
    ('AWQ3M1', 'Photography', 'High School', 'The Arts', 1.0, 97.0, 'Fall 2024'),
    ('SPH3U1', 'Physics', 'High School', 'Natural Sciences', 1.0, 85.0, 'Fall 2024'),
    ('HPA21', 'High Performance Athlete (HPA)', 'High School', 'Health and PE', 2.0, 95.0, '2024-25'),
    ('LWSCU1', 'Level 2 Spanish', 'High School', 'World Languages', 1.0, 95.0, 'Spring 2025'),
    ('SCH3U1', 'Chemistry', 'High School', 'Natural Sciences', 1.0, 86.0, 'Spring 2025'),
    ('SPH4U1', 'Physics', 'High School', 'Natural Sciences', 1.0, 80.0, 'Spring 2025'),
    ('MHF4UOL', 'Advanced Functions', 'High School', 'Mathematics', 1.0, 91.0, 'Summer 2025'),
    ('MCV4UOL', 'Calculus and Vectors', 'High School', 'Mathematics', 1.0, 91.0, 'Summer 2025'),
    ('HFA4U1', 'Nutrition and Health', 'High School', 'Elective', 1.0, 96.0, 'Fall 2025'),
    ('MDM4U1', 'Mathematics of Data Management', 'High School', 'Mathematics', 1.0, 93.0, 'Fall 2025'),
    ('SCH4U1', 'Chemistry', 'High School', 'Natural Sciences', 1.0, 78.0, 'Fall 2025'),
    ('PPZ3COL', 'Health For Life', 'High School', 'Health and PE', 1.0, 87.0, 'Fall 2025'),
    ('AWQ4M1', 'Photography', 'High School', 'The Arts', 1.0, NULL, 'Spring 2026'),
    ('ICS4U1', 'Computer Science', 'High School', 'Computer Science', 1.0, NULL, 'Spring 2026'),
    ('HSP3UOL', 'Intro to Anthropology, Psychology and Sociology', 'High School', 'Social Sciences', 1.0, NULL, 'Spring 2026'),

    -- University courses
    ('SPN-050', 'Spanish Proficiency', 'University', 'World Language', 0, NULL, 'Summer 2026'),
    ('PSY-110S-02', 'The Psychological Sciences', 'University', 'Social Sciences', 4.0, NULL, 'Fall 2026'),
    ('CSC-120-01', 'Programming Problem Solving I', 'University', 'Computer Science', 4.0, NULL, 'Fall 2026'),
    ('MTH-123-03', 'Elementary Statistics', 'University', 'Mathematics', 3.0, NULL, 'Fall 2026'),
    ('FYS-100-27', 'First Year Seminar: What''s your Why?', 'University', 'Integrative Core', 4.0, NULL, 'Fall 2026');

/* Results
┌────┬─────────────┬─────────────────────────────────────────────────┬────────────────┬──────────────────┬──────────────┬──────────────────┬─────────────┐
│ id │ course_code │                   course_name                   │ academic_level │   subject_area   │ credit_hours │ percentage_grade │    term     │
├────┼─────────────┼─────────────────────────────────────────────────┼────────────────┼──────────────────┼──────────────┼──────────────────┼─────────────┤
│  1 │ AVI1O1      │ Visual Arts                                     │ High School    │ The Arts         │            1 │               93 │ Fall 2022   │
│  2 │ FSF1D1      │ Core French                                     │ High School    │ World Languages  │            1 │               98 │ Fall 2022   │
│  3 │ ENG1D1      │ English                                         │ High School    │ English          │            1 │               85 │ Fall 2022   │
│  4 │ HPA21       │ High Performance Athlete (HPA)                  │ High School    │ Health and PE    │            2 │               96 │ 2022-23     │
│  5 │ CGC1D1      │ Issues in Canadian Geography                    │ High School    │ Social Sciences  │            1 │               91 │ Spring 2023 │
│  6 │ SNC1W1      │ Science                                         │ High School    │ Natural Sciences │            1 │               93 │ Spring 2023 │
│  7 │ MTH1W1      │ Mathematics                                     │ High School    │ Mathematics      │            1 │               91 │ Spring 2023 │
│  8 │ CHC2D1      │ Canadian History                                │ High School    │ Social Sciences  │            1 │               83 │ Summer 2023 │
│  9 │ LWSBD1      │ Level 1 Spanish                                 │ High School    │ World Languages  │            1 │               97 │ Fall 2023   │
│ 10 │ CHV2O1      │ Civics and Citizenship                          │ High School    │ Social Sciences  │          0.5 │               89 │ Fall 2023   │
│ 11 │ GLC2O1      │ Career Studies                                  │ High School    │ Social Sciences  │          0.5 │               96 │ Fall 2023   │
│ 12 │ ENG2D1      │ English                                         │ High School    │ English          │            1 │               99 │ Fall 2023   │
│ 13 │ HPA 21      │ High Performance Athlete (HPA)                  │ High School    │ Health and PE    │            2 │               93 │ 2023-24     │
│ 14 │ ICS3U1      │ Intro to Computer Science                       │ High School    │ Computer Science │            1 │               95 │ Spring 2024 │
│ 15 │ SNC2D1      │ Science                                         │ High School    │ Natural Sciences │            1 │               91 │ Spring 2024 │
│ 16 │ MPM2D1      │ Principles of Mathematics                       │ High School    │ Mathematics      │            1 │               86 │ Spring 2024 │
│ 17 │ NBE3U1      │ English                                         │ High School    │ English          │            1 │               78 │ Summer 2024 │
│ 18 │ ENG4U1      │ English                                         │ High School    │ English          │            1 │               93 │ Summer 2024 │
│ 19 │ MCR3U1      │ Functions                                       │ High School    │ Mathematics      │            1 │               94 │ Fall 2024   │
│ 20 │ AWQ3M1      │ Photography                                     │ High School    │ The Arts         │            1 │               97 │ Fall 2024   │
│ 21 │ SPH3U1      │ Physics                                         │ High School    │ Natural Sciences │            1 │               85 │ Fall 2024   │
│ 22 │ HPA21       │ High Performance Athlete (HPA)                  │ High School    │ Health and PE    │            2 │               95 │ 2024-25     │
│ 23 │ LWSCU1      │ Level 2 Spanish                                 │ High School    │ World Languages  │            1 │               95 │ Spring 2025 │
│ 24 │ SCH3U1      │ Chemistry                                       │ High School    │ Natural Sciences │            1 │               86 │ Spring 2025 │
│ 25 │ SPH4U1      │ Physics                                         │ High School    │ Natural Sciences │            1 │               80 │ Spring 2025 │
│ 26 │ MHF4UOL     │ Advanced Functions                              │ High School    │ Mathematics      │            1 │               91 │ Summer 2025 │
│ 27 │ MCV4UOL     │ Calculus and Vectors                            │ High School    │ Mathematics      │            1 │               91 │ Summer 2025 │
│ 28 │ HFA4U1      │ Nutrition and Health                            │ High School    │ Elective         │            1 │               96 │ Fall 2025   │
│ 29 │ MDM4U1      │ Mathematics of Data Management                  │ High School    │ Mathematics      │            1 │               93 │ Fall 2025   │
│ 30 │ SCH4U1      │ Chemistry                                       │ High School    │ Natural Sciences │            1 │               78 │ Fall 2025   │
│ 31 │ PPZ3COL     │ Health For Life                                 │ High School    │ Health and PE    │            1 │               87 │ Fall 2025   │
│ 32 │ AWQ4M1      │ Photography                                     │ High School    │ The Arts         │            1 │                ∅ │ Spring 2026 │
│ 33 │ ICS4U1      │ Computer Science                                │ High School    │ Computer Science │            1 │                ∅ │ Spring 2026 │
│ 34 │ HSP3UOL     │ Intro to Anthropology, Psychology and Sociology │ High School    │ Social Sciences  │            1 │                ∅ │ Spring 2026 │
│ 35 │ SPN-050     │ Spanish Proficiency                             │ University     │ World Language   │            0 │                ∅ │ Summer 2026 │
│ 36 │ PSY-110S-02 │ The Psychological Sciences                      │ University     │ Social Sciences  │            4 │                ∅ │ Fall 2026   │
│ 37 │ CSC-120-01  │ Programming Problem Solving I                   │ University     │ Computer Science │            4 │                ∅ │ Fall 2026   │
│ 38 │ MTH-123-03  │ Elementary Statistics                           │ University     │ Mathematics      │            3 │                ∅ │ Fall 2026   │
│ 39 │ FYS-100-27  │ First Year Seminar: What's your Why?            │ University     │ Integrative Core │            4 │                ∅ │ Fall 2026   │
└────┴─────────────┴─────────────────────────────────────────────────┴────────────────┴──────────────────┴──────────────┴──────────────────┴─────────────┘
*/