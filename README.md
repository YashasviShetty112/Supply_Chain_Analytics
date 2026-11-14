# Supply_Chain_Analytics
Business Context:
The following project is aimed at analysing the common isuue faced in most retail companies which is holding too  much dead stock that reduces cash inflow and loss of customers due to shipping delays of popular items.

# The Data used here is DataCoSmart Supply Chian Dataset which contains all order details.

## Pandas in Python
The library used for claening the data before loading it in sql and powerbi is pandas.
Using pandas a dataframe is created which is quite simple to work with.
Keeping all the necessary columns droping the redundant ones ensuring the file is clean with proper datetime format for the respective columns.
The cleaned data for the purpose of ABC analysis is further grouped by each product id and product name according to sales per customer sorted in descending order.
Lastly leading to seggregation according to classes as items accounting for 80% of revenue are under strict control
and similarly the rest are classified accordingly.
Calculated the cumulative revenue and its percentage.
Finally both the categorizing file and the cleaned table are merged together and exported for further analysis.

## SQL
1 Query_1: Analysed which departments had the highest profit margin percent,comparing the total sales and total profit.
2 Query_2:For a particular country calculting the dealy percentage and the deviation from actual shipping date(scheduled)
which enables us to find the ones with highest delays in shipment region wise.
3 Query_3: Shared percentage of revenue across each ABC class
4 Query_4: Shows which high price products are prone to high shipping delays
5 Query_5:Best selling products in each department iusing window function and rank.
6 Query_6:calculated mobthly revenue and cumulative running total of revenue.

## PowerBi


