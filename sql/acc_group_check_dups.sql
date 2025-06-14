-- check duplidate GROUP_ID
-- a bug
-- verify with 榮哥 if this table is still being used to support the app
-- or if it is for analytics

SELECT COUNT(*), COUNT(DISTINCT GROUP_ID)
FROM checkchick.ACC_GROUP
;
