import pandas as pd
from rentalshoptwo_v2 import *

def test_my_function():
    data = {'column1': [1, 2, 3, 4, 5]}
    df = pd.DataFrame(data)
    result = select_movies(df, 'column1')
    assert result == 15


    
