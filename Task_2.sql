/*************************************TASK 2********************************************/
--Using the lag function show the [Sales] value for the year end and the previous months 
    SELECT Year,Month,Sales,
    LAG(Sales,1,0) OVER (PARTITION BY Year ORDER BY Month) AS PreviousSale
    FROM SalesTable

--Using the lag function show the [Sales] value for the year end and the sales 2 months prior to the year end.

    WITH SalesWithLag AS (
        SELECT 
            Year,
            Month,
            Sales,
            LAG(Sales, 1) OVER (PARTITION BY Year ORDER BY Month) AS PreviousSale,
            LAG(Sales, 2) OVER (PARTITION BY Year ORDER BY Month) AS TwoMonthsPriorSales
        FROM SalesTable
    )
    SELECT *
    FROM SalesWithLag
    WHERE Month = 12;

