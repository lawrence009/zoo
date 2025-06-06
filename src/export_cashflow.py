import os
from sqlalchemy import create_engine
import pandas as pd

user = os.getenv("MYSQL_USER")
password = os.getenv("MYSQL_PASSWORD")
host = "localhost"
database = "zoo"

engine = create_engine(f"mysql+pymysql://{user}:{password}@{host}/{database}")

cashflow = pd.read_sql("SELECT * FROM acc_cashflow",
                       con=engine,
                       dtype={'ts':'datetime64[ns]', 'is_expense':'bool', 'is_group':'bool'})
cashflow.to_feather('cashflow.feather')