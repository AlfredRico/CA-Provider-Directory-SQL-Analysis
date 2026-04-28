-- Summarize provider license status

SELECT
  STATUS_DESC,
  COUNT(*) AS provider_count
FROM `provider-sql-analysis.ca_provider_directory.physician_directory`
GROUP BY STATUS_DESC
ORDER BY provider_count DESC;

-- Review expired/active records using license expiration dates

SELECT
  COUNT(*) AS total_rows,

  COUNTIF(LIC_EXP_DT < CURRENT_DATE()) AS expired_license_records,

  COUNTIF(LIC_EXP_DT >= CURRENT_DATE()) AS active_license_records,

  COUNTIF(LIC_EXP_DT IS NULL) AS missing_expiration_date

FROM `provider-sql-analysis.ca_provider_directory.physician_directory`;
