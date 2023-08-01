CREATE TABLE gymmember(
	
	usrid	VARCHAR2(20) PRIMARY KEY,	--가입한 회원 아이디
	usrname VARCHAR2(30) NOT NULL,		--회원이름
	weight 	NUMBER(6, 2) DEFAULT 0.0,	--회원의 몸무게
	height 	NUMBER(6, 2) DEFAULT 0.0,	--회원의 키 
	bmi		NUMBER(6, 2) DEFAULT 0.0,	--회원의 키BMI
	result	VARCHAR2(30) CHECK (result IN ('고도비만','중도비만','경도비만',
     										'과체중', '정상','저체중')),
	joindate	DATE	 DEFAULT SYSDATE
);
