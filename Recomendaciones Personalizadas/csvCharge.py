import pandas as pd
from sqlalchemy import create_engine

DB_USER = 'root'
DB_PASS = 'hola1234'
DB_NAME = 'RecoPers'
DB_PORT = '4535' 
# docker tener cuidado
DB_HOST = 'localhost'

connection_string = f'mysql+pymysql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}'
engine = create_engine(connection_string)

def cargar_datos_csv(tabla, archivo_csv):
    df = pd.read_csv(archivo_csv)
    df.to_sql(tabla, con=engine, if_exists='append', index=False)
    print(f'Datos cargados exitosamente en la tabla {tabla}')

cargar_datos_csv('dim_time', './time_fact3.csv')
cargar_datos_csv('dim_atracciones', './atracciones_nosql.csv')
cargar_datos_csv('dim_comentarios', './comentarios.csv')
cargar_datos_csv('dim_usuarios', './usuarios.csv')

cargar_datos_csv('facto3', './fact_recomendaciones.csv')

