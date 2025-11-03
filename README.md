# Hybrid Bayesian Network for COPD Prediction
_Master’s Thesis Project – Sia Hwang, Ewha Womans University (2025)_

## 📖 Overview
This repository contains the implementation and documentation for my master’s thesis:
**“Hybrid Bayesian Network Model for COPD Prediction.”**
The project combines causal inference and predictive modeling to improve early COPD detection.

## 🎯 Motivation
- COPD remains underdiagnosed in early stages. Early detection not only saves lives but also significantly reduces societal medical costs.
- Standard ML models often lack interpretability; Bayesian Networks offer causal insight.
- The dataset is highly imbalanced; ADASYN oversampling is used to improve minority class representation.
- The proposed **Hybrid BN** integrates interpretability and accuracy for clinical applicability.

## 📂 Repository Structure
```
ms-thesis-hybrid-bn-copd/
│
├── thesis/ # Thesis PDF & supplementary material
│
├── preprocessing_R/ # R scripts for cleaning & feature engineering
│
├── oversampling_Python/ # Python scripts for ADASYN oversampling
│
├── modeling_R/ # R scripts for creating base BN DAGs and selecting significant variables for LR
│
├── evaluation_Rmd/ # R Markdown for 5-Fold CV evaluation
│   # - `evaluation_summary.html`: Summary of 5-Fold CV results comparing Logistic Regression, Bayesian Network (BN-B, BN-WB, BN-H).
│   # - Generated using `rmarkdown::render()` to visualize key performance metrics (AUC, F1, Recall, Precision).
│
├── results/ # Model outputs, figures, tables
│
└── README.md # This document
```

## 📊 Key Results

The following table shows the averaged 5-Fold Cross-Validation performance metrics (at threshold 0.5) for the implemented models.

| Model | AUC-ROC | F1-Score | Recall | Precision |
| :--- | :---: | :---: | :---: | :---: |
| Logistic Regression | 0.721 | 0.332 | 0.681 | 0.219 |
| BN-B (Blacklist) | 0.682 | 0.300 | 0.675 | 0.193 |
| BN-WB (Whitelist) | 0.653 | 0.290 | 0.655 | 0.187 |
| **BN-H (Hybrid)** | **0.721** | **0.329** | **0.663** | **0.219** |

Full experimental results (including threshold 0.3) and discussion are available in `thesis/Thesis_Main.pdf` and `evaluation_Rmd/evaluation_summary.html`.

## 🔐 Data Availability
The KoGES cohort data used in this project cannot be publicly shared due to IRB restrictions.
The analysis outputs (e.g., `evaluation_Rmd/evaluation_summary.html`) are provided to ensure the reproducibility of our results. The R and Python scripts are provided for methodological review and can be adapted to any equivalently structured dataset.

## 📚 Citation
> Hwang, S. (2025). *Hybrid Bayesian Network Model for COPD Prediction*.
> Master’s Thesis, Ewha Womans University.

## 📧 Contact
**Author:** Sia Hwang
**Email:** yelosiaa@gmail.com
**GitHub:** [github.com/siahwang](https://github.com/siahwang)
