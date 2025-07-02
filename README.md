🛒 E-commerce Sales Analysis Project

📊 Tools Used
- MySQL– Data extraction and joining
- Python (Pandas) – Data cleaning, transformation, KPI calculations
- Power BI – Interactive dashboard and visualization



📁 Project Overview
This project simulates an e-commerce business analysis scenario by using structured order, product, and customer datasets to uncover key business insights. The analysis pipeline covers:
- Data cleaning and exploration using SQL & Python
- KPI calculation and pattern recognition
- Dashboard development in Power BI



✅ Key Objectives
- Analyze sales trends, top products and customer behavior
- Visualize performance using dynamic Power BI reports
- Calculate KPIs such as:
  - Total Revenue
  - Average Order Value (AOV)
  - Total Orders
  - Top-Selling Categories & Products



 🧮 Data Summary
The dataset includes:
- Customers
- Orders
- Order Items
- Products

➡️ Total Records: ~500–1000 rows (custom-generated for simulation)


🛠️ Step-by-Step Workflow

🔹 1. SQL (MySQL Workbench)
- Created relational tables: `customers`, `orders`, `order_items`, `products`
- Wrote SQL queries to:
  - Join tables
  - Filter date-wise and category-wise orders
  - Group by regions/products
  - Calculate basic KPIs

🔹 2. Python (Pandas)
- Imported SQL results via `.csv`
- Cleaned and prepared data
- Performed exploratory analysis:
  - Monthly revenue trends
  - Top categories by revenue
  - AOV and order counts

🔹 3. Power BI
- Built an interactive dashboard with:
  - 📈 Line chart for revenue over time
  - 🥇 Bar chart for top 5 products
  - 📦 Donut chart for sales by category
  - 🌍 Region-wise map
  - 🔎 Filters for Category, Date, Region

🎨 Applied clean design with slicers and color-coded visual cues


📸 Dashboard Preview
![Power BI Dashboard Preview](powerbi/ecommerce_dashboard.png)



📂 Folder Structure

ecommerce-sales-analysis/
├── sql/
│   └── ecommerce_queries.sql
├── python/
│   └── analysis.ipynb
├── powerbi/
│   └── ecommerce_dashboard.pbix
├── README.md


📌 Conclusion
This project demonstrates the full data analysis pipeline:
From SQL → Python → Power BI 
All aimed at turning raw e-commerce data into clear, actionable insights.


🧠 Skills Practiced
- SQL joins, filtering, and grouping
- Pandas data wrangling
- Power BI dashboarding
- Business KPI extraction
