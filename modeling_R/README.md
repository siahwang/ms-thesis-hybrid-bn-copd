# Modeling Results (Logistic Regression & Bayesian Network)

This folder contains the R Markdown file and its rendered HTML output for the final modeling step of the COPD prediction project.

---

## 📁 Files
- **LR_BN_modeling.Rmd** – R Markdown file including all code used for model fitting and evaluation.  
- **LR_BN_modeling.html** – Rendered output of the above RMD file (for viewing results only).

---

## 🧩 Description
The analysis compares **Logistic Regression (LR)** and **Bayesian Network (BN)** models trained on the final dataset (n = 2,776).  
Oversampling was applied beforehand to address class imbalance, and folds were fixed to minimize variation across splits.

This HTML document contains:
- Summary of model performance (F1, Precision, Recall, ROC-AUC)  
- Cross-validation results and visualization  
- Discussion on variation control due to small sample size

---

## ⚠️ Note
The R Markdown and HTML are provided **for reference only**.  
Due to dependency and data access restrictions, this analysis **cannot be reproduced directly** without the original dataset and project environment.
