-- consolidate expense and income entry to simplify analysis

USE zoo;

DROP TABLE IF EXISTS acc_cashflow;

CREATE TABLE acc_cashflow (
	user_id VARCHAR(100) NOT NULL,
  ts DATETIME NOT NULL,
  amt DOUBLE NOT NULL,
  is_expense BOOLEAN,
	is_group BOOLEAN,
  group_id VARCHAR(100),
  category_id INT,
  category VARCHAR(100),
  note VARCHAR(160)
) COMMENT = 'consolidated expense and income entries'
;

-- insert personal expense
INSERT INTO acc_cashflow
SELECT
  USER_ID user_id,
  CREDTM ts,
  -AMOUNT amt,
  TRUE is_expense,
	FALSE is_group,
  NULL group_id,
  A.CATEGORY category_id,
  B.CATEGORY category,
  NOTE note
FROM zoo.ACC_USER_DETAIL A
LEFT JOIN zoo_checkchick3.ACC_CATEGORY B
ON A.CATEGORY = B.ID
;

-- insert group expense
INSERT INTO acc_cashflow
SELECT
  USER_ID user_id,
  CREDTM ts,
  -AMOUNT amt,
  TRUE is_expense,
	TRUE is_group,
  GROUP_ID group_id,
  A.CATEGORY category_id,
  B.CATEGORY category,
  NOTE note
FROM zoo_checkchick.ACC_GROUP_DETAIL A
LEFT JOIN zoo_checkchick3.ACC_CATEGORY B
ON A.CATEGORY = B.ID
;

-- insert personal income
INSERT INTO acc_cashflow
SELECT
  USER_ID user_id,
  CREDTM ts,
  AMOUNT amt,
  FALSE is_expense,
	FALSE is_group,
  NULL group_id,
  A.CATEGORY category_id,
  B.CATEGORY category,
  NOTE note
FROM zoo_checkchick2.ACC_USER_DETAIL_INCOME A
LEFT JOIN zoo_checkchick3.ACC_CATEGORY_INCOME B
ON A.CATEGORY = B.ID
;

-- insert group income
INSERT INTO acc_cashflow
SELECT
  USER_ID user_id,
  CREDTM ts,
  AMOUNT amt,
  FALSE is_expense,
	TRUE is_group,
  GROUP_ID group_id,
  A.CATEGORY category_id,
  B.CATEGORY category,
  NOTE note
FROM zoo_checkchick2.ACC_GROUP_DETAIL_INCOME A
LEFT JOIN zoo_checkchick3.ACC_CATEGORY_INCOME B
ON A.CATEGORY = B.ID
;