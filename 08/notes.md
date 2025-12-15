## Tesla(Medium Level) hashtag#SQL Interview Question



 





You are given a table of product launches by company by year. Write a query to count the net difference between the number of products companies launched in 2020 with the number of products companies launched in the previous year. Output the name of the companies and a net difference of net products released for 2020 compared to the previous year.



 

### 𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭:

CREATE TABLE car\_launches(year int, company\_name varchar(15), product\_name varchar(30));



INSERT INTO car\_launches VALUES(2019,'Toyota','Avalon'),(2019,'Toyota','Camry'),(2020,'Toyota','Corolla'),(2019,'Honda','Accord'),(2019,'Honda','Passport'),(2019,'Honda','CR-V'),(2020,'Honda','Pilot'),(2019,'Honda','Civic'),(2020,'Chevrolet','Trailblazer'),(2020,'Chevrolet','Trax'),(2019,'Chevrolet','Traverse'),(2020,'Chevrolet','Blazer'),(2019,'Ford','Figo'),(2020,'Ford','Aspire'),(2019,'Ford','Endeavour'),(2020,'Jeep','Wrangler')

------------

&nbsp; 

&nbsp; 

\### Comment:

The 1st attempt is creating two CTEs. It is the longest and not the simplest. When left joining, it gets one null value so need to make sure that null value is properly handled.(That's why the code is not simple although using CTE)  

The 2nd attempt is after looking at the sample answer.  

This probably is the simplest solution.  

The 3rd is not using CTE. It is the shortest but not necessarily the simplest code.



