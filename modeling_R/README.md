# Modeling Results (Logistic Regression & Bayesian Network)

This folder contains R Markdown outputs related to the COPD prediction modeling.
The `.Rmd` file includes logistic regression (LR) modeling and Bayesian network (BN) structure learning
based on the processed dataset (`lr_ready_data`).

---

## 📘 Contents
- **LR_BN_modeling.Rmd**: The main R Markdown file containing model fitting and visualization.
- **LR_BN_modeling.html**: The rendered version of the above `.Rmd`.
- **Figures below** summarize the key outputs.

---
## 🧠 Bayesian Network (BN) Structures
### Averaged BN-B Structure
![Averaged BN-B Structure](../images/bn_b_avg.svg)

### Averaged BN-WB Structure
![Averaged BN-WB Structure](../images/bn_wb_avg.svg)

*(Note: These show averaged directed acyclic graphs (DAGs) learned via bootstrapped structure averaging.)*


---
<h2>📊 Logistic Regression (LR) Results</h2>
<p>Below is the summary output from the logistic regression model:</p>

<table>
  <thead>
    <tr>
      <th>Variable</th><th style="text-align:right">Estimate</th>
      <th style="text-align:right">Std. Error</th>
      <th style="text-align:right">z value</th>
      <th style="text-align:right">Pr(&gt;|z|)</th><th>Sig</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>(Intercept)</td><td style="text-align:right">-0.17200</td><td style="text-align:right">0.20386</td><td style="text-align:right">-0.844</td><td style="text-align:right">0.398843</td><td>—</td></tr>
    <tr><td>age60s</td><td style="text-align:right">0.55542</td><td style="text-align:right">0.08238</td><td style="text-align:right">6.742</td><td style="text-align:right">1.56e-11</td><td>***</td></tr>
    <tr><td>age70+</td><td style="text-align:right">1.04219</td><td style="text-align:right">0.11260</td><td style="text-align:right">9.255</td><td style="text-align:right">&lt;2e-16</td><td>***</td></tr>
    <tr><td>sexMale</td><td style="text-align:right">0.88034</td><td style="text-align:right">0.11236</td><td style="text-align:right">7.835</td><td style="text-align:right">4.69e-15</td><td>***</td></tr>
    <tr><td>IncomeLow</td><td style="text-align:right">0.25949</td><td style="text-align:right">0.07818</td><td style="text-align:right">3.319</td><td style="text-align:right">0.000903</td><td>***</td></tr>
    <tr><td>OccupationRiskNon-at-risk</td><td style="text-align:right">-0.11418</td><td style="text-align:right">0.08634</td><td style="text-align:right">-1.322</td><td style="text-align:right">0.186022</td><td>—</td></tr>
    <tr><td>AsthmaYes</td><td style="text-align:right">1.79506</td><td style="text-align:right">0.48329</td><td style="text-align:right">3.714</td><td style="text-align:right">0.000204</td><td>***</td></tr>
    <tr><td>smokingFormer Smoker</td><td style="text-align:right">-0.53007</td><td style="text-align:right">0.10587</td><td style="text-align:right">-5.007</td><td style="text-align:right">5.53e-07</td><td>***</td></tr>
    <tr><td>smokingNon-smoker</td><td style="text-align:right">-0.85861</td><td style="text-align:right">0.12816</td><td style="text-align:right">-6.699</td><td style="text-align:right">2.09e-11</td><td>***</td></tr>
    <tr><td>Packyearslow</td><td style="text-align:right">-0.19741</td><td style="text-align:right">0.13538</td><td style="text-align:right">-1.458</td><td style="text-align:right">0.144804</td><td>—</td></tr>
    <tr><td>BMI_GroupObese</td><td style="text-align:right">-0.30816</td><td style="text-align:right">0.07177</td><td style="text-align:right">-4.294</td><td style="text-align:right">1.76e-05</td><td>***</td></tr>
    <tr><td>PM25_Grouplow</td><td style="text-align:right">0.27597</td><td style="text-align:right">0.07168</td><td style="text-align:right">3.850</td><td style="text-align:right">0.000118</td><td>***</td></tr>
  </tbody>
</table>

<ul>
  <li>Null deviance: 5391.3 on 3888 degrees of freedom</li>
  <li>Residual deviance: 4756.2 on 3877 degrees of freedom</li>
  <li><strong>AIC:</strong> 4780.2</li>
  <li>Fisher scoring iterations: 4</li>
</ul>

---

## ⚠️ Note
The R Markdown and HTML are provided **for reference only**.  
Due to dependency and data access restrictions, this analysis **cannot be reproduced directly** without the original dataset and project environment.
