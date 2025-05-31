SELECT
  USER_ID user_id,
  DATE(CREDTM) date,
  AMOUNT amt,
  FALSE is_expense,
	FALSE is_group,
  NULL group_id,
  A.CATEGORY category_id,
  B.CATEGORY category
FROM zoo_checkchick2.ACC_USER_DETAIL_INCOME A
LEFT JOIN zoo_checkchick3.ACC_CATEGORY_INCOME B
ON A.CATEGORY = B.ID
;


SELECT
  USER_ID user_id,
  DATE(CREDTM) date,
  AMOUNT amt,
  FALSE is_expense,
	TRUE is_group,
  GROUP_ID group_id,
  A.CATEGORY category_id,
  B.CATEGORY category
FROM zoo_checkchick2.ACC_GROUP_DETAIL_INCOME A
LEFT JOIN zoo_checkchick3.ACC_CATEGORY_INCOME B
ON A.CATEGORY = B.ID
;