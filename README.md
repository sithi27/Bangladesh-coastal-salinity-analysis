<div align="center">

# 🌊 Bangladesh Coastal Salinity Analysis

### Real-data analysis of coastal salinity intrusion across Bagerhat, Khulna & Satkhira

<br>

![Python](https://img.shields.io/badge/Python-3.11-3776AB?style=for-the-badge&logo=python&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Excel](https://img.shields.io/badge/Excel-Data-217346?style=for-the-badge&logo=microsoftexcel&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

<br>

![SDG 6](https://img.shields.io/badge/SDG%206-Clean%20Water%20%26%20Sanitation-0077B6?style=flat-square)
![SDG 13](https://img.shields.io/badge/SDG%2013-Climate%20Action-3F7E44?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)

<br>

> *Coastal salinity intrusion threatens the drinking water, agriculture, and health of millions in southwestern Bangladesh. This project uses real government and FAO data to analyze where, when, and how severely salinity affects the region — contributing to SDG 6 and SDG 13.*

</div>

---

## 📌 Project Overview

This project analyzes salinity levels across **61 monitoring stations** in **Bagerhat**, **Khulna**, and **Satkhira** districts using real data from the **Bangladesh Water Development Board (BWDB)** and the **Food and Agriculture Organization (FAO)**. The analysis covers historical EC (Electrical Conductivity) measurements from 1976 to 1980, examining seasonal patterns, tidal effects (HWS vs LWS), and district-level comparisons.

---

## 🎯 SDG Relevance

| SDG Goal | Target | Contribution |
|----------|--------|--------------|
| **SDG 6** — Clean Water & Sanitation | 6.3, 6.6 | Identifying saline-contaminated water sources |
| **SDG 13** — Climate Action | 13.1 | Documenting salinity as a climate-driven hazard |
| **SDG 3** — Good Health | 3.9 | Linking high salinity to public health risks |
| **SDG 2** — Zero Hunger | 2.4 | Understanding agricultural water quality threats |

---

## 📊 Key Findings

| District | Annual Mean EC | Peak Month | Peak EC | Level |
|----------|---------------|------------|---------|-------|
| **Satkhira** | 11,406 M/Mhos | May | 27,034 M/Mhos | 🔴 Extremely High |
| **Bagerhat** | 2,847 M/Mhos | April | 8,162 M/Mhos | 🟠 Moderately High |
| **Khulna** | 859 M/Mhos | April | 3,138 M/Mhos | 🟡 Moderate |

> **EC Scale:** Fresh water <200 · Slightly saline 200–2,000 · Highly saline >10,000 M/Mhos

**Seasonal insight:** Salinity peaks in **April–May** (dry season) and drops to its lowest in **July–August** (monsoon). HWS consistently shows higher salinity than LWS, confirming strong tidal influence.

---

## 📁 Project Structure

```
bangladesh-coastal-salinity-analysis/
│
├── data/
│   ├── salinity_data.csv                # BWDB — 61 station metadata
│   └── salinity_measurements.csv        # FAO — EC values (1976–1980)
│
├── sql/
│   ├── sql_salinity_1.sql               # Station analysis queries
│   └── sql_salinity_2.sql               # Measurement table + JOIN queries
│
├── python/
│   ├── python_1.py                      # Station metadata analysis + charts
│   └── python_2.py                      # Salinity measurement analysis + charts
│
├── dashboard/
│   └── salinity_dashboard.pbix          # Power BI interactive dashboard
│
├── outputs/
│   └── salinity_analysis.png            # Python chart output
│
└── README.md
```

---

## 
🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| **MySQL 8.0** | Database storage, station & measurement queries |
| **Python 3.11** | Pandas analysis + Matplotlib charts |
| **Microsoft Excel** | 2-sheet raw data workbook |
| **Power BI** | Interactive dashboard with map + slicer filters |

---

## 📂 Data Sources

| Source | Description |
|--------|-------------|
| **FAO Report AC352E** | EC salinity measurements 1976–1980 — [View Source](https://www.fao.org/4/ac352e/AC352E04.htm) |
| **BWDB** | 61 active monitoring station records — Bangladesh Water Development Board |

> ⚠️ Historical data (1976–1980) is used due to limited public availability of recent BWDB time-series data — a known challenge in Bangladesh's environmental monitoring sector.

---

## 🚀 How to Run

### 1. Install dependencies
```bash
pip install pandas matplotlib pymysql python-dotenv openpyxl
```

### 2. Create `.env` file
```
DB_HOST=127.0.0.1
DB_USER=your_username
DB_PASSWORD=your_password
DB_NAME=salinity_health_db
```

### 3. Set up database
```bash
# Run in MySQL Workbench
source sql/sql_salinity_1.sql
source sql/sql_salinity_2.sql
```

### 4. Run Python scripts
```bash
python python/python_1.py
python python/python_2.py
```

### 5. Open Power BI dashboard
Open `dashboard/salinity_dashboard.pbix` in Power BI Desktop.

---

## 🌍 Why This Matters

Over **35 million people** in coastal Bangladesh depend on surface water increasingly affected by salinity. The IPCC projects a **+0.5m sea level rise by 2050** in Bangladesh, which will push saline water further inland — worsening drinking water access, crop failure, and health outcomes including pregnancy-related hypertension.

This project contributes an open, data-driven foundation for evidence-based water resource policy.

---

## 👤 Author

<div align="center">

**Faria Afrin Sithi**
3rd Year Student Computer Science & Technology | Barishal Polytechnic Institute, Bangladesh

[![Email](https://img.shields.io/badge/Email-fariaafrinsithi%40gmail.com-D14836?style=flat-square&logo=gmail&logoColor=white)](mailto:fariaafrinsithi@gmail.com)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Faria%20Afrin%20Sithi-0077B5?style=flat-square&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/faria-afrin-sithi)

</div>

---



<div align="center">

*"Water is life. Bangladesh's coastal communities deserve clean water — data is the first step toward that goal."*


</div>
