Domain: Student Course/Degree Tracker
Schema:
    **id**: auto-incrementing INTEGER PRIMARY KEY
    **course_code**: TEXT column storing the course codes of added courses
    **course_name**: TEXT column storing the course names of added courses
    **academic_level**: TEXT column differentiating between 'High School' and 'University' courses
    **subject_area**: TEXT column storing the subjects of added courses (e.g. natural sciences, social sciences, mathematics)
    **credit_hours**: REAL column storing the credit value of added courses (1 for most high school courses, 0.5 for some; 4 for most university courses, 3, 2, 1, 0, etc. for some)
    **percentage_grade**: REAL column storing the grade achieved in added courses
    **term**: TEXT column storing the term added courses were/will be taken (e.g. Summer 2025, Spring 2026, Fall 2026, etc.)
Reports:
    **R1**: displays all computer science, natural science and mathematics courses, limited to 30 results (optimization/speed).
    **R2**: displays grade 12 university level courses in descending percentage grade order. Useful for students tracking top courses for university applications.
    **R3**: displays summary of each term - number of courses and credits and average percentage grade.
    **R4**: displays same term summary as R3 for every term with average percentage grade higher than 90.
    **R5**: displays course summary (term, academic level, course code, course name, percentage grade) for every high school course where my percentage grade was above my own overall average grade.
    **R6**: displays similar course summary to R5 with an added lettergrade column (derived from percentage grade values).
    **R7**: wraps R2 to save grade 12 university level courses in descending percentage grade order as a dedicated VIEW. Again, this is useful for students wanting to quickly track top courses for university applications.