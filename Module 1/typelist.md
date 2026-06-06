# Student Course and Degree Tracker #

## Attributes and Types ##
id: integer (Auto-incrementing PRIMARY KEY)
course_code: text
course_name: text
semester: text (can be NULL for course options not in plan)
credit_hours: integer (check >= 0)
percentage_grade: real (single-precision float, or can be NULL)
is_planned: boolean (NOT NULL, default true)
is_in_progress: boolean (NOT NULL)
is_completed: boolean (NOT NULL)

### Additional Attribute Options ###
professor: text
meeting_time: 
duration: interval