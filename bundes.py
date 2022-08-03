import pandas as pd
pd.options.mode.chained_assignment = None  # default='warn'

bvb = pd.read_csv("bvb21.csv")
frank = pd.read_csv("frank21.csv")
bayern = pd.read_csv("bayern.csv")
greuther = pd.read_csv("greuther.csv")


bvb21 = bvb[['GF', 'Poss', 'Result']]
frank21 = frank[['GF', 'Poss', 'Result']]
bayern21 = bayern[['GF', 'Poss', 'Result']]
greuther21 = greuther[['GF', 'Poss', 'Result']]

bvb21['Team'] = 'Borussia Dortmund'
frank21['Team'] = 'Eintracht Frankfurt'
bayern21['Team'] = 'Bayern Munich'
greuther21['Team'] = 'Greuther Fürth'

bundes = [bvb21, frank21, bayern21, greuther21]

bundesliga = pd.concat(bundes)

bundesliga.to_csv('bundesliga21.csv')
