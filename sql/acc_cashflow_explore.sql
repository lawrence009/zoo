SELECT * FROM zoo.acc_cashflow;

-- check for obvious erroneous dates
SELECT
  date_format(date, '%Y-%m') `year_month`,
  COUNT(*) count,
  SUM(is_expense) nbr_expense,
  SUM(is_group) nbr_grp_entry
FROM zoo.acc_cashflow
GROUP BY `year_month`
;

SELECT max(date), min(date)
FROM zoo.acc_cashflow
WHERE date BETWEEN '2018-06-01' AND '2025-01-31'
;

-- expese category order by usage frequency
SELECT
  category_id,
  category,
  COUNT(*) freq,
  COUNT(DISTINCT user_id) n_user,
  GROUP_CONCAT(DISTINCT trim(note) ORDER BY trim(note) SEPARATOR ', ') AS notes
FROM zoo.acc_cashflow
WHERE is_expense = TRUE
GROUP BY category_id, category
ORDER BY freq DESC
;

-- income category order by usage frequency
SELECT
  category_id,
  category,
  COUNT(*) freq,
  COUNT(DISTINCT user_id) n_user,
  GROUP_CONCAT(DISTINCT trim(note) ORDER BY trim(note) SEPARATOR ', ') AS notes
FROM zoo.acc_cashflow
WHERE is_expense = FALSE
GROUP BY category_id, category
ORDER BY freq DESC
;

SELECT DISTINCT trim(note)
FROM zoo.acc_cashflow
WHERE date >= '2025-01-01'
;