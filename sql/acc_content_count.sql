SELECT user_id, COUNT(*) AS cnt FROM zoo.acc_content_counts
  GROUP BY user_id
  ORDER	BY cnt DESC;
  
  
SELECT DISTINCT created_date FROM zoo.acc_content_counts
  ORDER BY created_date;
# 2021-04-08 to 2024-01-02

