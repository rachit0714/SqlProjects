-- tables are customers, date, markets, products and transactions
SELECT * FROM sales.transactions where market_code = 'Mark001';
SELECT * FROM sales.markets where markets_code = 'Mark001';

-- Number of transactions in each currency
SELECT DISTINCT(currency), COUNT(currency) as total
FROM sales.transactions
WHERE market_code = 'Mark001'
GROUP BY currency;

-- Transactions with total value divided by currency
SELECT SUM(sales_qty) as sales, SUM(sales_amount) as amount, currency
FROM sales.transactions
WHERE market_code = 'Mark001'
GROUP BY currency;

-- Getting all transactions from 2020
SELECT sales.transactions.*, sales.date.*
FROM sales.transactions
INNER JOIN sales.date ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year=2020;

-- Get the net sales each year
SELECT year, sum(sales_amount) as sales
FROM transactions
INNER JOIN date ON order_date = date
GROUP BY year;

-- Orders locations by most transactions and lists the total sale amount
SELECT markets.markets_name as market, COUNT(transactions.market_code) as total_transactions, SUM(transactions.sales_amount) as total_sales
FROM transactions
INNER JOIN markets ON markets.markets_code = transactions.market_code
INNER JOIN date ON transactions.order_date = date.date
GROUP BY markets.markets_code
ORDER BY  total_transactions;

-- Orders locations by most transactions and year while listing the total sale amount with an average sales column
SELECT date.year as year, markets.markets_name as market, market_code, COUNT(transactions.market_code) as total_transactions, SUM(transactions.sales_amount) as total_sales,  SUM(transactions.sales_amount) / COUNT(transactions.market_code) as avg_amount_per_sale
FROM transactions
INNER JOIN markets ON markets.markets_code = transactions.market_code
INNER JOIN date ON transactions.order_date = date.date
GROUP BY year, markets.markets_code
ORDER BY year, total_transactions;

-- Total sales each month
SELECT date.year, date.month_name as month, SUM(transactions.sales_amount) / 1000000 as "sales in millions"
FROM transactions
INNER JOIN date ON transactions.order_date = date.date
GROUP BY cy_date, year, month
ORDER BY cy_date;

-- Get total sales each year divided by what market they belonged to
SELECT year, market_code, SUM(sales_amount) / 1000000 as "Sales (in millions)"
FROM transactions
INNER JOIN date ON transactions.order_date = date.date
GROUP BY year, market_code
ORDER BY year, market_code;
