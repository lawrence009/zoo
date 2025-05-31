SELECT USER_ID, count(*) n_expense_entry,
	round(avg(AMOUNT)) avg_amt,
	sum(AMOUNT) total_amt,
	year(CREDTM) expense_yr
  FROM zoo_checkchick.ACC_GROUP_DETAIL
  GROUP BY USER_ID, expense_yr
  ORDER BY avg_amt DESC
;