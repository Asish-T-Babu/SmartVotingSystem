from flask import Flask
from public import public
from admin import admin
from candidate import candidate
from user import user
from teacher import teacher
from datetime import timedelta

app=Flask(__name__)
app.secret_key="hai"
app.config['SECRET_KEY'] = 'xxxxxxxxx'
app.config['PERMANENT_SESSION_LIFETIME'] =  timedelta(minutes=5)
app.register_blueprint(public)
app.register_blueprint(admin,url_prefix='/admin')
app.register_blueprint(candidate,url_prefix='/candidate')
app.register_blueprint(user,url_prefix='/user')
app.register_blueprint(teacher,url_prefix='/teacher')
app.run(debug=True,port=5016)
