🌊 Bangladesh Coastal Salinity Analysis
A data analysis project examining coastal salinity intrusion across the Khulna, Bagerhat & Satkhira of Bangladesh — contributing to national and global efforts on SDG 6 (Clean Water & Sanitation) and SDG 13 (Climate Action).

This project analyzes 61 monitoring stations across the Khulna, Bagerhat & Satkhira using real data from the Bangladesh Water Development Board (BWDB) and FAO (Food and Agriculture Organization) to understand:
🔍 Where salinity is most severe
📅 Which seasons are most critical
🌊 How tidal stages (HWS/LWS) affect salinity levels
📈 Long-term patterns from historical records (1976–1980)

📁 Project Structure
Bangladesh-coastal-salinity-analysis/
│
├── data/
│   ├── salinity 2 sheets.csv        # FAO EC data (1976–1980)
│                                    # 61 BWDB station records
│
├── sql/
│   ├── sql salinity 1               # Station analysis queries
│   └── sql salinity 2               # Measurement table + JOIN queries
│
├── python/
│   ├── python 2                     # Station metadata analysis
│   └── python 1                     # Full salinity measurement analysis
│
│
├── output/
    ├── salinity_full_dashboard
│   └── salinity_analysis.png            # Python chart output
│
└── README.md

📊 Key Findings
District        Annual Mean EC      Peak Month     Peak EC (Mean)      Salinity Level 
Satkhira        11,406 M/Mhos       May            27,034 M/Mhos       🔴 Extremely High
Bagerhat        2,847 M/Mhos        April          8,162 M/Mhos        🟠 Moderately High
Khulna          859 M/Mhos          April          3,138 M/Mhos        🟡 Moderate

🛠️ Tools & Technologies
Tool                          Purpose
MySQL                         Database storage, station & measurement queries
Python(Pandas, Matplotlib)    Data analysis, statistical summaries, chartsMicrosoft 
Excel                         Raw data organization (2-sheet workbook)
Power BI                      Interactive dashboard & map visualization

📂 Data Sources
Source                      Description                                                       Access
FAO Report AC352E           Historical EC salinity data — Tables XIV, XV, XVIII               FAO Website
BWDB                        Station metadata — 61 monitoring stations                         Bangladesh Water Development Board

🌍 Why This Matters
According to the IPCC and UN Bangladesh, coastal salinity is projected to worsen significantly by 2050 due to:
Sea level rise (projected +0.5m by 2050 in Bangladesh)
Reduced Ganges dry-season flow
Increased cyclone intensity

Over 35 million people in coastal Bangladesh depend on surface water sources that are increasingly saline — affecting drinking water, crop production, and maternal health (salinity is linked to hypertension during pregnancy in the region).
This project aims to contribute a data-driven foundation for evidence-based policy on water resource management in coastal Bangladesh.

👤 Author
Faria Afrin Sithi
3rd Year Undergraduate Student
Computer Science & Technology | Barishal Polytechnic Institute
Bangladesh
📧 fariaafrinsithi@gmail.com
🔗 Faria Afrin

