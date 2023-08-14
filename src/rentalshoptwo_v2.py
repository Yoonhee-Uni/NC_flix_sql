import psycopg2
import pandas as pd
from config import config
from configparser import ConfigParser



def select_movies(sort_by = 'title', order = 'DESC', min_rating =0, location = None):
    conn = None
    try:
        params =config()
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
        cur = conn.cursor()

        # engine = create_engine('postgresql+psycopg2://', connect_args=params)

        request = f'''
                    SELECT movies.movie_id, movies.title, movies.release_date, movies.rating, movies.classification, stores.city
                    FROM  movies
                    JOIN stock
                    ON movies.movie_id = stock.movie_id
                    JOIN stores
                    ON stock.store_id = stores.store_id'''

        if (location) : 
            request +=  f''' WHERE rating > {min_rating} AND stores.city = '{location}'
            ORDER BY {sort_by} {order}'''
        

        else : request += f''' WHERE rating > {min_rating} 
            ORDER BY {sort_by} {order}'''

        df_one = pd.read_sql_query(request, conn)
        
        data=df_one.head(1)
        cur.close()

        return data                         
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.') 



def rental_info():
    conn = None
    try:
        params = config()
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
        cur = conn.cursor()

        query =f'''
        WITH CustomerRentalCounts AS (
        SELECT
            stores.city AS city,
            customers.customer_name,
            COUNT(rental.stock_id) AS rental_count,
            ROW_NUMBER() OVER (PARTITION BY stores.city ORDER BY COUNT(rental.stock_id) DESC) AS row_num
        FROM rental
        JOIN customers ON customers.customer_id = rental.customer_id
        JOIN stores ON stores.city = customers.location
        GROUP BY stores.city, customers.customer_name
        ),

        MostPopularFilm AS (
        SELECT 
            stores.city AS city,
            movies.title AS movie_name,
            COUNT(rental.stock_id) AS rental_count,
            ROW_NUMBER() OVER(PARTITION BY stores.city ORDER BY COUNT(rental.stock_id) DESC) AS row_num
        FROM rental
        JOIN stock
        ON rental.stock_id = stock.stock_id
        JOIN stores
        ON stock.store_id = stores.store_id
        JOIN movies
        ON stock.movie_id = movies.movie_id  
        GROUP BY stores.city, movies.title  
        ),

        AvgRating AS(
        SELECT 
            stores.city AS city,
            ROUND(AVG(movies.rating) OVER(PARTITION BY stores.city),1) AS avg_rating
        FROM rental
        JOIN stock
        ON rental.stock_id = stock.stock_id
        JOIN stores
        ON stock.store_id = stores.store_id
        JOIN movies
        ON stock.movie_id = movies.movie_id
        )

    SELECT
        stores.store_id,
        stores.city,
        COUNT(DISTINCT customers.customer_id) AS Number_of_customers,
        COUNT(DISTINCT stock.stock_id) AS Film_available,
        ranked_data.customer_name,
        ranked_movie.movie_name AS most_popular_film,
        AVG_Rating_movie.avg_rating AS Average_rating_store

    FROM stores

    LEFT JOIN customers 
    ON customers.location = stores.city

    JOIN stock 
    ON stores.store_id = stock.store_id

    JOIN rental 
    ON rental.stock_id = stock.stock_id

    LEFT JOIN (
        SELECT city, customer_name
        FROM CustomerRentalCounts
        WHERE row_num = 1
    ) AS ranked_data 
    ON stores.city = ranked_data.city

    LEFT JOIN (
        SELECT city, movie_name
        FROM MostPopularFilm
        WHERE row_num = 1
    ) AS ranked_movie
    ON stores.city = ranked_movie.city

    LEFT JOIN (
        SELECT city, avg_rating
        FROM Avgrating
    )AS AVG_Rating_movie
    ON stores.city = AVG_Rating_movie.city

    GROUP BY stores.store_id, stores.city, ranked_data.customer_name, ranked_movie.movie_name,AVG_Rating_movie.avg_rating
    ORDER BY stores.city, Number_of_customers DESC;
'''
        
        
        
        
        df_one = pd.read_sql_query(query, conn)
        print(df_one)
        cur.close()

                        
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.') 


def low_rated_movies(location = None):
    conn = None
    try:
        params =config()
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
        cur = conn.cursor()

    

        request = f'''
            WITH low_rate AS (
                    SELECT 
                    genre_name,
                    title AS film_title,
                    rating,
                    ROW_NUMBER() OVER (PARTITION BY genres.genre_name ORDER BY movies.rating ASC) AS low_rating
                    
                    FROM genres

                    JOIN movies_genres
                    ON genres.genre_id = movies_genres.genre_id
                    JOIN movies
                    ON movies_genres.movie_id = movies.movie_id
                    GROUP BY genres.genre_name, title, movies.rating
                    )
                    SELECT genre_name, film_title, rating
                    FROM low_rate
                    WHERE low_rating = 1;
                    '''
        
        
        df_one = pd.read_sql_query(request, conn)
        
        data=df_one
        cur.close()

        print(data)                         
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.') 
low_rated_movies()


