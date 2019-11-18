import pandas as pf
import sportsreference


from sportsreference.ncaab.teams import Teams

myData = []
for team in Teams('2019'):
    myData.append(team.dataframe)

df = pf.concat(myData)
df.to_csv("teams19.csv")