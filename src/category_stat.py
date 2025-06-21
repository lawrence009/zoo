import pandas as pd

category = pd.read_feather('../data/categories.feather')
cashflow = pd.read_feather('../data/cashflow_cleaned.feather')

cashflow.groupby(['is_expense', 'category_id']) \
    .agg(count=('category_id', 'count'),
         n_user=('user_id', 'nunique'),
         count_per_user = ('user_id', lambda x: round(x.count() / x.nunique(), 2)),
         avg_amt = ('amt', lambda x: (round(x.mean())))
        ) \
    .merge(category[['is_expense', 'category_id', 'category']],
           on=['is_expense', 'category_id'], how='left') \
    .to_feather('../data/category_stat.feather')
