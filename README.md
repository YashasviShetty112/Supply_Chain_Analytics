# Supply_Chain_Analytics
Business Context:
The following project is aimed at analysing the common issue faced in most retail companies which is holding too  much dead stock that reduces cash inflow and loss of customers due to shipping delays of popular items.

## The Data used here is DataCo Smart Supply Chian Dataset which contains all order details.

## Pandas in Python (Supply_Chain_1.ipynb)
The library used for cleaning the data before loading it in sql and powerbi is pandas.
Using pandas a dataframe is created which is quite simple to work with.
Keeping all the necessary columns dropping the redundant ones ensuring the file is clean with proper datetime format for the respective columns.
The cleaned data for the purpose of ABC analysis is further grouped by each product id and product name according to sales per customer sorted in descending order.
Lastly leading to segregation according to classes as items accounting for 80% of revenue are under strict control
and similarly the rest are classified accordingly.
Calculated the cumulative revenue and its percentage.
Finally both the categorizing file and the cleaned table are merged together and exported for further analysis.

## SQL (Supply_Chain.sql)
1 Query_1: Analysed which departments had the highest profit margin percent,comparing the total sales and total profit.
2 Query_2:For a particular country calculating the delay percentage and the deviation from actual shipping date(scheduled)
which enables us to find the ones with highest delays in shipment region wise.
3 Query_3: Shared percentage of revenue across each ABC class
4 Query_4: Shows which high price products are prone to high shipping delays
5 Query_5:Best selling products in each department using window function and rank.
6 Query_6:calculated monthly revenue and cumulative running total of revenue.

## Power Bi (Supply_Chain_Dashboard.pbix)
Total revenue,Total profit, profit percentage margin,late risk rate were displayed using KPI cards.
Department wise sales column chart and pie chart for the class types accounting for total revenue.
Regional logistics matrix table tracking late delivery risks.

## Insights
It is observed using the pie chart that  25.41M of total sales  which accounts for 80% of the total 
revenue are under 'A' category and hence focusing on maintaining this inventory in a large scale is crucial.
Fan Shop and Apparel Departments constitute majorly of these class 'A' products.
Overall Fanshop,Apparel and Golf departments account for majority of class A and B projects which drive the profit percentage value high.



