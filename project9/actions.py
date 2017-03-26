from project9 import app, query_db
from flask import request, redirect, url_for, render_template, g, jsonify, flash, session, send_from_directory
from werkzeug.utils import secure_filename
import random
import time
import os

@app.route("/")
def index():

    return render_template('index.html', test=1)

@app.route("/video/<int:video_id>")
def video(video_id):
    user_id = session['user'] if 'user' in session else None

    query_db('INSERT INTO history(user_id, video_id) VALUES(?, ?)', user_id, video_id)

    return render_template('video.html', video=query_db('SELECT * FROM videos WHERE id=?', video_id).fetchone())

@app.route('/upload', methods=['GET', 'POST'])
def upload():
    if request.form:
        print(request.files)
        file = request.files['video']
        file.save(os.path.join('videos', secure_filename(file.filename)))
        cur = query_db('insert into videos (title, description, url) values (?, ?, ?)',
                request.form['title'], request.form['description'], 'http://localhost:3000/videos/' + secure_filename(file.filename))
        return redirect(url_for('video', video_id=cur.lastrowid))
    return render_template('upload.html')

@app.route('/videos/<path:path>')
def serve_video(path):
    return send_from_directory('../videos', path)

@app.route('/thumbnails/<path:path>')
def serve_thumbnails(path):
    return send_from_directory('../thumbnails', path)

@app.route("/search")
def search():
    query = '%{}%'.format(request.args['query'])
    return render_template('search.html', results=query_db('select *, group_concat(tag) as tags from videos left outer join video_tags on id = video_tags.video_id where description like ? or title like ? group by id', query, query))

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

@app.route('/user/<int:user_id>', methods=['GET', 'POST'])
def user(user_id):
    if request.form:
        query_db('update users set name = ?, bio = ? where id = ?',
                request.form['name'], request.form['bio'], user_id)
        return redirect(url_for('user', user_id=user_id))
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

