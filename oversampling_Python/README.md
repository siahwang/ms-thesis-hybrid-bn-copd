# Oversampling (ADASYN) Scripts

This directory contains Python scripts used to handle **class imbalance** in the COPD dataset
via the **ADASYN (Adaptive Synthetic Sampling)** algorithm.

---

## 📂 Directory Overview

| File | Description |
|------|--------------|
| `adasyn_kfold.ipynb` | Generates **5-fold ADASYN-resampled datasets** for cross-validation. Each fold’s train/test set is oversampled separately to prevent data leakage. Output files are stored in `data/train_data/` and `data/test_data/`. |
| `adasyn_full_dataset.ipynb` | Applies ADASYN **once to the entire dataset** to produce a full oversampled version (`full_adasyn.csv`). This version was used only for: <br> (1) selecting significant variables via Logistic Regression, <br> (2) constructing BN-WB and BN-B structures. <br> It was *not* used for model evaluation or CV results. |

---

## 🧠 Rationale

- The original COPD dataset has **2,776 observations** and exhibits strong class imbalance.  
- To ensure **stable fold-level variable representation**, ADASYN oversampling was performed at both levels:
  - **Fold-level**: for fair evaluation and comparison between models.
  - **Full-dataset level**: for identifying globally significant predictors (used as whitelist variables in BN-WB).

Using the full-dataset ADASYN results for structure learning only (not evaluation)
prevents data leakage while improving the stability of BN-based model initialization.

---

## ⚙️ Output Summary

| Folder | Contents |
|---------|-----------|
| `../data/train_data/` | 5 oversampled training folds (`adasyn_train_fold1.csv` ~ `adasyn_train_fold5.csv`) |
| `../data/test_data/`  | 5 corresponding test folds (`adasyn_test_fold1.csv` ~ `adasyn_test_fold5.csv`) |
| `../data/full_adasyn/` | Single oversampled dataset (`full_adasyn.csv`) |

---

## 🧩 Notes
- All random seeds are fixed (`seed=42`) for reproducibility.
- The oversampling ratio was chosen to balance minority and majority classes without overfitting.
- Evaluation and metric computation are done **exclusively using fold-level ADASYN data**.

---

**Author:** Sia Hwang  
**Last updated:** November 2025
