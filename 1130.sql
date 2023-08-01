SELECT
	e.employee_id as empid , 
	e.first_name || ' ' || e.last_name as ename, 
	e.hire_date as hiredate, 
	e.salary as salary, 
	d.department_name as departmentname
FROM
	employees e, departments d
WHERE
	e.department_id = d.department_id
ORDER BY
    2;
    

SELECT
	e.employee_id as empid , 
	e.first_name || ' ' || e.last_name as ename, 
	e.hire_date as hiredate, 
	e.salary as salary, 
	d.department_name as departmentname
FROM
	employees e, departments d
WHERE
	e.department_id = d.department_id
    AND
    e.employee_id = 100;
    

SELECT
	e.employee_id as empid , 
	e.first_name || ' ' || e.last_name as ename, 
	e.hire_date as hiredate, 
	e.salary as salary, 
	d.department_name as departmentname
FROM
	employees e, departments d
WHERE
	e.department_id = d.department_id
    AND
    d.department_id = 80;


DROP TABLE members;
DROP TABLE addr;
DROP SEQUENCE addr_seq;

CREATE TABLE addr(
	addrno NUMBER CONSTRAINT addr_addrno_pk PRIMARY KEY,
	city VARCHAR2(20) CONSTRAINT addr_city_ck CHECK(city IN ('�����','��õ��','�λ��','���ֽ�')),
	address VARCHAR2(20)
);

CREATE SEQUENCE addr_seq; 
    
CREATE TABLE members(
	usrid VARCHAR2(15) CONSTRAINT member_usrid_pk PRIMARY KEY,
	usrname VARCHAR2(15) NOT NULL,
	email VARCHAR2(30) CONSTRAINT member_email_uqnn UNIQUE NOT NULL,
    addrno NUMBER REFERENCES addr(addrno)
);


--������ ���� ��
INSERT INTO addr VALUES (ADDR_SEQ.nextval,'�����','���α�');
INSERT INTO addr VALUES (ADDR_SEQ.nextval,'��õ��','������');
INSERT INTO addr VALUES (ADDR_SEQ.nextval,'�����','������');
INSERT INTO addr VALUES (ADDR_SEQ.nextval,'�λ��','���ʱ�');
INSERT INTO addr VALUES (ADDR_SEQ.nextval,'���ֽ�','��õ��');

DELETE FROM addr WHERE addrno= 1;

COMMIT;

INSERT INTO members VALUES('HONG','ȫ�浿','ASDF@NAVER.COM',1);
INSERT INTO members VALUES('SON','�տ���','FGH@NAVER.COM',2);
INSERT INTO members VALUES('SAO','�����','QWER@NAVER.COM',5);

COMMIT;
--���̵� �̸� �̸��� ���� �ּ�
SELECT
    m.usrid,m.usrname,m.email,a.city,a.address
FROM
    members m, addr a
WHERE
    m.addrno = a.addrno
    AND
    usrid = 'hong';