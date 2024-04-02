# Sales Insights Data Analysis

Sales data was taken from codebasis data analysis video

# Power BI Dashboard
1. The data was first cleaned of invalid data where sales value was less that or equal to 0.
`Table.SelectRows(sales_transactions, each ([sales_amount] <> -1 and [sales_amount] <> 0))`
1. There was also an error where each currency were added twice from a new line error, these appeared to be repeated entries so the extra ones got removed.
`Table.SelectRows(#"Filter Out -1/0 in Sales Amount", each ([currency] = "INR#(cr)" or [currency] = "USD#(cr)"))`
1. A normalized currency column was then added
`Table.AddColumn(#"Filtered Out INR and USD", "normalized_sales_amount", each if ([currency] = "USD" or [currency] = "USD#(cr)" ) then [sales_amount]*83 else [sales_amount])`

# Visualizations
1. Two bar charts that show revenue and Sales quantity by region
1. Slicers for year and month have been added
1. Top 5 customers and products have also been listed
