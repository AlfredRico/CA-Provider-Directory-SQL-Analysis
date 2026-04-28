-- Confirm correct directory load

SELECT
  COUNT(*) AS total_rows
FROM `provider-sql-analysis.ca_provider_directory.physician_directory`;

-- Review column names and BigQuery data types

SELECT
  column_name,
  data_type
FROM `provider-sql-analysis.ca_provider_directory.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'physician_directory'
ORDER BY ordinal_position;