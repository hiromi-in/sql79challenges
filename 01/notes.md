
## Meta/Facebook (Hard Level) hashtag#SQL Interview Question — Solution  
  
A table named “famous” has two columns called user id and follower id. It represents each user ID has a particular follower ID. These follower IDs are also users of hashtag#Facebook / hashtag#Meta. Then, find the famous percentage of each user.  
Famous Percentage = number of followers a user has / total number of users on the platform.  
  
  
### 𝐒𝐜𝐡𝐞𝐦𝐚 𝐚𝐧𝐝 𝐃𝐚𝐭𝐚𝐬𝐞𝐭:  
CREATE TABLE famous (user_id INT, follower_id INT);  
  
INSERT INTO famous VALUES  
(1, 2), (1, 3), (2, 4), (5, 1), (5, 3),  
(11, 7), (12, 8), (13, 5), (13, 10),  
(14, 12), (14, 3), (15, 14), (15, 13);  
-------------

### Comment:  
Need to get distinct value after combining user_id and follower_id. UNION removes duplicates so it is quite convinient in this senario.  
Also need to multiply the result with 100 to get percentage, which is asked for.