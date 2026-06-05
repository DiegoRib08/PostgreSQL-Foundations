SELECT pg_typeof(42), -- INTEGER, returns integer type
pg_typeof(42.0), -- REAL, returns numeric type
pg_typeof('hi'), -- Raw string literal returns unknown type. Hasn't yet been cast to text or assigned to a table
pg_typeof(NULL); -- Unknown value