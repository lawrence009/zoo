-- avg number of group income entry per user in a given year

SELECT
  income_yr,
  COUNT(*) n_user,
  round(AVG(n_income_entry), 2) avg_nbr_group_income_entry,
  round(AVG(total_amt)) avg_annual_total_group_income
FROM (
	SELECT
		USER_ID,
		year(ACCDATE) income_yr,
		COUNT(*) n_income_entry,
		round(AVG(AMOUNT)) avg_amt,
		round(SUM(AMOUNT)) total_amt
	FROM zoo_checkchick2.ACC_GROUP_DETAIL_INCOME
	GROUP BY USER_ID, income_yr
) foo
GROUP BY income_yr
;