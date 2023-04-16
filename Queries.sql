#1.) How many staff do we have in the company? 
SELECT COUNT(DISTINCT MatriculeNo) AS StaffNumber
FROM stafftable;

#2.) How many staff are younger than 30 year
SELECT COUNT(MatriculeNo) AS StaffNumber
FROM stafftable
WHERE age<30;

#3.) How many staff are between 30 and 25 years?
SELECT COUNT(MatriculeNo) AS StaffNumber
FROM stafftable
WHERE age>25 AND age<30;

#4.) Select all the female staff and sort their age in descending order (from the oldest to the youngest)
SELECT *
FROM stafftable
WHERE StaffSex = "Female"
ORDER BY age DESC;

#5.) What is the Average age of Peter and Nina?
SELECT AVG(age) AS AverageAge
FROM stafftable
WHERE StaffName="Nina" OR StaffName = "Peter";

#1.) How many customers do we have?
SELECT COUNT(CustomerCode) AS CustomerCount
FROM customertable;

#2.) How many customers are from Cameroon?
SELECT COUNT(CustomerCode) AS CustomerCountCameroon
FROM customertable
WHERE CustomerCountry = "Cameroon";

#3.) How many customers are from Cameroon and are Males?
SELECT COUNT(CustomerCode) AS CustomerCountCameroonMale
FROM customertable
WHERE CustomerCountry = "Cameroon" AND CustomerSex = "Male";

#4.) What are the First names and Last names of customers who come from Togo and USA?
SELECT CustomerFirstName, CustomerLastName
FROM customertable
WHERE CustomerCountry IN ("Togo","USA");

#5.) Show the first 5 oldest customers and arrange the list in decreasing order of Age (Oldest to youngest)
SELECT CustomerFirstName, CustomerLastName,Age
FROM customertable
ORDER BY Age DESC
LIMIT 5;

#6.) What is the average age of customers per country?
SELECT CustomerCountry,ROUND(AVG(Age),2) AS AverageAge
FROM customertable
GROUP BY CustomerCountry
ORDER BY CustomerCountry;

#1.) What is the total profit we made?
SELECT SUM(Profit) AS TotalProfit
FROM salestable;

#2.) What is the total cost we incurred for these 03 countries "Cameroon","USA","Togo"?
SELECT CustomerCountry,SUM(Cost) AS TotalCostIncurred
FROM salestable s
JOIN customertable c
ON s.Customercode = c.CustomerCode
WHERE CustomerCountry IN ("Cameroon","USA","Togo")
GROUP BY CustomerCountry;

#3.) What is the total profit we made per country?
SELECT CustomerCountry,SUM(Profit) AS TotalProfit
FROM salestable s
JOIN customertable c
ON s.Customercode = c.CustomerCode
GROUP BY CustomerCountry
ORDER BY CustomerCountry;

#4.) What is the average profit we made per country?
SELECT CustomerCountry,ROUND(AVG(Profit),2) AS AverageCountry
FROM salestable s
JOIN customertable c
ON s.Customercode = c.CustomerCode
GROUP BY CustomerCountry
ORDER BY CustomerCountry;

#5.) What is the total revenue per Staff?
SELECT StaffName,SUM(Revenue) AS TotalRevenue
FROM salestable sa
JOIN stafftable st
ON sa.StaffCode = st.MatriculeNo
GROUP BY StaffName
ORDER BY StaffName;

#6.) Which countries made more than 100 sales transactions? Sort them in decreasing order (from biggest to smallest)
SELECT CustomerCountry,COUNT(StaffCode) AS Sales
FROM salestable s
JOIN customertable c
ON s.Customercode = c.CustomerCode
GROUP BY CustomerCountry
HAVING Sales >100
ORDER BY Sales DESC;

#7.) What is the total profit made per country by the following staff "Emelda","Anita","Cynthia"?
SELECT StaffName,CustomerCountry,SUM(Profit) AS TotalProfit
FROM salestable s
LEFT JOIN customertable c
ON s.Customercode = c.CustomerCode
LEFT JOIN stafftable st
ON s.StaffCode = st.MatriculeNo
WHERE StaffName IN ("Emelda","Anita","Cynthia")
GROUP BY StaffName,CustomerCountry
ORDER BY CustomerCountry;
