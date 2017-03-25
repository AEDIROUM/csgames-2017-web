from project9 import app, query_db
from flask import request, redirect, url_for, render_template, g, jsonify, flash, session
import random


@app.route("/")
def index():

    return render_template('index.html', test=1)

@app.route("/search", methods=['POST'])
def search():

    pattern = request.form['pattern']
    op = ' AND ' if request.form['all'] == 'true' else ' OR '
    if not pattern:
        return jsonify(success=True)

    words = list(map(str.lower, map(lambda x: x if '%' in x else '%' + x + '%', pattern.split(' '))))

    questions = query_db('SELECT id, content AS text FROM questions WHERE ' + op.join(['LOWER(content) LIKE ?' for i in range(len(words))]) + ' LIMIT 10', words)
    categories = query_db('SELECT id, name AS text FROM categories WHERE ' + op.join(['LOWER(name) LIKE ?' for i in range(len(words))]) + ' LIMIT 10', words)
    cours = query_db('SELECT sigle AS id, name AS text FROM cours WHERE ' + op.join(['LOWER(name) LIKE ?' for i in range(len(words))]) + ' LIMIT 10', words)
    parties_cours = query_db('SELECT id, name AS text FROM partie_cours WHERE ' + op.join(['LOWER(name) LIKE ?' for i in range(len(words))]) + ' LIMIT 10', words)

    return jsonify(success=True, questions=questions, categories=categories, cours=cours, partie_cours=parties_cours)

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.form:
        query_db('insert into users (username, password) values (?, ?)',
                request.form['username'], request.form['password'])
        return redirect(url_for('login'))
    return render_template('register.html')

@app.route('/users')
def users():
    return render_template('users.html', users=query_db('select * from users'))

@app.route('/user/<int:user_id>')
def user(user_id):
    return render_template('user.html', user=query_db('select * from users where id = ?', user_id).fetchone())

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.form:
        cur = query_db('select * from users where username = ? and password = ?',
                request.form['username'], request.form['password'])
        user = cur.fetchone()
        if user:
            session['user'] = user['id']
            return redirect(url_for('index'))
        else:
            flash('Login attempt fail!')
    return render_template('login.html')

@app.route('/logout')
def logout():
    del session['user']
    flash('You\'ve been logged out!')
    return redirect(url_for('index'))

@app.route('/prof/', methods=['GET', 'POST'])
def prof():
    if 'nom' in request.form and 'pwd' in request.form and 'prenom' in request.form:
        prof = query_db("SELECT * FROM professeurs WHERE nom=? AND mot_de_passe=? AND prenom=?", request.form['username'], request.form['password'])
        if len(prof) == 1:
            pass

    return render_template('prof-login.html')

