/*
Predictions
'SELECT 1 = NULL;' checks if INTEGER 1 is equal to NULL, will return NULL since NULL is unknown
'SELECT 1 IS NULL;' checks if INTEGER 1 is a NULL value, will return False since 1 is a known value and not a NULL
*/
SELECT 1 = NULL, 1 IS NULL;
/*
Predictions were correct.
The first checks if the values 1 and NULL are equal, while the second checks if the known value 1 is a NULL (unknown) value
*/