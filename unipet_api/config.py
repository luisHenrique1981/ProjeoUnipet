import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    DEBUG = False
    SECRET_KEY = 'palavra-secreta-luis'


    POSTGRES_HOST = "localhost"
    POSTGRES_PORT = "5432"
    POSTGRES_NAME = "unipet_db"
    POSTGRES_USER = "postgres"
    POSTGRES_PASSWORD = "@Luishenrique2008#"

    API_HOST = "127.0.0.1"
    API_BASE_PORT = 5000