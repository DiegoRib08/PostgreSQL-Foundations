CREATE INDEX idx_courses_credits ON courses(credit_hours);
-- Indexes are useful for speeding up queries on frequently used columns, boosting read speeds with the trade-off of slower write speeds