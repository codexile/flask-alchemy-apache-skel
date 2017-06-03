from flask import Flask
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////tmp/test.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)


@app.route('/')
def index():
    return 'Hello, cool guy!!'


@app.route('/taco')
def taco():
    return 'don\'t forget your taco!'


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
