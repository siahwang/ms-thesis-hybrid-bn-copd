# Hybrid Bayesian Network for COPD Prediction  
_Master’s Thesis Project – Sia Hwang, Ewha Womans University (2025)_

## 📖 Overview  
This repository contains the implementation and documentation for my master’s thesis:  
**“Hybrid Bayesian Network Model for COPD Prediction.”**  
The project combines causal inference and predictive modeling to improve early COPD detection in a large-scale cohort dataset.

## 🎯 Motivation  
- COPD remains underdiagnosed in early stages; early detection can save lives.  
- Standard ML models often lack interpretability; Bayesian Networks offer causal insight.  
- The dataset is highly imbalanced; ADASYN oversampling is used to improve minority class representation.  
- The proposed **Hybrid BN** integrates interpretability and accuracy for clinical applicability.
  
## 📂 Repository Structure  
ms-thesis-hybrid-bn-copd/
│
├── thesis/ # Thesis PDF & supplementary material
│
├── preprocessing_R/ # R scripts for cleaning & feature engineering
│
├── oversampling_Python/ # Python scripts for ADASYN oversampling
│
├── modeling_R/ # R scripts for Bayesian Network modeling
│
├── results/ # Model outputs, figures, tables
│
└── README.md # This document

## 🧰 Setup & Usage  

### Requirements  
- **R (≥4.0)**: `bnlearn`, `dplyr`, `ggplot2`  
- **Python (≥3.8)**: `numpy`, `pandas`, `imbalanced-learn`  

### Installation
git clone https://github.com/siahwang/ms-thesis-hybrid-bn-copd.git
cd ms-thesis-hybrid-bn-copd
pip install -r requirements/requirements.txt


## 📊 Key Results  

| Model | AUC | Interpretability |
|--------|-----|------------------|
| Logistic Regression | 0.71 | High |
| XGBoost | 0.80 | Moderate |
| **Hybrid BN (Proposed)** | **0.84** | **High** |

Full experimental results and discussion are available in `thesis/Thesis_Main.pdf`.

## 🔐 Data Availability  
The KoGES Ansan cohort data used in this project cannot be publicly shared due to IRB restrictions.  
Scripts are fully reproducible using any equivalent structured dataset.

## 📚 Citation  
> Hwang, S. (2025). *Hybrid Bayesian Network Model for COPD Prediction*.  
> Master’s Thesis, Ewha Womans University.

## 📧 Contact  
**Author:** Sia Hwang  
**Email:** yelosiaa@gmail.com 
**GitHub:** [github.com/siahwang](https://github.com/siahwang)

