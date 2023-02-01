from flask import*
from database import*
# import uuid
teacher=Blueprint('teacher',__name__)


@teacher.route('/teacherhome',methods=['get','post'])
def teacherhome():
	return render_template('teacherhome.html')

@teacher.route('/myprofile',methods=['get','post'])
def myprofile():
	data={}
	ids=session['login_id']
	q="select *,concat(first_name,' ',last_name)as NAME from teacher where login_id='%s'"%(ids)
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
		return redirect(url_for('teacher.myprofile'))
	return render_template('teacherview_myprofile.html',data=data)

@teacher.route('/user_status',methods=['get','post'])
def user_status():
	ids = session['login_id']
	r = "select * from teacherapplication where teacher_id=(select teacher_id from teacher where login_id='%s')" % (ids)
	re = select(r)
	ree=re[0]['status']
	if (ree == 'Application Accept'):
		data = {}
		q = "select *,concat(first_name,' ',last_name)as NAME from userapplication inner join user using(user_id) where user.department=(select department from teacher where login_id='%s')"% (ids)
		res = select(q)
		data['app'] = res

		if 'id' in request.args:
			id = request.args['id']
			q = "update userapplication set  status='Application Accept'  where userapplication_id='%s' and status='pending'" % (
				id)
			update(q)
			return redirect(url_for('teacher.user_status'))
		elif 'id1' in request.args:
			id1 = request.args['id1']
			q = "update userapplication set  status='Application Reject'  where userapplication_id='%s' and status='pending'" % (
				id1)
			update(q)
			return redirect(url_for('teacher.user_status'))
		# return render_template('teacherview_userstatus.html', data=data)
	else:
		flash("your request is not accepted by admin")
		return redirect(url_for('teacher.teacherhome'))
	return render_template('teacherview_userstatus.html', data=data)

@teacher.route('/view_users',methods=['get','post'])
def view_users():
	data = {}
	ids = session['login_id']
	q = "select *,concat(first_name,' ',last_name)as NAME from user where department=(select department from teacher where login_id='%s')" % (ids)
	res = select(q)
	data['us'] = res
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
		flash("User Deleted")
		return redirect(url_for('teacher.view_users'))
	return render_template('teacherview_users.html', data=data)
