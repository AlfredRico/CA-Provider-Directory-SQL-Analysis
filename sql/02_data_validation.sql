-- Summarize missing values across key provider fields

SELECT
  COUNT(*) AS total_rows,

  COUNTIF(PHYS_NPI IS NULL) AS missing_phys_npi,
  COUNTIF(LIC_NUM IS NULL) AS missing_license_number,
  COUNTIF(STATUS_DESC IS NULL) AS missing_license_status,
  COUNTIF(LIC_ISSUE_DT IS NULL) AS missing_license_issue_date,
  COUNTIF(LIC_EXP_DT IS NULL) AS missing_license_expriation_date,
  COUNTIF(PHYS_PRIM_SPC_DESC IS NULL) AS missing_primary_specialty,
  COUNTIF(PRAC_ID_1 IS NULL) AS missing_primary_practice_id

FROM `provider-sql-analysis.ca_provider_directory.physician_directory`;

-- Review NPI structure for consistency

SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT PHYS_NPI) AS unique_phys_npi,

  COUNTIF(LENGTH(CAST(PHYS_NPI AS STRING))= 10) AS valid_10_digit_npi,
  COUNTIF(LENGTH(CAST(PHYS_NPI AS STRING)) != 10) AS invalid_npi_length,

  COUNTIF(PHYS_NPI IS NULL) AS missing_phys_npi

FROM `provider-sql-analysis.ca_provider_directory.physician_directory`;