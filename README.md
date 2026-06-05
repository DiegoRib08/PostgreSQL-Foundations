# SQL Foundations — Assignment

A self-paced assignment that takes you from zero SQL to a basic, working command of the language. It's structured like a programming-language course — setup, "hello world," types, structures, control of data, and a capstone application. Work top to bottom; each module has a **Concept**, the **Syntax** you need, a **Worked Example**, and **Tasks** you complete before moving on.

---

## Before you start: pick your domain

Every task in this assignment asks you to apply a technique to **data of your choice**. Pick one domain you find genuinely interesting and use it throughout — your reports, music library, video game collection, books, movies, recipes, workout logs, car maintenance, a hobby inventory, anything. The domain doesn't matter; using one consistent one does, because each module builds on the last.

The worked examples in this document use a coin collection as a single concrete illustration so you can see the syntax in action. Translate the patterns to your chosen domain; do not copy the coin examples as your answers.

**Write down before continuing:**
- The domain you've chosen.
- The 5–8 attributes (columns) you'd want to record for each item, with a one-word type tag for each (number, decimal, text, date, true/false). This is your rough schema. You'll formalize it in Module 2.

---

## Read this first: the one mental shift

If you come from an imperative language (Python, C, JavaScript), in those you say *how* to get a result: loop over an array, check each element, accumulate. SQL is **declarative and set-based**. You describe *what* you want, and the database engine figures out how.

```c
// C: how
int total = 0;
for (int i = 0; i < n; i++)
    if (coins[i].metal == SILVER) total += coins[i].weight;
```

```sql
-- SQL: what
SELECT SUM(weight) FROM coins WHERE metal = 'silver';
```

No loop, no index variable, no "first do this, then that." You declare the shape of the answer. Internalizing this is 80% of the battle. Every time you catch yourself thinking "loop through the rows," stop and ask "what condition describes the rows I want?"

A second thing to know up front: **SQL has dialects.** SQLite, PostgreSQL, MySQL, SQL Server all share a common core (everything in this assignment) but differ in details (auto-increment syntax, date functions, data type names). This assignment uses **SQLite** because it needs zero setup. The skills transfer directly; only the edges differ.

---

## Module 0 — Setup & Hello World

### Concept
You need a database engine to run queries against. SQLite is a single file, no server, no daemon — ideal for learning.

### Setup (pick one)
- **Fastest, no install:** open <https://sqliteonline.com> or <https://www.db-fiddle.com> (set engine to SQLite). Type SQL, hit run.
- **Local, recommended:** install the SQLite CLI.
  - Linux: `sudo apt install sqlite3`
  - Windows: download the "tools" bundle from sqlite.org, or `winget install SQLite.SQLite`
  - Verify: `sqlite3 --version`
- **GUI option:** [DB Browser for SQLite](https://sqlitebrowser.org) if you prefer clicking over typing while you learn.

Create a working database from the terminal:
```bash
sqlite3 learn.db
```
This drops you into the SQLite prompt (`sqlite>`). To leave, type `.quit`. Files persist, so `learn.db` will hold everything you build.

### Worked Example — Hello World
```sql
SELECT 'Hello, World';
```
A `SELECT` with no table just evaluates the expression and returns it as a one-row, one-column result. This is the SQL equivalent of `print("Hello, World")` — it proves your environment runs.

Useful SQLite niceties for readable output (type these at the `sqlite>` prompt):
```
.headers on
.mode column
```

### Tasks
1. Get an environment running and execute `SELECT 'Hello, World';`.
2. Run `SELECT 2 + 2;`, `SELECT 'a' || 'b';` (string concatenation), and `SELECT 10 / 3;` then `SELECT 10.0 / 3;`. Note the difference between the last pair and explain to yourself why.
3. Run `SELECT 10 / 3, 10 % 3;` — confirm integer division and modulo behave as expected.

---

## Module 1 — Data Types

### Concept
Like any typed language, columns hold typed values. SQLite is unusually relaxed (it uses "type affinity" rather than strict types), but design as if types are strict — every other database is, and the habit transfers.

The core SQL types you'll use:

| SQL type | Holds | Python analogue |
|---|---|---|
| `INTEGER` | whole numbers | `int` |
| `REAL` | floating point | `float` |
| `TEXT` | strings | `str` |
| `BLOB` | raw bytes | `bytes` |
| `NULL` | absence of a value | `None` |

`DATE`/`TIME` exist conceptually; SQLite stores them as `TEXT` (ISO-8601 like `'2026-05-28'`) or numbers. There is no native boolean — use `INTEGER` 0/1.

### The thing that will bite you: NULL
`NULL` is not zero and not an empty string — it means "unknown." Comparisons with `NULL` are not true or false but **unknown**:
```sql
SELECT NULL = NULL;     -- not 1, it's NULL
SELECT NULL IS NULL;    -- 1 (this is how you test for null)
```
You test nullity with `IS NULL` / `IS NOT NULL`, never `= NULL`. This trips up everyone coming from imperative languages.

### Tasks
1. Run `SELECT typeof(42), typeof(42.0), typeof('hi'), typeof(NULL);` and read the results.
2. Predict, then verify: `SELECT 1 = NULL;` vs `SELECT 1 IS NULL;`. Write one sentence explaining the difference.
3. Build a `SELECT` that concatenates a number and a unit string from your domain into a single readable label (e.g. `"Distance: 5 km"`). Use `||`.
4. For each attribute you wrote down in the *Before you start* section, decide which of `INTEGER`, `REAL`, `TEXT`, `INTEGER (0/1)`, or `TEXT (date)` it should be. Write the type list out.

---

## Module 2 — Structures: Creating Tables

### Concept
A **table** is your fundamental data structure — think of it as a `struct` definition plus the array of all its instances, combined. Columns are fields; rows are records. `CREATE TABLE` defines the structure; `INSERT` adds rows.

**Constraints** are how you push correctness into the schema instead of into application code:
- `PRIMARY KEY` — unique identity for each row (often an auto-incrementing integer).
- `NOT NULL` — value required.
- `UNIQUE` — no duplicates in this column.
- `DEFAULT` — value used when none supplied.
- `CHECK (...)` — an arbitrary validity condition.

### Worked Example (illustrative — translate to your domain)
```sql
CREATE TABLE coins (
    id          INTEGER PRIMARY KEY,          -- SQLite auto-assigns if omitted on insert
    name        TEXT    NOT NULL,
    metal       TEXT    NOT NULL CHECK (metal IN ('silver','gold','platinum')),
    weight_oz   REAL    NOT NULL CHECK (weight_oz > 0),
    year        INTEGER,
    is_proof    INTEGER NOT NULL DEFAULT 0,    -- boolean as 0/1
    purity      REAL    DEFAULT 0.999
);

INSERT INTO coins (name, metal, weight_oz, year, is_proof, purity) VALUES
    ('Silver Maple Leaf', 'silver', 1.0, 2024, 0, 0.9999),
    ('Gold Maple Leaf',   'gold',   1.0, 2023, 0, 0.9999),
    ('1999 Proof Set',    'silver', 0.7, 1999, 1, 0.925);
```

Inspect what you built:
```sql
.schema coins        -- shows the CREATE statement
SELECT * FROM coins; -- shows all rows
```

Try to insert something the constraints forbid and watch it get rejected — that's the schema doing its job.

### Tasks
1. Write the `CREATE TABLE` for your chosen domain. Required ingredients in your schema:
   - An `INTEGER PRIMARY KEY`.
   - At least one `NOT NULL` column.
   - At least one `CHECK` constraint (range, enumerated value list, etc.).
   - At least one `DEFAULT`.
   - At least one column that is allowed to be `NULL`.
2. Insert at least 6 realistic rows.
3. Deliberately attempt three inserts that *should* fail (violating `NOT NULL`, `CHECK`, and a wrong-type or out-of-range value). Record the error each one produces.
4. Run `.schema` on your table and confirm it matches what you intended.

---

## Module 3 — Reading Data: SELECT in Depth

### Concept
`SELECT` is the workhorse. The full shape you'll grow into:
```
SELECT   columns
FROM     table
WHERE    row-filter
ORDER BY sort
LIMIT    cap
```
The engine conceptually applies them in the order **FROM → WHERE → SELECT → ORDER BY → LIMIT**, which is why you can't reference a column alias in `WHERE` but can in `ORDER BY`.

### Key tools
- `WHERE` with `=, <>, <, >, <=, >=, AND, OR, NOT`
- `BETWEEN a AND b` — inclusive range
- `IN (...)` — membership, like a set test
- `LIKE` — pattern match (`%` = any run of chars, `_` = one char)
- `DISTINCT` — dedupe
- `ORDER BY col ASC|DESC`
- `LIMIT n` / `LIMIT n OFFSET m`

### Worked Examples (illustrative)
```sql
SELECT name, weight_oz FROM coins WHERE metal = 'silver' ORDER BY weight_oz DESC;
SELECT DISTINCT metal FROM coins;
SELECT name FROM coins WHERE year BETWEEN 1990 AND 2000;
SELECT name FROM coins WHERE name LIKE '%Maple%';
SELECT * FROM coins WHERE metal IN ('gold','platinum') AND is_proof = 0 ORDER BY year DESC LIMIT 3;
```

### Tasks
Using your own table:
1. Write a query that returns a subset of columns (not `*`), filtered by a numeric condition, sorted descending. Limit to the top 5.
2. Use `LIKE` to find rows whose text matches a substring pattern.
3. Use `BETWEEN` to filter on a numeric or date range.
4. Use `DISTINCT` to list the unique values present in one of your columns.
5. Write **one** query that combines `WHERE` (with `AND` or `OR`), `IN`, `ORDER BY`, and `LIMIT`. Add a SQL comment (`--`) above each clause stating what it's doing.

---

## Module 4 — Changing Data: UPDATE, DELETE, Transactions

### Concept
`INSERT` adds, `UPDATE` modifies, `DELETE` removes. **The danger:** `UPDATE` and `DELETE` without a `WHERE` clause hit *every row*. This is the single most common beginner disaster. Build the muscle memory: write the `WHERE` first, then the verb.

**Transactions** group statements so they all succeed or all roll back — atomicity, like a critical section that can be undone:
```sql
BEGIN;
  ...statements...
COMMIT;     -- or ROLLBACK; to undo everything since BEGIN
```

### Worked Examples (illustrative)
```sql
UPDATE coins SET purity = 0.9999 WHERE name = 'Silver Maple Leaf';

DELETE FROM coins WHERE weight_oz < 0.1;

BEGIN;
  UPDATE coins SET is_proof = 1 WHERE year = 1999;
ROLLBACK;   -- the update never happened
```

A safety habit: run the matching `SELECT` first to see exactly which rows your `WHERE` catches, *then* swap `SELECT *` for the `UPDATE`/`DELETE`.

### Tasks
Using your own table:
1. Pick a condition that should match 2–4 rows. `SELECT` those rows first to confirm the set, then `UPDATE` a column on them and verify with another `SELECT`.
2. Inside a `BEGIN ... ROLLBACK` block, delete a group of rows, `SELECT` to confirm they're gone *within the transaction*, then roll back and confirm they're restored.
3. In a comment, describe what `DELETE FROM <your_table>;` (no `WHERE`) would do, and one habit you'll use to avoid it.

---

## Module 5 — Aggregation & Grouping

### Concept
Aggregate functions collapse many rows into one value — the SQL answer to "loop and accumulate." `GROUP BY` runs the aggregate *per group* instead of over the whole table.

- `COUNT(*)`, `SUM(col)`, `AVG(col)`, `MIN(col)`, `MAX(col)`
- `GROUP BY col` — one output row per distinct value of `col`
- `HAVING` — filters *groups* (after aggregation), the way `WHERE` filters rows (before)

### Worked Examples (illustrative)
```sql
-- whole-table aggregates
SELECT COUNT(*) AS num_coins, SUM(weight_oz) AS total_oz
FROM coins;

-- per-metal breakdown
SELECT metal, COUNT(*) AS n, ROUND(SUM(weight_oz), 2) AS oz
FROM coins
GROUP BY metal
ORDER BY oz DESC;

-- only metals where you hold more than 5 oz
SELECT metal, SUM(weight_oz) AS oz
FROM coins
GROUP BY metal
HAVING SUM(weight_oz) > 5;
```

The `WHERE` vs `HAVING` distinction matters: `WHERE` cannot use an aggregate (it runs before grouping); `HAVING` is specifically for conditions on aggregates.

### Tasks
Using your own table, identify one **categorical** column (text or a small set of values) and one **numeric** column to aggregate. Then:
1. Compute a whole-table `COUNT(*)` and one other whole-table aggregate (`SUM`, `AVG`, `MIN`, or `MAX`).
2. Produce a per-group breakdown: for each value of your categorical column, return `COUNT(*)` and at least one numeric aggregate. Sort the result meaningfully.
3. Add a `HAVING` clause so the result shows only groups that meet a threshold (e.g. at least 3 rows, or aggregate above some value).
4. Write **one sentence** explaining why this exact query would fail if you tried to put the same condition in `WHERE` instead of `HAVING`.

---

## Module 6 — A Few Power Tools

### Concept
Enough extras to make you dangerous, briefly.

- **Subqueries** — a query inside a query, used as a value or a set:
  ```sql
  SELECT name FROM coins
  WHERE weight_oz > (SELECT AVG(weight_oz) FROM coins);
  ```
- **CASE** — SQL's conditional expression (its `if/else`):
  ```sql
  SELECT name,
         CASE WHEN weight_oz >= 1 THEN 'standard' ELSE 'fractional' END AS size
  FROM coins;
  ```
- **Views** — a saved query you can treat like a table:
  ```sql
  CREATE VIEW silver_summary AS
  SELECT metal, SUM(weight_oz) AS oz FROM coins WHERE metal='silver';
  SELECT * FROM silver_summary;
  ```
- **Indexes** — performance, not correctness. An index on a column makes lookups on it fast (a B-tree behind the scenes), at the cost of slightly slower writes:
  ```sql
  CREATE INDEX idx_coins_metal ON coins(metal);
  ```

### Tasks
Using your own table:
1. Write a subquery that returns rows whose numeric column is above the table's average for that column.
2. Use `CASE` to add a derived classification column to a `SELECT` (e.g. labelling rows by tier, era, size bucket, range — whatever fits your domain).
3. Create a `VIEW` that gives a clean per-group summary of your data, then `SELECT * FROM` it.
4. Add an `INDEX` on a column you filter by often. In a comment, explain (one line) when an index helps and when it doesn't.

---

## Capstone — Build a Basic Application

Bring it together into one coherent small system on your chosen domain. The capstone is a **single, well-designed table** with rich data and a battery of reports — the foundation a multi-table relational design would later build on.

### Deliverables

1. **Schema (`build.sql`)** — A single `.sql` script that creates the table from scratch. It must include:
   - An `INTEGER PRIMARY KEY`.
   - At least 6 columns across at least 3 different data types.
   - At least one column of each: `NOT NULL`, `CHECK`, `DEFAULT`, and one nullable column.
   - At least one `INDEX` on a frequently-filtered column.

2. **Seed data** — At least **20 rows** in your table, varied enough that aggregations are interesting (more than one value in each categorical column, real spread in numeric columns, at least 2 `NULL`s somewhere appropriate).

3. **Reports** — A `reports.sql` file containing **seven** queries, each preceded by a comment explaining what it answers. Each query must demonstrate a different feature:
   - **R1.** A filtered list using `WHERE` with `AND`/`OR`, `ORDER BY`, and `LIMIT`.
   - **R2.** A pattern match using `LIKE`.
   - **R3.** A per-group breakdown using `GROUP BY` with at least two aggregates.
   - **R4.** A `HAVING` clause filtering groups.
   - **R5.** A subquery comparing rows to an aggregate (above/below average, max, etc.).
   - **R6.** A `CASE` expression producing a derived classification column.
   - **R7.** A `VIEW` saved to the database that wraps one of the above reports.

4. **README** — A short text file (5–10 lines) listing your domain, your schema in one sentence per column, and what each report answers.

### Done means
You can drop the database, then rebuild and verify the entire application with:
```bash
rm app.db
sqlite3 app.db < build.sql
sqlite3 app.db < reports.sql
```
…and every report returns sensible output without error.

---

## Where to go next (beyond "basic")

Once the capstone runs, you've cleared "basic understanding." Natural next steps: splitting your single table into related tables (foreign keys, `JOIN`s — the heart of *relational* design), normalization (1NF/2NF/3NF), window functions (`OVER (...)` — running totals, ranks), proper transaction isolation, and moving from SQLite to PostgreSQL to meet a real server. But finish the capstone first — building one complete thing teaches more than reading about ten.

## Self-check before declaring a module done
For each module, you should be able to: (a) write the syntax from memory for the common case, (b) explain *why* it works the set-based way rather than reaching for a loop, and (c) predict what a query returns before you run it. If you can't predict the output, you're pattern-matching, not understanding — slow down and run small experiments until you can.
