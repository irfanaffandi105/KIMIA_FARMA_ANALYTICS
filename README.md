# 🏥 Kimia Farma Big Data Analytics Virtual Internship Project

![Kimia_Farma_logo svg](https://github.com/user-attachments/assets/5c27d3ed-a173-4894-aa6b-a8b71c0927e6)


## 📊 Project Overview
This repository contains my work for the Kimia Farma Big Data Analytics Virtual Internship Program in collaboration with Rakamin Academy. The project focuses on analyzing business performance across multiple dimensions, identifying key insights, and providing strategic recommendations to improve Kimia Farma's operations and profitability.

## 🔍 Background
Kimia Farma is one of Indonesia's largest pharmaceutical companies with branches across the country. This analysis examines their business performance from 2020-2023, focusing on revenue trends, geographical distribution of sales, branch performance ratings, and profitability metrics.

## 🛠️ Tools Used
- SQL for data processing and analysis 💾
- Tableau for data visualization and dashboard creation 📊
- Python for advanced data analysis 🐍
- Git & GitHub for version control and project documentation 📚

## 📁 Dataset
The analysis utilizes Kimia Farma's business performance data from 2020-2023, covering:
- Annual revenue figures 💰
- Transaction volumes by province 🔄
- Net sales by province 💲
- Branch performance ratings ⭐
- Profit distribution by branch type and province 📊

**Dataset Link:** [Kimia Farma Dataset](https://drive.google.com/file/d/1myCVFXsqI1HbWLRneLHpKJwKwxFLTGZ1/view?usp=sharing)

## 🧩 SQL Syntax Overview

### ✅ Key SQL Concepts Used

- `WITH` clause (CTE)
- `JOIN` across multiple tables
- `CASE` statements for logic branching
- `ROUND()` for numeric formatting

### 🔍 Sample Query

```sql
CREATE OR REPLACE TABLE `rakamin-kf-analytics-459814.kimia_farma.analysis_table` AS

WITH transaksi_dengan_margin AS (
  SELECT 
    t.transaction_id,
    t.date,
    c.branch_id,
    c.branch_name,
    c.kota,
    c.provinsi,
    c.rating AS rating_cabang,
    t.customer_name,
    p.product_id,
    p.product_name,
    t.price AS actual_price,
    t.discount_percentage,
    (t.price - (t.price * t.discount_percentage / 100)) AS nett_sales,

    CASE 
        WHEN t.price <= 50000 THEN 0.10
        WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
        WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
        WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
        ELSE 0.30
    END AS persentase_gross_laba,

    t.rating AS rating_transaksi

  FROM `rakamin-kf-analytics-459814.kimia_farma.kf_final_transaction` t
  JOIN `rakamin-kf-analytics-459814.kimia_farma.kf_kantor_cabang` c 
    ON t.branch_id = c.branch_id
  JOIN `rakamin-kf-analytics-459814.kimia_farma.kf_product` p 
    ON t.product_id = p.product_id
)

SELECT *,
       ROUND(nett_sales * persentase_gross_laba, 2) AS nett_profit
FROM transaksi_dengan_margin;
```

## 🚀 Business Recommendations
1. **🌐 Geographic Diversification Strategy**
   - Develop Sumatra Utara and Jawa Tengah as secondary anchor provinces 🏢
   - Create targeted expansion plans for eastern Indonesia 🗺️
   - Reduce business risk by decreasing dependence on Jawa Barat ⚖️

2. **⭐ Branch Excellence Program**
   - Standardize best practices from top-rated branches 📋
   - Implement structured improvement system for branches with ratings below 4.30 📈
   - Create mentorship program pairing high-rating branches with lower-performing ones 🤝

3. **📊 Data-Driven Performance Framework**
   - Establish quarterly business reviews using dashboard metrics 📆
   - Develop predictive analytics for regional performance forecasting 🔮
   - Create branch-specific improvement plans based on data insights 📝

## 📊 Interactive Dashboard
The interactive dashboard provides comprehensive visualization of Kimia Farma's business performance metrics. It includes:
- Annual revenue trends 📈
- Top performing branches by rating ⭐
- Provincial transaction and sales distribution 🗺️
- Geographic profit distribution 💰
- Branch rating and profit correlation analysis 📊

**Dashboard Link:** [Kimia Farma Business Performance Dashboard](https://lookerstudio.google.com/reporting/7f738ab9-a8c9-40b8-96bc-bd6e7d9e88cb))

## 🎯 Project Outcomes
The analysis provides Kimia Farma with actionable insights to:
- Stabilize revenue fluctuations 📈
- Reduce geographic concentration risk 🗺️
- Transform branch ratings into consistent profit drivers ⭐
- Create a more resilient business model for sustainable growth 🌱

## 🎓 About the Virtual Internship
This project was completed as part of the Kimia Farma Big Data Analytics Virtual Internship Program in partnership with Rakamin Academy. The program provides real-world data analytics experience using actual company data and business scenarios.

**Program Link:** [Kimia Farma Big Data Analytics Virtual Internship Program](https://www.rakamin.com/virtual-internship-experience/kimiafarma-big-data-analytics-virtual-internship-program)

## 📬 Contact Information
For any questions regarding this project, please feel free to connect with me:
- 📧 Email: irfanaffandi151@google.com
- 🔗 LinkedIn: [Mohammad Dwi Irfan Affandi](https://www.linkedin.com/in/mohammaddwi)

---
✨ © 2025 | Kimia Farma Big Data Analytics Virtual Internship Project | Rakamin Academy ✨
