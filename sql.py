import sqlite3
from sys import argv

def main():
    files = ['schema.sql', 'queries.sql']
    start, end = int(argv[2]), int(argv[3]) 
    
    con = sqlite3.connect('db.db')
    curr = con.cursor()

    with open(files[int(argv[1])], 'r') as schema:
        s = schema.readlines()[start-1:end+1]
        f = "".join(s)
        curr.execute(f) 
        con.commit()

if __name__=='__main__':
    main()