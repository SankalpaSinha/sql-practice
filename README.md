# SQL Practice — MuleSoft Integration Training

MySQL schema and queries from my MuleSoft integration training, where a
database was part of every integration I built, plus practice queries on
the same schema.

## Files

- **schema.sql** — the `MuleTrainingDB` schema and `Product` table backing
  my product-catalog integration APIs, with deliberate data-type choices
  (DECIMAL for money, BIGINT for epoch timestamps, AUTO_INCREMENT keys),
  and sample data.
- **queries.sql** — retrieval and filtering queries used by the APIs,
  the parameterized form used in the Mule Database connector (bound
  input parameters instead of string concatenation, preventing SQL
  injection), watermark-based incremental fetch queries from the
  Object Store lab, and aggregate practice queries (ORDER BY, GROUP BY,
  HAVING).

## Context

These queries were wired to live HTTP APIs through the MuleSoft Database
connector: results were transformed to JSON with DataWeave, and database
credentials were externalized into encrypted property files rather than
hardcoded.
