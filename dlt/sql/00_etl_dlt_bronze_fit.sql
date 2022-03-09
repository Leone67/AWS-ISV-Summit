-- Databricks notebook source
CREATE INCREMENTAL LIVE TABLE insurance_claims_bronze
  SELECT
  `months as customer` as months_as_customer,
  `age` as age,
  `policy number` as policy_number,
  `policy bind date` as policy_bind_date,
  `policy state` as policy_state,
  `policy csl` as policy_csl,
  `policy deductible` as policy_deductible,
  `policy annual premium` as policy_annual_premium,
  `umbrella limit` as umbrella_limit,
  `insured zip` as insured_zip,
  `insured sex` as insured_sex,
  `insured education level` as insured_education_level,
  `insured occupation` as insured_occupation,
  `insured hobbies` as insured_hobbies,
  `insured relationship` as insured_relationship,
  `capital-gains` as capital_gains,
  `capital-loss` as capital_loss,
  `incident date` as incident_date,
  `incident type` as incident_type,
  `collision type` as collision_type,
  `incident severity` as incident_severity,
  `authorities contacted` as authorities_contacted,
  `incident state` as incident_state,
  `incident city` as incident_city,
  `incident location` as incident_location,
  `incident hour of the day` as incident_hour_of_the_day,
  `number of vehicles involved` as number_of_vehicles_involved,
  `property damage` as property_damage,
  `bodily injuries` as bodily_injuries,
  `witnesses` as witnesses,
  `police report available?` as police_report_available,
  `total claim amount` as total_claim_amount,
  `injury claim` as injury_claim,
  `property claim` as property_claim,
  `vehicle claim` as vehicle_claim,
  `auto make` as auto_make,
  `auto model` as auto_model,
  `auto year` as auto_year,
  `fraud reported` as fraud_reported
  FROM cloud_files(
        "${fraud_pipeline.raw_path}", 
        "csv", 
        map("cloudFiles.format", "csv",
            "header", "true",
            "cloudFiles.inferColumnTypes", "true",
            "cloudFiles.schemaLocation", "${fraud_pipeline.schema_path}")
      )
