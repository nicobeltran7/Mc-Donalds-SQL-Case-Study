# McDonald's EU Division — SQL Case Study 🍔

## The Challenge

Imagine you're the newly hired Data Analyst for McDonald's European Division. On your first day, you receive three messy CSV files containing months of transactional data—sales records, store information, and theft reports scattered across dozens of EU locations. 

Finance needs revenue insights. Compliance is concerned about theft patterns. Marketing wants to understand customer behavior. And everyone needs answers *yesterday*.

Your mission? Clean the chaos, extract actionable insights, and deliver results that drive real business decisions.

---

## 📊 The Data

This case study works with three interconnected datasets:

- **`Sales.csv`** — Line-item transactions: dates, products, prices, quantities, payment methods, store IDs
- **`Store.csv`** — Store master data: city, country/region, manager details, operational info  
- **`Theft.csv`** — Incident reports: theft amounts, dates, affected stores and managers

> **Note:** All data is synthetically generated for educational purposes. No actual McDonald's data was used.

---

## 🎯 Business Questions Answered

### 💰 Finance Team
*"Show me the money—and where it's going."*

1. What are our minimum and maximum product prices?
2. What's the average price point for each product?
3. What's our total revenue across all stores?
4. How many units have we sold?
5. What's our bottom-line profit after costs?

### 🔒 Compliance Team
*"We need to identify and address theft patterns immediately."*

1. How much theft has occurred under each manager's watch?
2. Which managers have experienced more than 10 theft incidents? (Include their demographics, tenure, and location for pattern analysis)

### 📈 Marketing Team
*"Help us understand our customers and optimize our strategy."*

1. Which country is driving the most unit sales?
2. How are customers paying? (Payment method breakdown)
3. Where are they ordering from? (In-store vs. Drive-thru vs. Online)
4. Which products are our star performers? (Ranked by volume)

---

## 🔍 Key Insights

### Financial Performance
- **Total Revenue:** **$8,031,166**  
- **Total Cost:** **$1,382,379**  
- **Total Profit:** **$5,707,702** (71% profit margin 🎉)
- **Units Sold:** **1,382,379** items
- **Price Range:** **$2.95 – $12.99**

### Market Intelligence
- **Top Market:** Spain leads with **154,922 units** (**11.21%** of total volume)
- **Best-Seller:** Fries dominate with **561,951 units sold** (the people have spoken!)

### Customer Behavior
**Payment Preferences:**
- Credit Card: **80.0%** (digital-first customers)
- Cash: **17.3%** (still relevant)
- Gift Card: **2.7%** (growth opportunity?)

**Purchase Channels:**
- In-Store: **48.6%** (traditional dining experience)
- Drive-Thru: **46.3%** (convenience is king)
- Online: **5.1%** (emerging channel to watch)

> 💡 **Insight:** Nearly half of all transactions happen through drive-thru, suggesting customers value speed and convenience. Online ordering, while small, represents a significant growth opportunity.

---

## 📁 Repository Structure

```
Mc-Donalds-SQL-Case-Study/
│
├── data/                                    # Raw data files
│   ├── Sales.csv
│   ├── Store.csv
│   └── Theft.csv
│
├── queries/                                 # SQL scripts (numbered execution order)
│   ├── .gitkeep
│   ├── AVG.sql                             # Average price calculations
│   ├── Altering table to split columns.sql # Data cleaning operations
│   ├── Check duplicate values.sql          # Data quality checks
│   ├── Compliance analysis.sql             # Theft and manager analysis
│   ├── Delete duplicates.sql               # Duplicate removal
│   ├── Exercises.sql                       # Practice queries
│   ├── Fix typos.sql                       # Data standardization
│   ├── Fixing column Header typo.sql       # Column name corrections
│   ├── MAX MIN.sql                         # Price range analysis
│   ├── Payment by ratio.sql                # Payment method distribution
│   ├── Products DESC.sql                   # Product ranking
│   ├── Purchase by ratio.sql               # Purchase channel analysis
│   ├── Splitting columns.sql               # Column parsing
│   ├── TotalCost.sql                       # Cost calculations
│   ├── TotalProfit.sql                     # Profit calculations
│   ├── TotalRevenue.sql                    # Revenue calculations
│   ├── deleting columns.sql                # Schema cleanup
│   └── populating splitted columns.sql     # Derived column population
│
├── results/                                 # Query outputs (CSV exports)
│   ├── .gitkeep
│   ├── AVG.csv
│   ├── Compliance Analysis.csv             # Managers with theft > 10 incidents
│   ├── Country Quantity Sold.csv
│   ├── Max & Min Price.csv
│   ├── Payment by Ratio.csv
│   ├── Products Desc.csv
│   ├── Purchase by Ratio.csv
│   ├── Total Costs.csv
│   ├── Total Profit.csv
│   └── Total Revenue.csv
│
└── README.md                                # You are here!
```

---

## 🛠️ SQL Techniques Demonstrated

### Data Cleaning & Preparation
- **Column standardization:** Trimming whitespace, fixing typos, renaming headers
- **Type casting:** Converting string dates to proper DATE types, ensuring numeric fields
- **Duplicate detection & removal:** Using window functions and CTEs to identify and eliminate duplicates
- **Schema restructuring:** Splitting combined columns, dropping unnecessary fields

### Analysis & Aggregation
- **Core aggregations:** `SUM`, `AVG`, `MIN`, `MAX` for KPI calculations
- **Window functions:** Rankings and running totals where supported
- **Ratio calculations:** Using `SUM(CASE WHEN ...) / SUM(...)` for clean percentage breakdowns
- **Multi-table joins:** Connecting sales, store, and theft data for comprehensive analysis

### Business Logic Implementation
- **Revenue:** `SUM(price × quantity)`
- **Cost:** `SUM(cost_per_unit × quantity)`  
- **Profit:** `Revenue - Cost`
- **Mix analysis:** Category proportions with two decimal precision

### Best Practices
- **One query = one business question** (easy to understand and maintain)
- **Reusable CTEs/views** to avoid repeating logic
- **Clear naming conventions** for queries and outputs
- **CSV-ready result sets** for immediate stakeholder consumption

---

## 🚀 How to Use This Project

1. **Clone the repository**
   ```bash
   git clone https://github.com/nicobeltran7/Mc-Donalds-SQL-Case-Study.git
   cd Mc-Donalds-SQL-Case-Study
   ```

2. **Load the data**
   - Import the three CSV files from `/data/` into your SQL database
   - Recommended: SQLite for quick local setup, or PostgreSQL/MySQL for production-like environment

3. **Run the queries**
   - Execute scripts in `/queries/` in order (start with cleaning scripts)
   - Each query is self-contained and documented
   - Results will match those in `/results/` folder

4. **Explore and extend**
   - Modify queries to answer your own business questions
   - Add new analyses based on different dimensions
   - Practice different SQL techniques and optimizations

---

## 💡 Next Steps & Extensions

### 📊 Build a Dashboard
Transform these insights into an executive dashboard:
- **Tool:** Power BI, Tableau, or Looker
- **Key visuals:** 
  - KPI cards for Revenue, Profit, and Units Sold
  - Time-series trend for daily/weekly performance
  - Geographic heat map of sales by country
  - Product mix treemap
- **Interactivity:** Date range selector, country filter, payment type slicer

### 🔍 Advanced Analytics
Take the analysis deeper:
- **Anomaly detection:** Implement z-score or IQR methods to flag unusual revenue or theft patterns
- **Cohort analysis:** Track customer behavior over time
- **Basket analysis:** Which products are frequently purchased together?
- **Forecasting:** Predict next quarter's sales using historical trends

### ⚡ Performance Optimization
Scale for production workloads:
- **Indexing strategy:** Add indexes on `store_id`, `sale_date`, and other frequently filtered columns
- **Partitioning:** Split large tables by date range for faster queries
- **Materialized views:** Pre-compute expensive aggregations
- **Query optimization:** Analyze execution plans and eliminate bottlenecks

### 🧪 Data Quality Framework
Ensure data reliability:
- **Automated checks:** Null counts, duplicate detection, value range validation
- **Scheduled monitoring:** Daily data quality reports
- **Alert system:** Notify stakeholders when anomalies are detected
- **Documentation:** Maintain a data dictionary with business definitions

### 📚 Documentation Enhancement
Make this project portfolio-ready:
- **Data Dictionary:** Document every field, its meaning, and data type
- **KPI Glossary:** Define exactly how each metric is calculated
- **Process Flow Diagram:** Visualize the ETL and analysis pipeline
- **Screenshots:** Include sample outputs and (if built) dashboard previews

---

## 🎓 Skills Demonstrated

This project showcases:
- ✅ **Data Cleaning:** Handling messy real-world data with SQL
- ✅ **SQL Proficiency:** Complex queries, joins, aggregations, window functions
- ✅ **Business Acumen:** Translating stakeholder questions into actionable analysis
- ✅ **Problem-Solving:** Working through data quality issues systematically
- ✅ **Documentation:** Clear, professional README and query organization
- ✅ **Attention to Detail:** Accurate calculations with proper business context

---
