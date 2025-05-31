-- group expense entry USER_ID not found in private expense entry

SELECT COUNT(DISTINCT B.USER_ID)
FROM zoo.ACC_USER_DETAIL A
RIGHT JOIN zoo_checkchick.ACC_GROUP_DETAIL B
ON A.USER_ID = B.USER_ID
WHERE A.USER_ID IS NULL
;