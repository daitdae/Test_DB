/* 11�� 24��(��) 
FK - 
   �θ����̺� + �ڽ����̺�
   
Sequence ��ü ���� �� ���
*/


/* ���� �����ϱ� */
DROP TABLE child_1;
DROP TABLE parent_1;

-- �θ����̺� ����
CREATE TABLE parent_1
(
    seqno     NUMBER PRIMARY KEY,
    usrname  VARCHAR2(20) NOT NULL,
    phone     VARCHAR2(10)
);

CREATE TABLE child_1
(
    seqnum  NUMBER PRIMARY KEY,
    jumin     VARCHAR2(13) NOT NULL,
    address  VARCHAR2(50),
    seqno    NUMBER  REFERENCES parent_1(seqno)
);

-- �θ����̺� ������ ����
INSERT INTO parent_1 VALUES(1, 'ȫ�浿', '1111');
INSERT INTO parent_1 VALUES(2, '���Ȱ�', '2222');
INSERT INTO parent_1 VALUES(3, '�����', '3333');


-- �ڽ����̺� ������ ����
INSERT INTO child_1 VALUES(11, '921124', '����', 1);
INSERT INTO child_1 VALUES(12, '931124', '�λ�', 2);
INSERT INTO child_1 VALUES(13, '941124', '��õ', 2);
INSERT INTO child_1 VALUES(14, '951124', '����', 3);

SELECT * FROM parent_1;
SELECT * FROM child_1;
-- 
DELETE child_1
WHERE seqno = 2;

DELETE parent_1
WHERE seqno = 2;

-- ���ο� ���̺� �����ϱ�

DROP TABLE parent_2;


CREATE TABLE parent_2
(
    seqnum NUMBER PRIMARY KEY,
    usrid     VARCHAR2(20) UNIQUE NOT NULL,
    usrname VARCHAR2(20) NOT NULL,
    email     VARCHAR2(30) UNIQUE
);

-- �Ϸù�ȣ �߻��ϴ� ��ü �����ϱ�(SEQUENCE)
DROP SEQUENCE parent2_seq;

CREATE SEQUENCE parent2_seq;  -- 1���� �߻���Ű�� ������

-- parent2_seq.nextval : ���� ���� �߻���Ŵ
-- parent2_seq.currval : ���������� �߻���Ų �Ϸù�ȣ�� ���� �˰��� �� ��

SELECT parent2_seq.nextval FROM dual; -- �������̺�(�������̺�)

SELECT parent2_seq.currval FROM dual; -- �������̺�(�������̺�)

-- parent_2 ���̺� sequence�� �̿��� �� �����ϱ�
INSERT INTO parent_2
(seqnum, usrid, usrname, email )
VALUES
(parent2_seq.nextval, 'aaa', 'ȫ�浿','aaa@korea.com' );


INSERT INTO parent_2
(seqnum, usrid, usrname, email )
VALUES
(parent2_seq.nextval, 'bbb', '�տ���','bbb@korea.com' );

SELECT * FROM parent_2;

/*
[ ���� ] score_2 ���̺��� �����Ͻÿ�
seqno : ������ ��ȣ (������ ��ü �����ؼ� ����� �� : score2_seq ) PK
seqnum : FK (on delete cascade ������ ��) FK
kor : 0
eng : 0
mat : 0
*/
DROP TABLE score_2;
DROP SEQUENCE score2_seq;

CREATE TABLE score_2
(
    seqno    NUMBER PRIMARY KEY,
    seqnum NUMBER REFERENCES parent_2(seqnum) ON DELETE CASCADE,
    kor       NUMBER(3) DEFAULT 0,
    eng      NUMBER(3) DEFAULT 0,
    mat      NUMBER(3) DEFAULT 0
);

CREATE SEQUENCE score2;

-- �ڱ� �ڽ��� �÷��� �����ϴ� ���̺� �����ϱ� 
DROP TABLE emp;

CREATE TABLE emp
(
    empno NUMBER PRIMARY KEY,
    ename VARCHAR2(20) NOT NULL,
    jobtitle VARCHAR2(30),
    mgrno NUMBER REFERENCES emp(empno)  
);

INSERT INTO emp VALUES(1, 'ȫ�浿', '��ǥ�̻�', NULL);
INSERT INTO emp VALUES(2, '�տ���', '����', 1);
INSERT INTO emp VALUES(3, '�����', '�繫', 1);

INSERT INTO emp VALUES(4, '�̸���', '��ȹ����', 2);
INSERT INTO emp VALUES(5, '������', 'ȫ������', 3);

/* ���� */
-- 1) Den �� ��� ������ ��ȸ�Ͻÿ� (DEN, den, DEn)


-- 2) D�� �����ϴ� �̸��� ���� ��� ����� ������ ��ȸ�Ͻÿ� 
--   (%:�������� ����, _ ��������)


-- 3) �̸��� 3������ ��� ����� ������ ��ȸ�Ͻÿ�.


-- 4) �μ��� 10�̰ų� 50�̰ų� 60�� �μ��� ������ ����(�̸�, �޿�, �μ�)�� ��ȸ�Ͻÿ�.  


-- 5) �μ��� 60�̰ų� �̸��� A�� �����ϴ� �����ϴ� ������ ����(�̸�, �޿�, �μ�)�� ��ȸ�Ͻÿ�.


-- 6) �޿��� 10000�� �ʰ��ϸ鼭 JOB_ID�� 'SA_REP'�� ����� �̸���, �̸�, ��ȭ��ȣ, JOB_ID ������ ��ȸ�Ͻÿ�


-- 7) �Ŵ����� 103�� ������ ����(���̵�, �̸�, �μ�, �Ŵ�����ȣ)�� ��ȸ�Ͻÿ�.


/*
�� ������ ���� �������� ���̺��� �����Ͻÿ�

1. 
���̺� �� : STAR_WARS (��ȭ ������ �����ϴ� ���̺�)
�÷� : 
 - EPISODE_ID : ���Ǽҵ� ���̵�ν�, ������ Ÿ������ �⺻ Ű
 - EPISODE_NAME : ���Ǽҵ忡 ���� ��ȭ ������ �����ϴ� �÷��̸�, 
                ���� ���� ������ Ÿ��(50 BYTE)
 - OPEN_YEAR : ���� �⵵�ν�, ������ Ÿ��(4�ڸ�)
 
2. 
���̺� �� : CHARACTERS (�����ι� ������ �����ϴ� ���̺�)
�÷� : 
 - CHARACTER_ID : �����ι� ���̵�ν�,  ���� 5�ڸ����� �⺻ Ű
 - CHARACTER_NAME : �����ι� ������ ���� ���� ������ Ÿ��(30 BYTE)�̴�.
 - MASTER_ID : �����ι��� �������� ��� ������ ���̵� ���� ������ �÷�. ���� 5�ڸ�
 - ROLE_ID : �����ι��� ���� ���̵�ν�, ������ Ÿ��.
 - EMAIL : �����ι��� �̸��� �ּҷ� �������� ������ Ÿ��(40 BYTE).

3. ���̺� �� : CASTING (�����ι��� ���� ����� ������ �����ϴ� ���̺�)
 �÷� : 
 - EPISODE_ID: ���Ǽҵ� ���̵�ν�, ������ Ÿ��(5�ڸ�)���� �⺻ Ű.
 - CHARACTER_ID: �����ι� ���̵�ν�, ������ Ÿ��(5�ڸ�)�̸� �⺻ Ű.
 - REAL_NAME : �����ι��� ���� �̸��� �����ϴ� �÷�����, �������� ������ Ÿ��(30 BYTE).
