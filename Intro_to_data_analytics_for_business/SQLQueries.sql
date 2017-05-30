-- Query to find the distribution of services used by customers in different regions. It is interesting because this info could lead to changes in service offerings in some regions if any of the services are found to be severely underused in those regions, and more business can be generated as the result.

SELECT r.reg_name
     , p.service_id
     , COUNT(p.purch_id) as cnt
FROM Customers c
LEFT JOIN Purchases p
ON c.cust_id = p.cust_id
LEFT JOIN Regions r
ON c.region_id = r.region_id
GROUP BY r.reg_name, p.service_id
ORDER BY cnt;




-- Query to find out year-to-date revenue by customer for service #2. It is interesting because this info can be used for a targeted marketing campaign to generate more business from the customers currently under-using service #2.

SELECT t.cust_id
     , SUM(t.amount) as revenue
FROM Transactions t
LEFT JOIN Purchases p
ON t.purch_id = p.purch_id
WHERE p.purch_date BETWEEN ‘2017-01-01’ AND DATE.NOW()
  AND p.service_id = 2
GROUP BY t.cust_id
ORDER BY revenue;
