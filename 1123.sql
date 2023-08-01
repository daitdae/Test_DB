--11�� 23��(��)
--ROLE : previlege�� ������ �ǹ��Ѵ�

--������ : LIKE������ +(Ư����ȣ %_)
-- % : ���ڸ� ����ؼ� ���ȴ� 0~n���� ����
-- _ : �Ѱ��� ���ڸ� �ǹ��Ѵ�

--[����] CLERK������ ����̸�, ������ ��ȸ
SELECT 
    first_name, job_id
FROM
    employees
--WHERE 
--  job_id LIKE '___CLERK'
WHERE 
    job_id LIKE '%CLERK'          -- �� �Ʒ� ������� ����
ORDER BY
    job_id;
    
--[����] 'J'�� �����ϴ� ������ �̸��� ��ȸ�Ͻÿ�
SELECT
    first_name
FROM
    employees
WHERE 
    first_name LIKE 'J%';
    
--[����] 1���� �Ի��� ������ �̸�, �Ի���, ��ȭ��ȣ�� ��ȸ�Ͻÿ� '___01___' or '__/01/__' or 
--                                          '%01%'(�̰� �տ� �����Ͱ� ��� �Ǽ� 01���̳� 1�Ͽ� �Ի��� ������� ���´�)
SELECT
    first_name, hire_date, phone_number
FROM
    employees
WHERE
    hire_date LIKE '__/01/__';
    
--[����] ��ȭ��ȣ�� 515�� �����ϴ� ������ �̸�,�Ի��� ��ȭ��ȣ�� ��ȸ�Ͻÿ�.
SELECT
    first_name, hire_date, phone_number
FROM
    employees
WHERE
    phone_number LIKE '515%';

--desc employees : employees �ȿ� ���� �ִ��� Ȯ���Ҽ� �ִ� �ڵ�

--DDL(Data Definition Language) : Create, Alter, Drop
/*CREATE TABLE ���̺��(
    �÷��� ������ Ÿ�� [CONSTRAINT �������Ǹ�(�������Ǹ� : ���̺��_�÷���_Ÿ��)]  �������ǵ�,
    �÷��� ������ Ÿ�� [CONSTRAINT �������Ǹ�(�������Ǹ� : ���̺��_�÷���_Ÿ��)]  �������ǵ�,
    �÷��� ������ Ÿ�� [CONSTRAINT �������Ǹ�(�������Ǹ� : ���̺��_�÷���_Ÿ��)]  �������ǵ�,
); 
*/
CREATE TABLE customer (
    usrid CHAR(5) CONSTRAINT customer_usrid_pk PRIMARY KEY,
    age NUMBER(3) NOT NULL,
    usrname VARCHAR(20),
    height NUMBER(10,2) DEFAULT 0,            -- �Ҽ���(�˳����� ��, �ڸ���)
    weight NUMBER(10,2) DEFAULT 0,
    address VARCHAR(100) 
);

--DROP TABLE customer; ���̺� ���ִ� ���

SELECT * FROM customer;

/*INSERT: ������ ���Ը��

INSERT INTO ���̺��
(�÷���...) 1,2,3,4,5
VALUES
(������...) 1,2,3,4,5 ; �÷���� ���缭 ������ ������� ����
*/

INSERT INTO customer
(usrid,age,usrname,height,weight,address)
VALUES
('aaa', 31, 'ȫ�浿', 176, 67.5, '����� ��������');

INSERT INTO customer        --������� �� �־��� ��쿣 �÷��� �������� (usrid...��������)
VALUES
('bbb', 32, '���Ȱ�', 188, 88.5, '����� ���۱�');

INSERT INTO customer
(usrid,age,address)     --�Ϻθ� �־����� �÷��� ���� �Ұ�
VALUES
('ccc', 23, '����� ���۱�');

INSERT INTO customer
(usrid, usrname, age,address)     
VALUES
('ccc', '�տ���', 23, '����� ���۱�');



COMMIT; --save //commit �ϸ� �ѹ� �ȵ�

--DELETE : ���ڵ� ���� 0~ALL ����
DELETE FROM customer;

--DELETE + WHERE : ���Ǻ� ����
DELETE FROM customer
WHERE usrname IS NULL;

COMMIT;

--UPDATE : ���ڵ� ���� WHERE ������ �ʿ��� ������ �ѹ��� �� �ٲ�
UPDATE customer
SET
    height = 177.7
    ,weight = 77.7
WHERE
    usrid='ccc';
    
SELECT
    *
FROM customer;

ROLLBACK;       --Ʈ�������� ������ �� ���±��� �ǵ����°� Ŀ�������� �Ұ���

-- "member" ���̺�� ���鶧 �ȵȴ� �ϸ� ū ����ǥ ���̸� �����ϱ� �ѵ� ����


/*[����] members ���̺��� ������ �� insert update delete commit rollback �����ϱ�
seqno ���� pk
usrid �������ڿ� 30�ڸ� unique nn
usrname  �������ڿ� 30�ڸ� nn
birth ��¥
joindate ��¥
gender ���� �������� ���ڿ� 1byte
*/

CREATE TABLE members(
 seqno NUMBER CONSTRAINT members_seqno_pk PRIMARY KEY,
 usrid VARCHAR(30) CONSTRAINT members_usrid_uqnn UNIQUE NOT NULL,
 usrname VARCHAR(30) CONSTRAINT members_usrname_nn NOT NULL,
 birth DATE,
 joindate DATE,     -- ���糯¥ �Է� : DATE DEFAULT SYSDATE;
 gender CHAR(1)     -- ������ ���� ���� �ϴ� �������� : 
                    -- DEFAULT 'M'(���� ������ ����Ʈ�� M�ְڴ� �ٸ� ������ ������ �տ��;� ��) CONSTRAINT members_members_ck CHECK (gender IN ('M', 'F'))
);


INSERT INTO members
(seqno, usrid, usrname, birth, joindate, gender)
VALUES
(1,'aaa','name','01/10/10', '03/12/12', 'm');

INSERT INTO members
(seqno, usrid, usrname, birth, joindate, gender)
VALUES
(2,'bbb','james','01/10/10', sysdate , 'm');    -- ���糯¥ ����: sysdate

UPDATE members
SET 
    birth = '03/01/25', 
    usrid = 'Paul'
WHERE
    usrid = 'aaa';
    
DELETE FROM members;

ROLLBACK;

SELECT
    *
FROM members;




