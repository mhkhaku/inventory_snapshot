## Project Description – Inventory Snapshot Dashboard

### Objective:
#### Developed an interactive Tableau dashboard to monitor and analyze inventory performance, providing stakeholders with real-time insights into stock levels, valuation, and warehouse distribution.

### Data Sources & Preparation:

- Used synthetic inventory and item master data (generated for demonstration purposes) to replicate a real-world supply chain scenario.
- Built a consolidated SQL table (INVENTORY) by joining inventory_snapshot and item_master.
- Performed data transformations including currency conversion (CAD to USD), cost/valuation calculations, and derived metrics (e.g., available % stock, inventory value per item).
- Ensured data accuracy by applying rounding, standardized units, and consistent snapshot reporting dates.

### Dashboard Features (as built):

- KPI Summary Cards: On Hand Quantity & Value, Allocated Quantity & Value, Available Quantity & Value, and Ordered Quantity & Value.
- Stock Availability by Brand & Category: Bar chart showing available quantities broken down by product brand and category.
- Stock Availability by Warehouse: Donut chart comparing available stock between warehouse locations (e.g., VAN vs. TOR).
- Interactive Filters: Users can slice data by warehouse, brand, item ID, item category, or reporting date.
