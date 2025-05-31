-- avg number of group expense entry per user in a given year

SELECT
	round(avg(n_expense_entry), 2) avg_num_grp_expense_entry,
	count(*) n_user,
  round(avg(avg_amt)) avg_grp_expense_amt,
  round(avg(total_amt)) avg_total_expense_amt,
	expense_yr
FROM (
	SELECT USER_ID, count(*) n_expense_entry,
		round(avg(AMOUNT)) avg_amt,
		sum(AMOUNT) total_amt,
		year(CREDTM) expense_yr
	  FROM zoo_checkchick.ACC_GROUP_DETAIL
	  GROUP BY USER_ID, expense_yr
	  ORDER BY avg_amt DESC
)  foo
	
  GROUP BY expense_yr
  ORDER BY expense_yr DESC
;