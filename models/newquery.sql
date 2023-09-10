
{{ config(materialized='table') }}

SELECT
  provider_id AS inpacient_provider_id,
  provider_name,
  provider_city,
  provider_state,
  ROUND(SUM(total_discharges),2) inpacient_sum_total_discharges,
  ROUND(SUM(average_covered_charges),2) inpacient_sum_avg_discharges
FROM
  `bigquery-public-data.medicare.inpatient_charges_2011`
GROUP BY
  1,
  2,
  3,
  4