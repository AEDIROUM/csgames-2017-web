import sqlite3
from flask import Flask, g

app = Flask(__name__, static_url_path='')
app.debug = True
app.secret_key = 'rkunhffrzrag'

def dict_factory(cursor, row):
    d = {}
    for idx, col in enumerate(cursor.description):
        d[col[0]] = row[idx]
    return d

def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect('project9/sgbd.db', isolation_level=None)
        db.row_factory = dict_factory
    return db

def query_db(query, *args):
    return get_db().execute(query, args)

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

app.jinja_env.globals.update(query_db=query_db)

from project9 import actions
