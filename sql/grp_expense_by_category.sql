SELECT B.CATEGORY,
  count(DISTINCT USER_ID) n_user,
  count(*) n_expense,
  round(count(*) / count(DISTINCT USER_ID), 2) n_expsense_per_user,  
  round(sum(AMOUNT)) amt
	FROM zoo_checkchick.ACC_GROUP_DETAIL A
		LEFT JOIN zoo_checkchick3.ACC_CATEGORY B
		ON A.CATEGORY = B.ID
  GROUP BY A.CATEGORY
  ORDER BY amt DESC 
;