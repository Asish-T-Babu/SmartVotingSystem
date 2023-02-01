from flask import *
from database import *
from datetime import timedelta, date
from flask import session, app
from  datetime import datetime
user=Blueprint('user',__name__)


@user.before_request
def make_session_permanent():
    session.permanent = True
    user.permanent_session_lifetime = timedelta(minutes=5)
@user.route('/userhome',methods=['get','post'])
def userhome():
		return render_template('userhome.html')

@user.route('/myprofile',methods=['get','post'])
def myprofile():
	data={}
	ids=session['login_id']
	q="select *,concat(first_name,' ',last_name)as NAME from user where login_id='%s'"%(ids)
	res=select(q)
	data['us']=res
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
		id1=request.args['id1']
	else:
		action=None
	if action=="delete":
		q="delete from login where login_id='%s'"%(id1)
		delete(q)
		q="delete from user where user_id='%s'"%(id)
		delete(q)
		flash("Account Deleted")
		return redirect(url_for('user.myprofile'))
	return render_template('userview_myprofile.html',data=data)

@user.route('/view_candidate',methods=['get','post'])
def view_candidate():
	data={}
	q="SELECT *,concat(fname,' ',lname)as NAME FROM `applications` INNER JOIN candidates USING(candidate_id) INNER JOIN logo USING(logo_id) where status='Application Accept'"
	res=select(q)
	data['can']=res
	return render_template('userview_candidate.html',data=data)


# @user.route('/voting',methods=['get','post'])
# def voting():
# 	data={}
# 	ids=session['login_id']
# 	r = "select status from userapplication where user_id=(select user_id from user where login_id='%s')" % (ids)
# 	re=select(r)
# 	ree = re[0]['status']
# 	if (ree == 'Application Accept'):
#
# 		if 'submit' in request.form:
# 			name=request.form['name']
# 			status=request.form['vote']
# 			q="select * from voting where user_id=(select user_id from user where login_id='%s')"%(ids)
# 			res=select(q)
# 			if len(res)>0:
# 				session.permanent=True
# 				flash("This Person is Already Voted")
# 			else:
# 				q="INSERT INTO `voting` VALUES(NULL,(SELECT user_id FROM USER WHERE login_id='%s'),'%s',CURDATE(),'%s')"%(ids,name,status)
# 				insert(q)
# 				flash("Your Vote added")
# 			return redirect(url_for('user.userhome'))
# 		q="SELECT *,CONCAT(fname,' ',lname)as NAME FROM `applications` INNER JOIN candidates USING(candidate_id) INNER JOIN logo USING(logo_id) where status='Application Accept'"
# 		res=select(q)
# 		data['vo']=res
# 	else:
# 		flash("your request is not accepted by teacher")
# 		return redirect(url_for('user.userhome'))
# 	return render_template('user_voting.html', data=data)

@user.route('/votings',methods=['get','post'])
def votings():
	data={}
	ids=session['login_id']
	r = "select status from userapplication where user_id=(select user_id from user where login_id='%s')" % (ids)
	re=select(r)
	ree = re[0]['status']
	if (ree == 'Application Accept'):
		s="select * from election"
		se = select(s)
		see = se[0]['election_date']
		seee=date.today()
		if (see == seee):

			if 'submit' in request.form:
				name=request.form['name']
				status=request.form['vote']
				q="select * from voting where user_id=(select user_id from user where login_id='%s')"%(ids)
				res=select(q)
				if len(res)>0:
					session.permanent=True
					flash("This Person is Already Voted")
				else:
					q="INSERT INTO `voting` VALUES(NULL,(SELECT user_id FROM USER WHERE login_id='%s'),'%s',CURDATE(),'%s')"%(ids,name,status)
					insert(q)
					flash("Your Vote added")
				return redirect(url_for('user.userhome'))
			q="SELECT *,CONCAT(fname,' ',lname)as NAME FROM `applications` INNER JOIN candidates USING(candidate_id) INNER JOIN logo USING(logo_id) where status='Application Accept'"
			res=select(q)
			data['vo']=res
		else:
			s = "select * from election"
			se = select(s)
			see = se[0]['election_date']
			flash("the election date is {} so you cannot vote now".format(see))
			return redirect(url_for('user.userhome'))
	else:
		flash("your request is not accepted by teacher")
		return redirect(url_for('user.userhome'))
	return render_template('user_voting.html', data=data)

@user.route('/send_complaints',methods=['get','post'])
def send_complaints():
	ids=session['login_id']
	if 'submit' in request.form:
		complaint=request.form['complaint']
		q="insert into complaints values(null,(select user_id from user where login_id='%s'),'%s','pending',Curdate(),'user')"%(ids,complaint)
		insert(q)
		flash("Complaints Sended")
	return render_template('usersend_complaints.html')

@user.route('/complaint_status',methods=['get','post'])
def complaint_status():
	data={}
	ids=session['login_id']
	q="SELECT *,CONCAT(first_name,' ',last_name)AS NAME FROM `complaints` INNER JOIN user ON user_id=(SELECT id user_id FROM user WHERE id = user.user_id) WHERE type='user' AND id=(SELECT user_id FROM USER WHERE login_id='%s')"%(ids)
	res=select(q)
	data['comp']=res
	return render_template('userview_complaintstatus.html',data=data)

@user.route('/view_result',methods=['get','post'])
def view_result():
	data={}
	q="SELECT COUNT(`status`), candidate_id,concat(fname,' ',lname)as NAME FROM voting INNER JOIN candidates USING(candidate_id) GROUP BY candidate_id"
	res=select(q)
	data['re']=res
	return render_template('userview_result.html',data=data)
