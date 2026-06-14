-- R1: displays all courses in computer science, natural science, or math, limited to 30 results
SELECT term, course_code, course_name, academic_level, credit_hours, percentage_grade
FROM courses
WHERE subject_area IN ('Computer Science', 'Natural Sciences', 'Mathematics') AND credit_hours > 0
ORDER BY id DESC
LIMIT 30;
/* Results
┌─────────────┬─────────────┬────────────────────────────────┬────────────────┬──────────────┬──────────────────┐
│    term     │ course_code │          course_name           │ academic_level │ credit_hours │ percentage_grade │
├─────────────┼─────────────┼────────────────────────────────┼────────────────┼──────────────┼──────────────────┤
│ Fall 2026   │ MTH-123-03  │ Elementary Statistics          │ University     │            3 │                ∅ │
│ Fall 2026   │ CSC-120-01  │ Programming Problem Solving I  │ University     │            4 │                ∅ │
│ Spring 2026 │ ICS4U1      │ Computer Science               │ High School    │            1 │                ∅ │
│ Fall 2025   │ SCH4U1      │ Chemistry                      │ High School    │            1 │               78 │
│ Fall 2025   │ MDM4U1      │ Mathematics of Data Management │ High School    │            1 │               93 │
│ Summer 2025 │ MCV4UOL     │ Calculus and Vectors           │ High School    │            1 │               91 │
│ Summer 2025 │ MHF4UOL     │ Advanced Functions             │ High School    │            1 │               91 │
│ Spring 2025 │ SPH4U1      │ Physics                        │ High School    │            1 │               80 │
│ Spring 2025 │ SCH3U1      │ Chemistry                      │ High School    │            1 │               86 │
│ Fall 2024   │ SPH3U1      │ Physics                        │ High School    │            1 │               85 │
│ Fall 2024   │ MCR3U1      │ Functions                      │ High School    │            1 │               94 │
│ Spring 2024 │ MPM2D1      │ Principles of Mathematics      │ High School    │            1 │               86 │
│ Spring 2024 │ SNC2D1      │ Science                        │ High School    │            1 │               91 │
│ Spring 2024 │ ICS3U1      │ Intro to Computer Science      │ High School    │            1 │               95 │
│ Spring 2023 │ MTH1W1      │ Mathematics                    │ High School    │            1 │               91 │
│ Spring 2023 │ SNC1W1      │ Science                        │ High School    │            1 │               93 │
└─────────────┴─────────────┴────────────────────────────────┴────────────────┴──────────────┴──────────────────┘
*/

-- R2: displays all grade 12 university level courses in descending percentage_grade order
SELECT term, course_code, course_name, percentage_grade
FROM courses
WHERE academic_level = 'High School' AND course_code LIKE '___4U%'
ORDER BY percentage_grade DESC;
/* Results
┌─────────────┬─────────────┬────────────────────────────────┬──────────────────┐
│    term     │ course_code │          course_name           │ percentage_grade │
├─────────────┼─────────────┼────────────────────────────────┼──────────────────┤
│ Spring 2026 │ ICS4U1      │ Computer Science               │                ∅ │
│ Fall 2025   │ HFA4U1      │ Nutrition and Health           │               96 │
│ Summer 2024 │ ENG4U1      │ English                        │               93 │
│ Fall 2025   │ MDM4U1      │ Mathematics of Data Management │               93 │
│ Summer 2025 │ MHF4UOL     │ Advanced Functions             │               91 │
│ Summer 2025 │ MCV4UOL     │ Calculus and Vectors           │               91 │
│ Spring 2025 │ SPH4U1      │ Physics                        │               80 │
│ Fall 2025   │ SCH4U1      │ Chemistry                      │               78 │
└─────────────┴─────────────┴────────────────────────────────┴──────────────────┘
*/

-- R3: displays number of courses and credits and average percentage grade for each term
SELECT term, count(*) AS Courses, SUM(credit_hours) AS Credits, AVG(percentage_grade) AS AvgGrade
FROM courses
WHERE percentage_grade IS NOT NULL
GROUP BY term
ORDER BY term ASC;
/* Results
┌─────────────┬─────────┬─────────┬───────────────────┐
│    term     │ courses │ credits │     avggrade      │
├─────────────┼─────────┼─────────┼───────────────────┤
│ 2022-23     │       1 │       2 │                96 │
│ 2023-24     │       1 │       2 │                93 │
│ 2024-25     │       1 │       2 │                95 │
│ Fall 2022   │       3 │       3 │                92 │
│ Fall 2023   │       4 │       3 │             95.25 │
│ Fall 2024   │       3 │       3 │                92 │
│ Fall 2025   │       4 │       4 │              88.5 │
│ Spring 2023 │       3 │       3 │ 91.66666666666667 │
│ Spring 2024 │       3 │       3 │ 90.66666666666667 │
│ Spring 2025 │       3 │       3 │                87 │
│ Summer 2023 │       1 │       1 │                83 │
│ Summer 2024 │       2 │       2 │              85.5 │
│ Summer 2025 │       2 │       2 │                91 │
└─────────────┴─────────┴─────────┴───────────────────┘
*/

-- R4: displays number of courses and credits and average percentage grade for each term with an average grade of 90+
SELECT term, count(*) AS Courses, SUM(credit_hours) AS Credits, AVG(percentage_grade) AS AvgGrade
FROM courses
WHERE percentage_grade IS NOT NULL
GROUP BY term
HAVING AVG(percentage_grade) >= 90
ORDER BY AVG(percentage_grade) DESC;
/* Results
┌─────────────┬─────────┬─────────┬───────────────────┐
│    term     │ courses │ credits │     avggrade      │
├─────────────┼─────────┼─────────┼───────────────────┤
│ 2022-23     │       1 │       2 │                96 │
│ Fall 2023   │       4 │       3 │             95.25 │
│ 2024-25     │       1 │       2 │                95 │
│ 2023-24     │       1 │       2 │                93 │
│ Fall 2022   │       3 │       3 │                92 │
│ Fall 2024   │       3 │       3 │                92 │
│ Spring 2023 │       3 │       3 │ 91.66666666666667 │
│ Summer 2025 │       2 │       2 │                91 │
│ Spring 2024 │       3 │       3 │ 90.66666666666667 │
└─────────────┴─────────┴─────────┴───────────────────┘
*/

-- R5: displays all high school courses where my percentage grade was above average
SELECT term, academic_level, course_code, course_name, percentage_grade
FROM courses
WHERE percentage_grade > (SELECT AVG(percentage_grade) FROM courses)
ORDER BY percentage_grade DESC;
/* Results
┌─────────────┬────────────────┬─────────────┬────────────────────────────────┬──────────────────┐
│    term     │ academic_level │ course_code │          course_name           │ percentage_grade │
├─────────────┼────────────────┼─────────────┼────────────────────────────────┼──────────────────┤
│ Fall 2023   │ High School    │ ENG2D1      │ English                        │               99 │
│ Fall 2022   │ High School    │ FSF1D1      │ Core French                    │               98 │
│ Fall 2024   │ High School    │ AWQ3M1      │ Photography                    │               97 │
│ Fall 2023   │ High School    │ LWSBD1      │ Level 1 Spanish                │               97 │
│ 2022-23     │ High School    │ HPA21       │ High Performance Athlete (HPA) │               96 │
│ Fall 2025   │ High School    │ HFA4U1      │ Nutrition and Health           │               96 │
│ Fall 2023   │ High School    │ GLC2O1      │ Career Studies                 │               96 │
│ Spring 2024 │ High School    │ ICS3U1      │ Intro to Computer Science      │               95 │
│ Spring 2025 │ High School    │ LWSCU1      │ Level 2 Spanish                │               95 │
│ 2024-25     │ High School    │ HPA21       │ High Performance Athlete (HPA) │               95 │
│ Fall 2024   │ High School    │ MCR3U1      │ Functions                      │               94 │
│ Fall 2025   │ High School    │ MDM4U1      │ Mathematics of Data Management │               93 │
│ Spring 2023 │ High School    │ SNC1W1      │ Science                        │               93 │
│ 2023-24     │ High School    │ HPA 21      │ High Performance Athlete (HPA) │               93 │
│ Summer 2024 │ High School    │ ENG4U1      │ English                        │               93 │
│ Fall 2022   │ High School    │ AVI1O1      │ Visual Arts                    │               93 │
│ Spring 2023 │ High School    │ MTH1W1      │ Mathematics                    │               91 │
│ Summer 2025 │ High School    │ MHF4UOL     │ Advanced Functions             │               91 │
│ Summer 2025 │ High School    │ MCV4UOL     │ Calculus and Vectors           │               91 │
│ Spring 2023 │ High School    │ CGC1D1      │ Issues in Canadian Geography   │               91 │
│ Spring 2024 │ High School    │ SNC2D1      │ Science                        │               91 │
└─────────────┴────────────────┴─────────────┴────────────────────────────────┴──────────────────┘
*/

-- R6: displays all courses with both percentage grade and letter grade
SELECT term, academic_level, course_code, course_name, percentage_grade,
    CASE
        WHEN percentage_grade BETWEEN 0 AND 49.9 THEN 'F'
        WHEN percentage_grade BETWEEN 50 AND 59.9 THEN 'D'
        WHEN percentage_grade BETWEEN 60 AND 69.9 THEN 'C'
        WHEN percentage_grade BETWEEN 70 AND 79.9 THEN 'B'
        WHEN percentage_grade BETWEEN 80 AND 100 THEN 'A'
    END AS LetterGrade
FROM courses
WHERE percentage_grade IS NOT NULL;
/* Results
┌─────────────┬────────────────┬─────────────┬────────────────────────────────┬──────────────────┬─────────────┐
│    term     │ academic_level │ course_code │          course_name           │ percentage_grade │ lettergrade │
├─────────────┼────────────────┼─────────────┼────────────────────────────────┼──────────────────┼─────────────┤
│ Fall 2022   │ High School    │ AVI1O1      │ Visual Arts                    │               93 │ A           │
│ Fall 2022   │ High School    │ FSF1D1      │ Core French                    │               98 │ A           │
│ Fall 2022   │ High School    │ ENG1D1      │ English                        │               85 │ A           │
│ 2022-23     │ High School    │ HPA21       │ High Performance Athlete (HPA) │               96 │ A           │
│ Spring 2023 │ High School    │ CGC1D1      │ Issues in Canadian Geography   │               91 │ A           │
│ Spring 2023 │ High School    │ SNC1W1      │ Science                        │               93 │ A           │
│ Spring 2023 │ High School    │ MTH1W1      │ Mathematics                    │               91 │ A           │
│ Summer 2023 │ High School    │ CHC2D1      │ Canadian History               │               83 │ A           │
│ Fall 2023   │ High School    │ LWSBD1      │ Level 1 Spanish                │               97 │ A           │
│ Fall 2023   │ High School    │ CHV2O1      │ Civics and Citizenship         │               89 │ A           │
│ Fall 2023   │ High School    │ GLC2O1      │ Career Studies                 │               96 │ A           │
│ Fall 2023   │ High School    │ ENG2D1      │ English                        │               99 │ A           │
│ 2023-24     │ High School    │ HPA 21      │ High Performance Athlete (HPA) │               93 │ A           │
│ Spring 2024 │ High School    │ ICS3U1      │ Intro to Computer Science      │               95 │ A           │
│ Spring 2024 │ High School    │ SNC2D1      │ Science                        │               91 │ A           │
│ Spring 2024 │ High School    │ MPM2D1      │ Principles of Mathematics      │               86 │ A           │
│ Summer 2024 │ High School    │ NBE3U1      │ English                        │               78 │ B           │
│ Summer 2024 │ High School    │ ENG4U1      │ English                        │               93 │ A           │
│ Fall 2024   │ High School    │ MCR3U1      │ Functions                      │               94 │ A           │
│ Fall 2024   │ High School    │ AWQ3M1      │ Photography                    │               97 │ A           │
│ Fall 2024   │ High School    │ SPH3U1      │ Physics                        │               85 │ A           │
│ 2024-25     │ High School    │ HPA21       │ High Performance Athlete (HPA) │               95 │ A           │
│ Spring 2025 │ High School    │ LWSCU1      │ Level 2 Spanish                │               95 │ A           │
│ Spring 2025 │ High School    │ SCH3U1      │ Chemistry                      │               86 │ A           │
│ Spring 2025 │ High School    │ SPH4U1      │ Physics                        │               80 │ A           │
│ Summer 2025 │ High School    │ MHF4UOL     │ Advanced Functions             │               91 │ A           │
│ Summer 2025 │ High School    │ MCV4UOL     │ Calculus and Vectors           │               91 │ A           │
│ Fall 2025   │ High School    │ HFA4U1      │ Nutrition and Health           │               96 │ A           │
│ Fall 2025   │ High School    │ MDM4U1      │ Mathematics of Data Management │               93 │ A           │
│ Fall 2025   │ High School    │ SCH4U1      │ Chemistry                      │               78 │ B           │
│ Fall 2025   │ High School    │ PPZ3COL     │ Health For Life                │               87 │ A           │
└─────────────┴────────────────┴─────────────┴────────────────────────────────┴──────────────────┴─────────────┘
*/

/* R7: saves R2 (all grade 12 U level courses in descending percentage grade order) as a VIEW
This could help if you're keeping track of your courses to make sure your grades and university applications are up to par */
CREATE VIEW u_level_course_grades AS
SELECT term, course_code, course_name, percentage_grade
FROM courses
WHERE academic_level = 'High School' AND course_code LIKE '___4U%'
ORDER BY percentage_grade DESC;
-- Displays u_level_course_grades VIEW
SELECT * FROM u_level_course_grades;
/* Results
┌─────────────┬─────────────┬────────────────────────────────┬──────────────────┐
│    term     │ course_code │          course_name           │ percentage_grade │
├─────────────┼─────────────┼────────────────────────────────┼──────────────────┤
│ Spring 2026 │ ICS4U1      │ Computer Science               │                ∅ │
│ Fall 2025   │ HFA4U1      │ Nutrition and Health           │               96 │
│ Summer 2024 │ ENG4U1      │ English                        │               93 │
│ Fall 2025   │ MDM4U1      │ Mathematics of Data Management │               93 │
│ Summer 2025 │ MHF4UOL     │ Advanced Functions             │               91 │
│ Summer 2025 │ MCV4UOL     │ Calculus and Vectors           │               91 │
│ Spring 2025 │ SPH4U1      │ Physics                        │               80 │
│ Fall 2025   │ SCH4U1      │ Chemistry                      │               78 │
└─────────────┴─────────────┴────────────────────────────────┴──────────────────┘
*/