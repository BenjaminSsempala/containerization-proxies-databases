import os

import pymysql
from flask import Flask, jsonify

app = Flask(__name__)


def get_connection():
    # Connection settings come from environment variables set in docker-compose.yml
    return pymysql.connect(
        host=os.environ.get("DB_HOST", "db"),
        user=os.environ["DB_USER"],
        password=os.environ["DB_PASSWORD"],
        database=os.environ["DB_NAME"],
        cursorclass=pymysql.cursors.DictCursor,
    )


@app.route("/")
def list_tasks():
    connection = get_connection()
    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT id, title, done FROM tasks")
            tasks = cursor.fetchall()
    finally:
        connection.close()
    return jsonify(tasks)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
