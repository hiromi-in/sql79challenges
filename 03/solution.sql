--1st attempt
SELECT name.user_id, name.user_name
FROM hiromi_users name
JOIN (
SELECT f.user_id, f.friend_id
FROM hiromi_friends f
LEFT JOIN hiromi_users u ON f.user_id = u.user_id
WHERE user_name = 'Karl' AND friend_id IN 
                            (SELECT friend_id
                            FROM hiromi_friends f
                            LEFT JOIN hiromi_users u ON f.user_id = u.user_id
                            WHERE user_name =  'Hans') ) friend ON name.user_id = friend.friend_id


--2nd attempt after looking at the answer
WITH karl AS (SELECT * FROM hiromi_friends WHERE user_id = (SELECT user_id FROM hiromi_users WHERE user_name = 'Karl')),
hans AS (SELECT * FROM hiromi_friends WHERE user_id = (SELECT user_id FROM hiromi_users WHERE user_name = 'Hans'))

SELECT karl.friend_id as user_id, user_name
FROM karl 
JOIN hans ON karl.friend_id = hans.friend_id
JOIN hiromi_users ON karl.friend_id = hiromi_users.user_id


--3rd attempt after looking at the answer again
WITH karl AS (SELECT * FROM hiromi_friends WHERE user_id = (SELECT user_id FROM hiromi_users WHERE user_name = 'Karl')),
hans AS (SELECT * FROM hiromi_friends WHERE user_id = (SELECT user_id FROM hiromi_users WHERE user_name = 'Hans'))

SELECT u.*
FROM hiromi_users u
JOIN karl k ON u.user_id = k.friend_id
JOIN hans h ON u.user_id = h.friend_id