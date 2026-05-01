import pandas as pd
import pymysql
import matplotlib.pyplot as plt

print("Start")

try:
    conn = pymysql.connect(
        host="127.0.0.1",
        user="root",
        password="han tan jani na",
        database="salinity_health_db"
    )

    print("Connected")

    query = "SELECT * FROM salinity_data"
    df = pd.read_sql(query, conn)

    print("Total rows:", len(df))
    print(df.head())
    print(df["District"].unique())
    print(df.info())
    print(df.columns)
    
    district_count = df["District"].value_counts()
    print(district_count)
    print(district_count.idxmax())

    River_count = df["River"].value_counts()
    print(River_count)
    print(River_count.idxmax())

    recent_data = df[df["Last_Date"] > "2018-01-01"]
    print(recent_data["District"].value_counts())             #last 5 yr data

    khulna_data = df[df["District"] == "Khulna"]
    print(khulna_data)
    Satkhira_data = df[df["District"] == "Satkhira"]
    print(Satkhira_data)
    Bagerhat_data = df[df["District"] == "Bagerhat"]
    print(Bagerhat_data)

    district_group = df.groupby("District").size()
    print(district_group)
    river_group = df.groupby("River").size()
    print(river_group)


    print(df.isnull().sum())                              #null data check

    

    district_count = df["District"].value_counts()        #chart

    district_count.plot(kind="bar")

    plt.title("Number of Stations by District")
    plt.xlabel("District")
    plt.ylabel("Count")
    plt.show()



    top_river = df["River"].value_counts().head(5)
    top_river.plot(kind="bar")
    plt.title("Top 5 Rivers by Monitoring")
    plt.show()
    

except Exception as e:
    print("Error:", e)
    
    