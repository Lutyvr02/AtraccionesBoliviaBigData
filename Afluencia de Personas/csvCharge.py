import pandas as pd
from sqlalchemy import create_engine

DB_USER = 'root'
DB_PASS = 'hola1234'
DB_NAME = 'afluenciaPersonas'
DB_PORT = '4535' 
# docker tener cuidado
DB_HOST = 'localhost'

connection_string = f'mysql+pymysql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}'
engine = create_engine(connection_string)

def cargar_datos_csv(tabla, archivo_csv):
    df = pd.read_csv(archivo_csv)
    df.to_sql(tabla, con=engine, if_exists='append', index=False)
    print(f'Datos cargados exitosamente en la tabla {tabla}')

cargar_datos_csv('dim_time', './time.csv')
cargar_datos_csv('dim_transporte', './transporte.csv')
cargar_datos_csv('dim_departamentos', './departamentos.csv')
cargar_datos_csv('dim_atracciones', './Atracciones.csv')
cargar_datos_csv('dim_dias_festivos', './dias_festivos.csv')
cargar_datos_csv('dim_eventos', './eventos_bolivianos.csv')
cargar_datos_csv('dim_promocion', './promocion.csv')
cargar_datos_csv('facto1', './fact_afluencia.csv')