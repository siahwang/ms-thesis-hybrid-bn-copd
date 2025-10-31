############################################################
# COPD Data Preprocessing Script (AS7 dataset)
# Author: Sia Hwang
# Description:
#   - Load SAS dataset
#   - Clean and preprocess variables
#   - Derive COPD and related categorical variables
#   - Export analysis-ready dataset and summary table
############################################################

# ==========================================================
# 1. Load Packages
# ==========================================================
library(haven)
library(dplyr)

# ==========================================================
# 2. Load SAS Data
# ==========================================================
data_as7 <- read_sas("/Users/hwangsia/Downloads/RAW_DATA/as7.sas7bdat")
data <- data_as7

str(data)

# ==========================================================
# 3. Filter Ansan Data (classes 721, 722)
# ==========================================================
ansan_data <- subset(data, AS7_DATA_CLASS %in% c(721, 722))
table(ansan_data$AS7_DATA_CLASS)

# ==========================================================
# 4. Dependent Variable: COPD (AS7_SP3_2)
# ==========================================================
ansan_data$AS7_SP3_2 <- as.numeric(ansan_data$AS7_SP3_2)

ansan_data <- ansan_data %>%
  mutate(
    AS7_SP3_2 = case_when(
      AS7_SP3_2 %in% c(66666, 77777, 99999) ~ NA_real_,
      TRUE ~ AS7_SP3_2
    )
  )

summary(ansan_data$AS7_SP3_2)
table(is.na(ansan_data$AS7_SP3_2))

# ==========================================================
# 5. FEV1/FVC Ratio and COPD Group
# ==========================================================
ansan_data <- ansan_data %>%
  mutate(
    AS7_SP1_2 = as.numeric(AS7_SP1_2),
    AS7_SP2_2 = as.numeric(AS7_SP2_2),
    AS7_SP1_2 = ifelse(AS7_SP1_2 %in% c(66666, 77777, 99999), NA, AS7_SP1_2),
    AS7_SP2_2 = ifelse(AS7_SP2_2 %in% c(66666, 77777, 99999), NA, AS7_SP2_2),
    AS7_FEV1FVC_RATIO = ifelse(!is.na(AS7_SP1_2) & AS7_SP1_2 > 0,
                               (AS7_SP2_2 / AS7_SP1_2) * 100, NA),
    COPD_group = case_when(
      AS7_FEV1FVC_RATIO < 70 ~ "COPD",
      AS7_FEV1FVC_RATIO >= 70 ~ "Normal",
      TRUE ~ NA_character_
    )
  )

summary(ansan_data$AS7_FEV1FVC_RATIO)
table(ansan_data$COPD_group, useNA = "ifany")

ansan_data <- ansan_data %>%
  mutate(COPD = ifelse(AS7_SP3_2 < 70, 1, 0)) %>%
  filter(!is.na(COPD))

table(ansan_data$COPD)
prop.table(table(ansan_data$COPD))

# ==========================================================
# 6. Demographics: Age and Sex
# ==========================================================
ansan_data$AGE <- as.numeric(ansan_data$AGE)

ansan_data <- ansan_data %>%
  mutate(
    age = case_when(
      AGE >= 50 & AGE < 60 ~ "50s",
      AGE >= 60 & AGE < 70 ~ "60s",
      AGE >= 70 ~ "70+",
      TRUE ~ NA_character_
    ),
    SEX = as.numeric(SEX),
    SEX = ifelse(SEX %in% c(66666, 77777, 99999), NA, SEX),
    sex = case_when(
      SEX == 1 ~ "Male",
      SEX == 2 ~ "Female",
      TRUE ~ NA_character_
    )
  )

# ==========================================================
# 7. Occupation
# ==========================================================
ansan_data <- ansan_data %>%
  mutate(
    AS7_JOB = as.numeric(AS7_JOB),
    AS7_JOB = ifelse(AS7_JOB %in% c(66666, 77777, 99999), NA, AS7_JOB),
    OccupationRisk = case_when(
      AS7_JOB %in% c(6, 7, 9, 10) ~ "At-risk",
      AS7_JOB %in% 1:14 ~ "Non–at-risk",
      TRUE ~ NA_character_
    )
  )

# ==========================================================
# 8. Income
# ==========================================================
ansan_data <- ansan_data %>%
  mutate(
    AS7_INCOME = as.numeric(AS7_INCOME),
    AS7_INCOME = ifelse(AS7_INCOME %in% c(66666, 77777, 99999), NA, AS7_INCOME),
    Income = case_when(
      AS7_INCOME %in% 1:5 ~ "Low",     # ≤3M KRW
      AS7_INCOME %in% 6:8 ~ "High",    # >3M KRW
      TRUE ~ NA_character_
    )
  )

# ==========================================================
# 9. Smoking and Pack-years
# ==========================================================
ansan_data <- ansan_data %>%
  mutate(
    AS7_SMOKE = as.numeric(AS7_SMOKE),
    AS7_SMOKE = ifelse(AS7_SMOKE %in% c(66666, 77777, 99999), NA, AS7_SMOKE),
    smoking = case_when(
      AS7_SMOKE == 1 ~ "Non-smoker",
      AS7_SMOKE == 2 ~ "Former Smoker",
      AS7_SMOKE == 3 ~ "Current Smoker",
      TRUE ~ NA_character_
    ),
    AS7_PACKYR = as.numeric(AS7_PACKYR),
    AS7_PACKYR = ifelse(AS7_PACKYR %in% c(66666, 77777, 99999), NA, AS7_PACKYR),
    Packyears = case_when(
      !is.na(AS7_PACKYR) & AS7_PACKYR >= 40 ~ "high",
      !is.na(AS7_PACKYR) & AS7_PACKYR < 40  ~ "low",
      TRUE ~ NA_character_
    )
  )

# ==========================================================
# 10. Asthma
# ==========================================================
ansan_data <- ansan_data %>%
  mutate(
    AS7_TREATD11 = as.numeric(AS7_TREATD11),
    AS7_ASTH     = as.numeric(AS7_ASTH),
    AS7_D65A     = as.numeric(AS7_D65A),
    AS7_TREATD11 = ifelse(AS7_TREATD11 %in% c(66666, 77777, 99999), NA, AS7_TREATD11),
    AS7_ASTH     = ifelse(AS7_ASTH %in% c(66666, 77777, 99999), NA, AS7_ASTH),
    AS7_D65A     = ifelse(AS7_D65A %in% c(66666, 77777, 99999), NA, AS7_D65A),
    Asthma = case_when(
      AS7_TREATD11 == 2 | AS7_ASTH == 2 | AS7_D65A == 2 ~ "Yes",
      AS7_TREATD11 == 1 & AS7_ASTH == 1 & AS7_D65A == 1 ~ "No",
      TRUE ~ NA_character_
    )
  )

# ==========================================================
# 11. BMI
# ==========================================================
ansan_data <- ansan_data %>%
  mutate(
    AS7_BMI = as.numeric(AS7_BMI),
    AS7_BMI = ifelse(AS7_BMI %in% c(66666, 77777, 99999), NA, AS7_BMI),
    BMI_Group = case_when(
      !is.na(AS7_BMI) & AS7_BMI >= 25 ~ "Obese",
      !is.na(AS7_BMI) & AS7_BMI < 25  ~ "Normal",
      TRUE ~ NA_character_
    )
  )

# ==========================================================
# 12. PM2.5 (3-year average)
# ==========================================================
ansan_data <- ansan_data %>%
  mutate(
    PM25_AVG_Y3 = as.numeric(PM25_AVG_Y3),
    PM25_AVG_Y3 = ifelse(PM25_AVG_Y3 %in% c(66666, 77777, 99999), NA, PM25_AVG_Y3)
  )

pm25_median <- median(ansan_data$PM25_AVG_Y3, na.rm = TRUE)

ansan_data <- ansan_data %>%
  mutate(
    PM25_Group = case_when(
      !is.na(PM25_AVG_Y3) & PM25_AVG_Y3 >= pm25_median ~ "high",
      !is.na(PM25_AVG_Y3) & PM25_AVG_Y3 < pm25_median  ~ "low",
      TRUE ~ NA_character_
    )
  )

# ==========================================================
# 13. Final Dataset
# ==========================================================
final_data <- ansan_data %>%
  select(
    ID, COPD, age, sex, OccupationRisk, Income,
    smoking, Packyears, Asthma, BMI_Group, PM25_Group
  )

final_data$COPD <- as.character(final_data$COPD)

# ==========================================================
# 14. Summary Table (Table 2)
# ==========================================================
analysis_df <- final_data %>%
  mutate(
    COPD_label = ifelse(COPD == 1, "COPD", "Non-COPD"),
    COPD_label = factor(COPD_label, levels = c("Non-COPD", "COPD"))
  )

make_block <- function(df, var, pretty_name) {
  x <- df[[var]]
  y <- df$COPD_label
  tab <- table(x, y)
  
  non_copd_n <- tab[, "Non-COPD"]
  copd_n <- tab[, "COPD"]
  row_totals <- non_copd_n + copd_n
  
  non_copd_pct <- round(non_copd_n / row_totals * 100, 1)
  copd_pct <- round(copd_n / row_totals * 100, 1)
  
  pval <- suppressWarnings(chisq.test(tab)$p.value)
  pval_fmt <- ifelse(pval < 0.0001, "<0.0001", format(round(pval, 4), nsmall = 4))
  
  block <- data.frame(
    Variable = pretty_name,
    Level = rownames(tab),
    Non_COPD = paste0(non_copd_n, " (", non_copd_pct, "%)"),
    COPD = paste0(copd_n, " (", copd_pct, "%)"),
    p_value = ""
  )
  block$p_value[1] <- pval_fmt
  block
}

copd_summary_table <- bind_rows(
  make_block(analysis_df, "sex", "Sex"),
  make_block(analysis_df, "age", "Age group"),
  make_block(analysis_df, "Income", "Income"),
  make_block(analysis_df, "OccupationRisk", "Occupational Risk"),
  make_block(analysis_df, "Asthma", "Asthma"),
  make_block(analysis_df, "smoking", "Smoking"),
  make_block(analysis_df, "Packyears", "Pack-years"),
  make_block(analysis_df, "BMI_Group", "BMI"),
  make_block(analysis_df, "PM25_Group", "PM2.5")
)

# ==========================================================
# 15. Export Results
# ==========================================================
write.csv(copd_summary_table, "COPD_summary_table.csv", row.names = FALSE, fileEncoding = "utf-8")
write.csv(final_data, "final_data.csv", row.names = FALSE, fileEncoding = "utf-8")

############################################################
# End of Script
############################################################
