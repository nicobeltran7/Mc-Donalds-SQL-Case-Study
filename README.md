# McDonald’s — SQL Case Study (EU Division)

**Objective:** Clean messy transactional data and answer key questions from **Finance**, **Compliance**, and **Marketing** so the business can make faster, better decisions.

---

## Data

- `data/Sales.csv` – line-item sales (date, product, price, quantity, payment method, store_id)  
- `data/Store.csv` – store attributes (city, country/region, manager, etc.)  
- `data/Theft.csv` – theft reports (amount, date, store_id/manager)

> Data is synthetic for demonstration. No real McDonald’s data is used.

---

## Business Questions

### Finance
1. Min and max prices  
2. Average price per product  
3. Total revenue  
4. Total quantity sold  
5. Total profit

### Compliance
1. Theft amount by manager  
2. Managers with theft > 10, plus age/sex/tenure/city (export as CSV)

### Marketing
1. Country with most units sold  
2. Quantity mix by payment method  
3. Quantity mix by purchase type  
4. Products ranked by quantity sold (high → low)

---

## Results (highlights)

- **Total revenue:** **$8,031,166**  
- **Total cost:** **$1,382,379**  
- **Total profit:** **$5,707,702**  
- **Total units sold:** **1,382,379**  
- **Price range:** **$2.95 – $12.99**  
- **Top country by units:** **Spain** — **154,922** units (**11.21%** of total)  
- **Top product by units:** **Fries** — **561,951** units  

**Payment mix**
- Credit Card: **80.0%**  
- Cash: **17.3%**  
- Gift card: **2.7%**

**Purchase type mix**
- In-store: **48.6%**  
- Drive-thru: **46.3%**  
- Online: **5.1%**

> Detailed outputs are in `/results/` (CSV), e.g. `Total Revenue.csv`, `Total Profit.csv`, `Country Quantity Sold.csv`, `Products Desc.csv`, etc.

---

## Repository Structure


## SQL Approach & Notes

- **Staging / Cleaning**
  - Standardize column names and types (trim strings, cast dates/numerics).
  - Create helper views for **Revenue**, **Cost**, **Profit** (e.g., `price * quantity`).
  - Enforce consistent IDs and join keys across `sales`, `store`, and `theft`.

- **Metric Definitions**
  - **Total Revenue** = `SUM(price * quantity)`
  - **Total Cost**    = `SUM(cost_per_unit * quantity)` (or provided cost column)
  - **Total Profit**  = `Revenue - Cost`
  - Document KPI assumptions at the top of each query.

- **Queries by Theme**
  - **Finance:** min/max price, avg price by product, totals (revenue/quantity/profit).
  - **Marketing:** country leaderboards, product ranking, payment & purchase-type mix.
  - **Compliance:** theft amount by manager; detail view for managers over threshold.

- **Techniques**
  - Aggregations (`SUM`, `AVG`, `MIN`, `MAX`).
  - Window functions for rankings where supported (or `ORDER BY ... LIMIT` as fallback).
  - Proportion calculations via `SUM(...) / SUM(...)` for clean mix shares.
  - Reusable CTEs/views to avoid repeating business logic.

- **Reproducibility**
  - One `.sql` file **per question**, numbered in execution order.
  - Each query returns a **final result set** suitable for CSV export.
  - Keep staging logic in a dedicated `01_staging_cleaning.sql`.

---

## Next Steps

- **Decision Dashboard**
  - Build a one-page Power BI/Tableau view: KPI cards (Revenue, Profit, Units), trend, and breakdowns by Product/Store/Country.
  - Add slicers for date range, region, and payment type.

- **Data Quality & Anomalies**
  - Implement simple outlier rules (z-score/IQR) for weekly store revenue and theft amounts.
  - Create “DQ checks” queries (nulls, duplicates, impossible values like negative qty).

- **Performance & Scale**
  - If migrating to Postgres: add indexes on join keys (`store_id`, `sale_date`) and common filter columns.
  - Parameterize date ranges with variables or views for month-end refresh.

- **Documentation**
  - Add a short **Data Dictionary** and **KPI Definitions** section to the README.
  - Include 1–2 screenshots of top results and (optionally) the dashboard.

- **Packaging**
  - Add `requirements.txt` (for the SQLite/Python option) and a `.gitignore`.
  - (Optional) Add a small `scripts/run_all.py` that rebuilds results with one command.
