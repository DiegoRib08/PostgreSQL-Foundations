-- Intentional failed inserts
INSERT INTO courses (course_code, course_name, credit_hours, semester, percentage_grade, is_in_progress, is_completed) VALUES
    (NULL, 'idk', 0, 'Spring 2027', NULL, FALSE, FALSE), /* Violates NOT NULL with NULL course code
    Error: null value in column "course_code" of relation "courses" violates not-null constraint */
    ('CSC-999', 'Quantum Programming 9', 9, 'Spring 2027', -99, FALSE, FALSE), /* Violates grade check with -99%
    Error: new row for relation "courses" violates check constraint "courses_percentage_grade_check" */
    ('CSC-220', 'Programming Problem Solving 2', '4 credit hours', 'Spring 2027', NULL, FALSE, FALSE); /* Violates credit hour type with TEXT
    Error: invalid input syntax for type integer: "4 credit hours" */

-- NOTE: each insert query had to be run separately to see each error message