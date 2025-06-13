-- consolidate expense and income entry to simplify analysis

USE checkchick;

DROP TABLE IF EXISTS acc_cashflow;

CREATE TABLE acc_cashflow (
  user_id VARCHAR(100) NOT NULL,
  ts DATETIME NOT NULL,
  amt DOUBLE NOT NULL,
  is_expense BOOLEAN,
  is_group BOOLEAN,
  group_id VARCHAR(100),
  category_id INT,
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
  CATEGORY category_id,
  NOTE note
FROM ACC_USER_DETAIL
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
  CATEGORY category_id,
  NOTE note
FROM ACC_GROUP_DETAIL
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
  CATEGORY category_id,
  NOTE note
FROM ACC_USER_DETAIL_INCOME
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
  CATEGORY category_id,
  NOTE note
FROM ACC_GROUP_DETAIL_INCOME
;