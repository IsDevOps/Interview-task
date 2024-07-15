from flask import Flask
import psycopg2
import os

app = Flask(__name__)

def get_db_connection():
    connection = psycopg2.connect(
        dbname=os.environ['DB_NAME'],
        user=os.environ['DB_USER'],
        password=os.environ['DB_PASS'],
        host=os.environ['DB_HOST']
    )
    return connection

@app.route('/')
def index():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT NOW()')
    now = cur.fetchone()
    cur.close()
    conn.close()
    return f"The current time is {now[0]}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
