create database Pharma_project;
use pharma_project;
create table medicine(medicine_id int primary key , medicine_name 
varchar(50) not null, category varchar(30) not null, price_per_unit 
int not null, stock_quantity int not null, expiry_date date );

create table Doctor(doctor_id int primary key,d_name varchar(20) not null, 
specialization varchar(50) not null, hospital_name varchar(70) not null);

create table patients(patient_id int primary key,p_name varchar(20)
not null, gender varchar(20)not null, dob date, city varchar(30));

create table prescription(prescription_id int primary key,
prescription_date date, diagnosis varchar(50),patient_id int,
doctor_id int,foreign key (doctor_id) references 
Doctor(doctor_id)on update cascade on delete 
cascade,foreign key(patient_id) references patients(patient_id)
 on update cascade on delete cascade);

create table Prescription_Details (prescription_det_id int primary key,
prescription_id int,medicine_id int, dosage varchar(30),duration int,
foreign key (prescription_id) references prescription(prescription_id)
on update cascade on delete cascade,foreign key (medicine_id) 
references medicine(medicine_id) on update cascade on delete cascade);

create table sales(sale_id int,patient_id int,medicine_id int,
quantity int,sale_date date,payment_method varchar(30),foreign key
(patient_id) references patients(patient_id) on update cascade
on delete cascade,foreign key (medicine_id) references medicine
(medicine_id) on update cascade on delete cascade);

create table suppliers(sup_id int primary key,sup_name varchar(20),
contact_num varchar(10) unique,location varchar(25));

create table Restock_alert(alert_id int primary key,medicine_id int,
alert_date date, note varchar(100),foreign key (medicine_id)
references medicine(medicine_id) on update cascade on delete 
cascade);

create table delete_prescription(prescription_date date default
(current_date),deletion_time time default (current_time),doctor_id
int,prescription_id int,patient_id int ,foreign key(prescription_id) 
references prescription(prescription_id) on update cascade
 on delete cascade,foreign key(doctor_id) references Doctor(doctor_id)
 on update cascade on delete cascade,foreign key(patient_id) 
 references patients(patient_id) on update cascade on delete 
 cascade);

create table expired_medicine_log(log_id int primary key,medicine_id
 int,expired_on date,logged_on date,foreign key (medicine_id)
 references medicine(medicine_id) on update cascade on delete 
 cascade);
 
 insert into medicine values(1001,"paracetamol","analgesic",1.50,200
 ,'2026-03-15'),(1002,"Amoxicillin","Antibiotic",3.20,150,'2025-12-01')
 ,(1003,"Cetirizine","Antihistamine",2.00,80,'2024-11-30'),(1004,
 "Metformin","Antidiabetic",5.00,50,'2027-05-20'),(1005,"Ibuprofen",
 "Analgesic",1.75,0,'2024-08-01');

insert into Doctor values(101,"Dr. Anjali Verma","General",
"City Care Hospital"),(102,"Dr. Rakesh Nair","Pediatrics","Rainbow Clinic"),
(103,"Dr. Kavita Shah","ENT","Health First Hospital");

insert into patients values(201,"Rohit Mehra","Male","1985-06-15",
"Delhi"),(202,"Neha Sharma","Female","1992-09-21","Mumbai"),(203,
"Suresh Iyer","Male","1978-12-03","Bengaluru");

insert into prescription values(301,"2024-10-12","fever",201,101);
insert into prescription values(302,"2024-11-05","Cold",202,102),
(303,"2025-01-18","Diabetes",203,101);

insert into Prescription_Details values(401,301,1001,"2 tablests/day"
,5),(402,302,1003,"1 tablets/day",3),(403,303,1004,"1 tablet/day",30);

insert into sales values(501,201,1001,10,"2024-10-12","Cash"),
(502,202,1003,5,"2024-11-05","Card"),(503,203,1004,30,"2025-01-18",
"UPI");

insert into suppliers values(601,"Medico Distributors","9876543210",
"Mumbai"),(602,"HealthPlus Pharma","9123456780","Delhi"),
(603,"LifeCare Suppliers","9988776655","Bengaluru"),(604,"Apollo 
Wholesalers","9001122334","Chennai"),(605,"Zenith Pharma Corp",
"8866442200","Hyderabad");

#tasks

select medicine_name,medicine_id from medicine where stock_quantity>10;

#select medicine_id,medicine_name from medicine    #2. ques doubt

select medicine_id,sum(quantity) as total_sold from sales group by 
medicine_id order by total_sold desc limit 3;
select prescription_id,medicine_id  

