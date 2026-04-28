-- Review provider specialty distributions

SELECT
  PHYS_PRIM_SPC_DESC,
  COUNT(*) AS provider_count
FROM `provider-sql-analysis.ca_provider_directory.physician_directory`
GROUP BY PHYS_PRIM_SPC_DESC
ORDER BY provider_count DESC
LIMIT 15;

-- Build provider directory KPI summary

SELECT
  COUNT(*) AS total_physicians,

  COUNT(DISTINCT PHYS_NPI) AS unique_npi_count,
  
  COUNTIF(STATUS_DESC = 'Current') AS current_license_records,

  COUNTIF(STATUS_DESC IS NULL) AS missing_license_status,

  COUNTIF(PRAC_ID_1 IS NOT NULL) AS linked_to_primary_practice,

  COUNTIF(PRAC_ID_1 IS NULL) AS missing_primary_practice_link,
  
  COUNTIF(LIC_EXP_DT IS NULL) AS missing_license_expiration_date

FROM `provider-sql-analysis.ca_provider_directory.physician_directory`;