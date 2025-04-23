import pandas as pd
import sys

infile = sys.argv[1]
outfile = sys.argv[2]

df = pd.read_csv(infile)

with open(outfile, 'w') as f:    
    f.write(df.to_markdown(index=False))
    f.write("\n")
