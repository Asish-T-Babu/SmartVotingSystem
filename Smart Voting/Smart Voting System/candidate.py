from flask import*
from database import*
candidate=Blueprint('candidate',__name__)

@candidate.route('/canhome',methods=['get','post'])
def canhome():
		return render_template('candidatehome.html')

@candidate.route('/myprofile',methods=['get','post'])
def myprofile():
	data={}
	ids = session['login_id']
	data={}
	q="select *,concat(fname,' ',lname)as NAME from candidates inner join categories using(category_id) inner join logo using(logo_id) where login_id='%s'"%(ids)
	res=select(q)
	data['can']=res
	return render_template('canview_myprofile.html',data=data)

@candidate.route('/send_application',methods=['get','post'])
def send_application():
	ids=session['login_id']
	if 'submit' in request.form:
		application=request.form['application']
		q="insert into applications values(null,(select candidate_id from candidates where login_id='%s'),'pending','%s',Curdate())"%(ids,application)
		insert(q)
		flash("Application Sended")
	return render_template('cansend_application.html')

@candidate.route('/application_status',methods=['get','post'])
def application_status():
	data={}
	ids=session['login_id']
	q="select *,concat(fname,' ',lname)as NAME from applications inner join candidates using(candidate_id)inner join categories using(category_id) inner join logo using(logo_id) where login_id='%s'"%(ids)
	res=select(q)
	data['app']=res
	return render_template('canview_applicationstatus.html',data=data)

@candidate.route('/view_users',methods=['get','post'])
def view_users():
	data={}
	q="select *,concat(first_name,' ',last_name)as NAME from user"
	res=select(q)
	data['us']=res
	return render_template('canview_users.html',data=data)

@candidate.route('/send_complaints',methods=['get','post'])
def send_complaints():
	ids=session['login_id']
	if 'submit' in request.form:
		complaint=request.form['complaint']
		q="insert into complaints values(null,(select candidate_id from candidates where login_id='%s'),'%s','pending',Curdate(),'candidate')"%(ids,complaint)
		insert(q)
		flash("Complaints Sended")
	return render_template('cansend_complaints.html')

@candidate.route('/complaint_status',methods=['get','post'])
def complaint_status():
	data={}
	ids=session['login_id']
	q="SELECT *,CONCAT(fname,' ',lname)AS NAME FROM `complaints` INNER JOIN candidates ON candidate_id=(SELECT id candidate_id FROM candidates WHERE id = candidates.candidate_id) WHERE type='candidate' AND id=(SELECT candidate_id FROM candidates WHERE login_id='%s')"%(ids)
	res=select(q)
	data['comp']=res
	return render_template('canview_complaintstatus.html',data=data)

@candidate.route('/view_rules',methods=['get','post'])
def view_rules():
	data={}
	q="select * from rules"
	res=select(q)
	data['ru']=res
	return render_template('canview_rules.html',data=data)

@candidate.route('/date_decalration',methods=['get','post'])
def date_declaration():
	data={}
	q="select * from election inner join categories using(category_id)"
	res=select(q)
	data['el']=res
	return render_template('canview_datedeclaration.html',data=data)

@candidate.route('/view_result',methods=['get','post'])
def view_result():
	data={}
	q="SELECT COUNT(`status`), candidate_id,concat(fname,' ',lname)as NAME FROM voting INNER JOIN candidates USING(candidate_id) GROUP BY candidate_id"
	res=select(q)
	data['re']=res
	return render_template('canview_result.html',data=data)