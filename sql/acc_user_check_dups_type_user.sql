-- check duplicate USER_ID
-- probably a bug
-- has it been fixed? 
 
SELECT dups.n, l.*
FROM ACC_USER l
RIGHT JOIN (
SELECT USER_ID, COUNT(*) n
FROM ACC_USER
WHERE TYPE = 'user'
GROUP BY USER_ID
HAVING n>1
) dups
ON l.USER_ID = dups.USER_ID
WHERE TYPE = 'user'
;
