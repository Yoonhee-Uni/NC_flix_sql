import psycopg2
from config import config
from configparser import ConfigParser
# instock, vip, best_film, rating
def rental_query(stores):
    if stores :
        stores()
            





def stores():
    conn = None
    try: 
        params = config()
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        filter = []

        query="""SELECT stores.store_id, customers.location, COUNT(customers.location)
                            FROM customers
                            LEFT JOIN stores
                            ON customers.location = stores.city 
                            GROUP BY stores.store_id, customers.location"""
        filter.append(query)

        cur.execute(filter[0])
        print("The number of parts: ", cur.rowcount)
        movies =[]
        rows= cur.fetchall()
        for row in rows:
            movie = {
                'store_id' : row[0],
                'location' : row[1],
                'count' : row[2]                
                }
            movies.append(movie)
        print(movies)

    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')        

        

if __name__ == '__main__':
    config()
    rental_query(stores)  
