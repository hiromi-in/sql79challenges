SELECT user_id, 
   	   CAST(COUNT(follower_id) as float) / CAST(
	(SELECT COUNT(*)
	 FROM(
	       SELECT user_id
	       FROM hiromi_famous
	       UNION
	       SELECT follower_id
	       FROM hiromi_famous)t
			) 
		as float) 
		* 100 famous_percentage
FROM hiromi_famous
GROUP BY user_id
