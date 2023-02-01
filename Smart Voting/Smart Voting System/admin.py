from flask import*
from database import*
import uuid
admin=Blueprint('admin',__name__)

@admin.route('/adminhome',methods=['get','post'])
def adminhome():
	return render_template('adminhome.html')

@admin.route('/add_logo',methods=['get','post'])
def add_logo():
	if 'submit' in request.form:
		logo_name=request.form['logo_name']
		image=request.files['image']
		path='static/uploads/'+str(uuid.uuid4())+image.filename
		image.save(path)
		q="select * from logo where logo_name='%s'"%(logo_name)
		res=select(q)
		if len(res)>0:
			flash("Already Exists")
		else:	
			q="insert into logo values(null,'%s','%s')"%(logo_name,path)
			insert(q)
			flash("Logo Added.")
	return render_template('adminadd_logo.html')

@admin.route('/view_logo',methods=['get','post'])
def view_logo():
	data={}
	q="select * from logo"
	res=select(q)
	data['lo']=res
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None
	if action=="delete":
		q="delete from logo where logo_id='%s'"%(id)
		delete(q)
		flash("Logo Deleted")
		return redirect(url_for('admin.view_logo'))
	return render_template('adminview_logo.html',data=data)

@admin.route('/addelection_rules',methods=['get','post'])
def addelection_rules():
	if 'submit' in request.form:
		title=request.form['title']
		rules=request.form['rules']
		q="select * from rules where title='%s'"%(title)
		res=select(q)
		if len(res)>0:
			flash("Already Exists")
		else:
			q="insert into rules values(null,'%s','%s')"%(title,rules)
			insert(q)
			flash("Rules Added")	
	return render_template('adminadd_electionrules.html')

@admin.route('/view_rules',methods=['get','post'])
def view_rules():
	data={}
	q="select * from rules"
	res=select(q)
	data['ru']=res
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None
	if action=="delete":
		q="delete from rules where rule_id='%s'"%(id)
		delete(q)
		flash("Rule Deleted")
		return redirect(url_for('admin.view_rules'))
	return render_template('adminview_rules.html',data=data)

@admin.route('/add_category',methods=['get','post'])
def add_category():
	if 'submit' in request.form:
		cname=request.form['cname']
		des=request.form['des']
		q="select * from categories where cat_name='%s'"%(cname)
		res=select(q)
		if len(res)>0:
			flash("Already Exists")
		else:
			q="insert into categories values(null,'%s','%s')"%(cname,des)
			insert(q)
			flash("Category Added")
	return render_template('adminadd_category.html')

@admin.route('/add_electiondetails',methods=['get','post'])
def add_electiondetails():
	data={}
	if 'submit' in request.form:
		cname=request.form['cname']
		title=request.form['title']
		date=request.form['date']
		stime=request.form['stime']
		etime=request.form['etime']
		q="insert into election values(null,'%s','%s','%s','%s','%s','pending')"%(cname,title,date,stime,etime)
		insert(q)
		flash("Election Date Declared")
	q="select * from categories"
	res=select(q)
	data['cat']=res
	return render_template('adminadd_electiondetails.html',data=data)

@admin.route('/view_electiondetails',methods=['get','post'])
def view_electiondetails():
	data={}
	q="select * from election inner join categories using(category_id)"
	res=select(q)
	data['el']=res
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None
	if action=="delete":
		q="delete from election where election_id='%s'"%(id)
		delete(q)
		flash("Election Details Deleted")
		return redirect(url_for('admin.view_electiondetails'))
	return render_template('adminview_electiondetails.html',data=data)

@admin.route('/add_newCandidate',methods=['get','post'])
def add_newCandidate():
	data={}
	if 'submit' in request.form:
		title=request.form['lo']
		cname=request.form['cname']
		fname=request.form['fname']
		lname=request.form['lname']
		gender=request.form['gender']
		address=request.form['address']
		place=request.form['place']
		email=request.form['email']
		phone=request.form['phone']
		photo=request.files['photo']
		path='static/uploads/'+str(uuid.uuid4())+photo.filename
		photo.save(path)
		username=request.form['username']
		password=request.form['password']
		q="select * from login where username='%s' and password='%s'"%(username,password)
		res=select(q)
		if len(res)>0:
			flash("Already Exists")
		else:
			q="insert into login values(null,'%s','%s','Candidate')"%(username,password)
			res=insert(q)
			q="insert into candidates values(NULL,'%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')"%(res,title,cname,fname,lname,gender,address,place,email,phone,path)
			insert(q)
			flash("Candidate Registered Successfully")
	q="select * from categories"
	res=select(q)
	data['cat']=res
	q="select * from logo"
	res=select(q)
	data['lo']=res
	return render_template('adminadd_candidate.html',data=data)

@admin.route('/view_candidate',methods=['get','post'])
def view_candidate():
	data={}
	q="select *,concat(fname,' ',lname)as NAME from candidates inner join categories using(category_id) inner join logo using(logo_id)"
	res=select(q)
	data['can']=res
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
		id1=request.args['id1']
	else:
		action=None
	if action=="delete":
		q="delete from login where login_id='%s'"%(id1)
		delete(q)
		q="delete from candidates where candidate_id='%s'"%(id)
		delete(q)
		flash("Candidate Details Deleted")
		return redirect(url_for('admin.view_candidate'))
	return render_template('adminview_candidate.html',data=data)


@admin.route('/application_status',methods=['get','post'])
def application_status():
	data={}
	q="select *,concat(fname,' ',lname)as NAME from applications inner join candidates using(candidate_id)inner join categories using(category_id) inner join logo using(logo_id)"
	res=select(q)
	data['app']=res
	if 'id' in request.args:
		id=request.args['id']
		q="update applications set  status='Application Accept'  where application_id='%s' and status='pending'"%(id)
		update(q)
		return redirect(url_for('admin.application_status'))
	elif 'id1' in request.args:
		id1=request.args['id1']
		q="update applications set  status='Application Reject'  where application_id='%s' and status='pending'"%(id1)
		update(q)
		return redirect(url_for('admin.application_status'))
	return render_template('adminview_applicationstatus.html',data=data)

@admin.route('/view_users',methods=['get','post'])
def view_users():
	data={}
	q="select *,concat(first_name,' ',last_name)as NAME from user"
	res=select(q)
	data['us']=res
	return render_template('adminview_users.html',data=data)


@admin.route('/view_complaints',methods=['get','post'])
def view_complaints():
	data={}
	q="select * from complaints"
	res=select(q)
	data['comp']=res
	j=0
	for i in range(1,len(res)+1):
		if 'submit' + str(i) in request.form:
			solution=request.form['solution'+str(i)]
			q="UPDATE complaints SET solution='%s' WHERE complaint_id='%s'" %(solution,res[j]['complaint_id'])
			update(q)
			flash("send message")
			return redirect(url_for('admin.view_complaints'))
		j=j+1
	return render_template('adminview_complaints.html',data=data)

@admin.route('/view_result',methods=['get','post'])
def view_result():
	data={}
	q="SELECT COUNT(`status`), candidate_id,concat(fname,' ',lname)as NAME FROM voting INNER JOIN candidates USING(candidate_id) GROUP BY candidate_id"
	res=select(q)
	data['re']=res
	return render_template('adminview_result.html',data=data)


@admin.route('/teacher_status',methods=['get','post'])
def teacher_status():
	data={}
	q = "select *,concat(first_name,' ',last_name)as NAME from teacherapplication inner join teacher using(teacher_id)"
	res=select(q)
	data['app']=res
	if 'id' in request.args:
		id = request.args['id']
		q = "update teacherapplication set  status='Application Accept'  where teacherapplication_id='%s' and status='pending'" % (
		id)
		update(q)
		return redirect(url_for('admin.teacher_status'))
	elif 'id1' in request.args:
		id1=request.args['id1']
		q="update teacherapplication set  status='Application Reject'  where teacherapplication_id='%s' and status='pending'"%(id1)
		update(q)
		return redirect(url_for('admin.teacher_status'))
	return render_template('adminview_teacherstatus.html',data=data)
















	