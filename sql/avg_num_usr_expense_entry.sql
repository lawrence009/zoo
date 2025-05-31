-- avg number of expense entry per user in a given year

SELECT
	expense_yr,
	COUNT(*) n_user,
  round(AVG(n_expense_entry), 2) avg_nbr_user_expense_entry,
  round(AVG(total_amt)) avg_annual_total_expense
FROM (
	SELECT USER_ID,
    count(*) n_expense_entry,
		AVG(AMOUNT) avg_amt,
		sum(AMOUNT) total_amt,
		year(CREDTM) expense_yr
	FROM zoo.ACC_USER_DETAIL
	  GROUP BY USER_ID, expense_yr
)  foo
	
  GROUP BY expense_yr
  ORDER BY expense_yr DESC
;