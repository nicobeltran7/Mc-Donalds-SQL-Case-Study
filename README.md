McDonald’s — SQL Case Study (EU Division)

Objective: Clean messy transactional data and answer key questions from Finance, Compliance, and Marketing so the business can make faster, better decisions.

Data

data/Sales.csv – line-item sales (date, product, price, quantity, payment method, store_id)

data/Store.csv – store attributes (city, country/region, manager, etc.)

data/Theft.csv – theft reports (amount, date, store_id/manager)

Business Questions
Finance

Min and max prices

Average price per product

Total revenue

Total quantity sold

Total profit

Compliance

Theft amount by manager

Managers with theft > 10, plus age/sex/tenure/city (export as CSV)

Marketing

Country with most units sold

Quantity mix by payment method

Quantity mix by purchase type

Products ranked by quantity sold (high → low)

Results (highlights)

Total revenue: $8,031,166

Total cost: $1,382,379

Total profit: $5,707,702

Total units sold: 1,382,379

Price range: $2.95 – $12.99

Top country by units: Spain — 154,922 units (11.21% of total)

Top product by units: Fries — 561,951 units

Payment mix

Credit Card: 80.0%

Cash: 17.3%

Gift card: 2.7%

Purchase type mix

In-store: 48.6%

Drive-thru: 46.3%

Online: 5.1%

Detailed outputs are in /results/ (CSV), e.g. Total Revenue.csv, Total Profit.csv, Country Quantity Sold.csv, Products Desc.csv, etc.

Repository Structure
.
├─ README.md
├─ data/
│  ├─ Sales.csv
│  ├─ Store.csv
│  └─ Theft.csv
├─ queries/
│  ├─ 01_staging_cleaning.sql
│  ├─ 02_min_max_prices.sql
│  ├─ 03_avg_price_by_product.sql
│  ├─ 04_total_revenue.sql
│  ├─ 05_total_quantity.sql
│  ├─ 06_total_profit.sql
│  ├─ 07_theft_by_manager.sql
│  ├─ 08_theft_over_10_manager_details.sql
│  ├─ 09_country_with_most_units.sql
│  ├─ 10_qty_share_by_payment_method.sql
│  ├─ 11_qty_share_by_purchase_type.sql
│  └─ 12_products_ranked_by_units.sql
└─ results/
   ├─ Total Revenue.csv
   ├─ Total Costs.csv
   ├─ Total Profit.csv
   ├─ Country Quantity Sold.csv
   ├─ Payment by Ratio.csv
   ├─ Purchase by Ratio.csv
   ├─ Products Desc.csv
   └─ (others)

How to Reproduce
Option A — MySQL (what I used)

Create a schema (e.g., mcdonalds) and import the three CSVs as tables:

sales, store, theft

Run queries/01_staging_cleaning.sql to standardize types/names and create helper views.

Execute the remaining query files in order (02_... → 12_...).

Export result grids as CSV into results/.

Tip: If your SQL client opens another default schema, run USE mcdonalds; first or fully-qualify tables (e.g., mcdonalds.sales).

Option B — SQLite (one-cell quick run)

Prefer local? Use this Python snippet from repo root to load CSVs → run queries → write CSVs:

# pip install pandas
import os, glob, sqlite3, pandas as pd
os.makedirs("db", exist_ok=True); os.makedirs("results", exist_ok=True)
conn = sqlite3.connect("db/sample.db")

for p in ["data/Sales.csv","data/Store.csv","data/Theft.csv"]:
    tbl = os.path.splitext(os.path.basename(p))[0].lower()
    pd.read_csv(p).to_sql(tbl, conn, if_exists="replace", index=False)

for q in sorted(glob.glob("queries/*.sql")):
    name = os.path.splitext(os.path.basename(q))[0]
    sql = open(q, "r", encoding="utf-8").read()
    try:
        pd.read_sql_query(sql, conn).to_csv(f"results/{name}.csv", index=False)
    except Exception:
        conn.executescript(sql); conn.commit()
conn.close()

SQL Approach & Notes

Staging/Cleaning: trim/case normalize strings, cast numeric/date fields, consistent IDs; helper views for revenue/cost/profit.

Aggregations & window functions: product rankings, country leaderboards, mix shares.

Compliance slice: threshold filter (>10) joined to manager demographics for targeted action.

Reproducibility: one query per business question; each returns a ready-to-export result.

Next Steps

Build a one-page Power BI/Tableau dashboard (KPI cards, trend, product & store breakdown).

Add anomaly checks (z-scores) to flag outlier stores or theft spikes.

Parameterize date ranges for month-end refresh.
