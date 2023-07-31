import psycopg2
import pandas as pd
from config import config
from configparser import ConfigParser


def select_movies(sort_by = 'title', order = 'DESC', min_rating = None, location = None):
    conn = None
    try:
        params =config()
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
        cur = conn.cursor()

        query = f'''
        
        SELECT movies.movie_id, movies.title, movies.release_date, movies.rating, movies.classification, stores.city
        FROM  movies
        JOIN stock
        ON movies.movie_id = stock.movie_id
        JOIN stores
        ON stock.store_id = stores.store_id
        WHERE rating > {min_rating} AND stores.city = '{location}'
        ORDER BY {sort_by} {order}'''

        df_one = pd.read_sql_query(query, conn)
        print(df_one)
        cur.close()

                        
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.') 
        




select_movies(sort_by = 'cost', order = 'ASC', min_rating = 2, location = 'Newcastle')
