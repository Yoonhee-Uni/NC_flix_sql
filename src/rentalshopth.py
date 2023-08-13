import psycopg2
from config import config
from configparser import ConfigParser


def select_movies(sort_by='title', order= 'ASC', min_rating = None, location = None ):
    conn = None
    try: 
        params =config()
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        filter = []

        if not location == None :
            location_list = ['Manchester', 'Leeds', 'Newcastle', 'Birmingham']
            if location in location_list :
                filter.clear()
                filter.append(f""" SELECT DISTINCT(title) FROM movies
                                    JOIN stock
                                    ON movies.movie_id = stock.movie_id
                                    JOIN stores
                                    ON stock.store_id = stores.store_id
                                    WHERE city = '{location}'""")
            cur.execute(filter[0])
            print("The number of parts: ", cur.rowcount)
            movies =[]
            rows = cur.fetchall()
            for row in rows:
                movie = {
                    'title' : row[0]
                }
                movies.append(movie)
            print(movies)
        
        else:                
            query = """SELECT movie_id, title, release_date, rating, classification 
            FROM  movies"""

            filter.append(query)

            if not min_rating == None :
                filter.append(f" WHERE rating > {min_rating}")

            if sort_by:
                sort_by_list = ["title", "release_date", "rating", "classiication"]
                if sort_by in sort_by_list :
                    filter.append(f" ORDER BY {sort_by}")

            if order == 'DESC':
                filter.append(f" DESC")


                    

            filters = ' '.join(filter)
            print('HERERERERERE',filters)
            cur.execute(filters)  
            print("The number of parts: ", cur.rowcount)
            movies =[]
            rows = cur.fetchall()
            for row in rows:
                movie = {
                    'movie_id' : row[0],
                    'title' : row[1],
                    'release_date' : row[2],
                    'rating' : row[3],
                    'classification' : row[4]
                }
                movies.append(movie)

            print(movies)    


    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')    

# if __name__ == '__main__':
#     config()
#     select_movies(location = 'Manchester')   
