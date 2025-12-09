## Google (Medium Level) hashtag#SQL Interview Question 



You are analyzing a social network dataset at Google. Your task is to find mutual friends between two users, Karl and Hans. There is only one user named Karl and one named Hans in the dataset.



The output should contain 'user\_id' and 'user\_name' columns.

&nbsp;   


### 𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭:

CREATE TABLE users(user\_id INT, user\_name varchar(30));

INSERT INTO users VALUES (1, 'Karl'), (2, 'Hans'), (3, 'Emma'), (4, 'Emma'), (5, 'Mike'), (6, 'Lucas'), (7, 'Sarah'), (8, 'Lucas'), (9, 'Anna'), (10, 'John');



CREATE TABLE friends(user\_id INT, friend\_id INT);

INSERT INTO friends VALUES (1,3),(1,5),(2,3),(2,4),(3,1),(3,2),(3,6),(4,7),(5,8),(6,9),(7,10),(8,6),(9,10),(10,7),(10,9);

-------------



### Comment:

I have multiple attempts for this one.  

All are correct but it gets simpler every time I try the other way.  

First one is getting the answer without CTE.  

After looking at the answer, I realized that with CTE the command gets way simpler. So the 2nd attempt.  

2nd attempt is confusing as I need to rename a column from friend\_id to user\_id.  

Hence the 3rd attempt, which I do not need to change the column name and filtering rows out by joining karl and hans tables.



