import pandas as pd
from pymapd import connect


variable = "tmax" #change the variable name as needed
print("connecting...")
conn=connect(user="admin", password="HyperInteractive", host="localhost", port=9768, dbname="heavyai") #use your port number
print("Connected",conn)

df = pd.read_csv('./merged.csv') #Use your path to csv
conn.load_table(variable,df,create='infer',method='arrow') 