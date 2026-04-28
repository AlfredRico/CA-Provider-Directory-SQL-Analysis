-- Review physician-to-practice linkage coverage

SELECT
  COUNT(*) AS total_rows,

  COUNTIF(PRAC_ID_1 IS NOT NULL) AS records_with_primary_practice_id,

  COUNTIF(PRAC_ID_1 IS NULL) AS records_missing_priumary_practice_id

FROM `provider-sql-analysis.ca_provider_directory.physician_directory`;

-- Confirm directory load

SELECT
  COUNT(*) AS  total_practice_records
FROM `provider-sql-analysis.ca_provider_directory.practice_directory`;

-- Join physician records to practice records using primary practice ID

SELECT
  COUNT(*) AS joined_records
FROM `provider-sql-analysis.ca_provider_directory.physician_directory` p
INNER JOIN `provider-sql-analysis.ca_provider_directory.practice_directory` pr
  ON p.PRAC_ID_1 = pr.PRACTICE_ID;