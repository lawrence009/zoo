SELECT count(*) n_new_user, year(CREDTM) created_yr

FROM (
  SELECT USER_ID, min(CREDTM) AS CREDTM
    FROM zoo_checkchick2.ACC_USER
	GROUP BY USER_ID
) AS foo
  GROUP BY created_yr
  ORDER BY created_yr
;