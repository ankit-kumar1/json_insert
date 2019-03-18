import pandas as pd
from sqlalchemy import create_engine, types

##create database connectiong
conn = create_engine('postgresql://username:password@localhost:5439/production')

##write json file to dataframes
df = pd.read_json('/pathtofile/message_blast.json',
                  orient='columns', lines=True)
#print(df)

##insert to database
df.to_sql('message_blast', conn, index=False, if_exists='append',
          schema='analytics',
          dtype=
          {'opens': types.JSON,
           'clicks': types.JSON}
          )


## other data files can be inserted in a similar way
