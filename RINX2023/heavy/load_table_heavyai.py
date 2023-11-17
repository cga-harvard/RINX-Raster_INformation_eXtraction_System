import pandas as pd
from pymapd import connect
import logging
from pathlib import Path
from dotenv import load_dotenv
import os

# Load environment variables from a .env file for secure credential management
load_dotenv()

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Environment variables for database connection
DB_USER = os.getenv("DB_USER", "admin")
DB_PASSWORD = os.getenv("DB_PASSWORD", "your_default_password")
DB_HOST = os.getenv("DB_HOST", "199.94.60.43")
DB_PORT = os.getenv("DB_PORT", "6274")
DB_NAME = os.getenv("DB_NAME", "omnisci")

TABLE_NAME = 'RINX'

# Function to connect to the database
def connect_to_db():
    try:
        logging.info("Connecting to database...")
        conn = connect(user=DB_USER, password=DB_PASSWORD, host=DB_HOST, port=DB_PORT, dbname=DB_NAME)
        logging.info("Connected to database successfully")
        return conn
    except Exception as e:
        logging.error(f"Error connecting to database: {e}")
        raise

# Function to load data into the database
def load_data_to_db(conn, file_path, TABLE_NAME):
    try:
        df = pd.read_csv(file_path)
        df.rename(columns={'day': 'day_'}, inplace=True)
        
        # Load data into the table
        conn.load_table(TABLE_NAME, df, create='infer', method='arrow')
        logging.info("Data loaded into the database successfully")
    except FileNotFoundError:
        logging.error(f"File not found: {file_path}")
        raise
    except Exception as e:
        logging.error(f"Error loading data into database: {e}")
        raise

if __name__ == "__main__":
    # File path for the data file
    file_path = './merged_rinx_coh1.csv'
    TABLE_NAME = 'RINX'
    # Ensuring the file exists
    if not Path(file_path).is_file():
        logging.error(f"Data file does not exist: {file_path}")
    else:
        # Connect to the database
        conn = connect_to_db()

        # Load data into the database
        load_data_to_db(conn, file_path, TABLE_NAME)
