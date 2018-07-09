from flask import Flask
from flask import render_template
import pymssql

app = Flask(__name__)


@app.route('/')
def index():
    message = "Flask is Great!!!"
    return render_template('index.html', message=message)


if __name__ == '__main__':
    app.run(port=80, host='0.0.0.0')

