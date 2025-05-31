SELECT
  USER_ID user_id,
  DATE(CREDTM) date,
  -AMOUNT amt,
  A.CATEGORY category_id,
--  B.CATEGORY category,
  TRUE is_expense,
	FALSE is_group
FROM zoo.ACC_USER_DETAIL A
-- LEFT JOIN zoo_checkchick3.ACC_CATEGORY B
-- ON A.CATEGORY = B.ID
UNION
SELECT
  USER_ID user_id,
  DATE(CREDTM) date,
  -AMOUNT amt,
  A.CATEGORY category_id,
--  B.CATEGORY category,
  TRUE is_expense,
	TRUE is_group
FROM zoo_checkchick.ACC_GROUP_DETAIL A
-- LEFT JOIN zoo_checkchick3.ACC_CATEGORY B
-- ON A.CATEGORY = B.ID
;
