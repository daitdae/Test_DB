CREATE TABLE gymmember(
	
	usrid	VARCHAR2(20) PRIMARY KEY,	--������ ȸ�� ���̵�
	usrname VARCHAR2(30) NOT NULL,		--ȸ���̸�
	weight 	NUMBER(6, 2) DEFAULT 0.0,	--ȸ���� ������
	height 	NUMBER(6, 2) DEFAULT 0.0,	--ȸ���� Ű 
	bmi		NUMBER(6, 2) DEFAULT 0.0,	--ȸ���� ŰBMI
	result	VARCHAR2(30) CHECK (result IN ('����','�ߵ���','�浵��',
     										'��ü��', '����','��ü��')),
	joindate	DATE	 DEFAULT SYSDATE
);
