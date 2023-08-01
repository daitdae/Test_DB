/*11�� 24��(��)
FK - 
    �θ����̺�+�ڽ����̺�
    
    Sequence ��ü ���� �� ���
*/

/*���������ϱ�
DROP TABLE child_1
DROP TABLE Parent_1 ���ٶ� ���̸���*/

--�θ����̺� ����
CREATE TABLE Parent_1
(
    seqno NUMBER PRIMARY KEY,
    usrname VARCHAR2(20) NOT NULL,
    phone VARCHAR2(10)
    );
    
CREATE TABLE child_1
(
    seqnum NUMBER PRIMARY KEY,
    jumin VARCHAR2(13) NOT NULL,
    address VARCHAR2(50),
    seqno NUMBER REFERENCES Parent_1(seqno) ON DELETE CASCADE --�������Ἲ �θ��� ���ڵ带 ����� ���õ� �ڽ��� ���ڵ嵵 �����
    );
    
--�θ����̺� ������ ����
INSERT INTO parent_1 VALUES(1, 'ȫ�浿', '1111');
INSERT INTO parent_1 VALUES(2, '���Ȱ�', '2222');
INSERT INTO parent_1 VALUES(3, '�����', '3333');

--�ڽ����̺� ������ ����
INSERT INTO child_1 VALUES(11, '921224', '����', 1);
INSERT INTO child_1 VALUES(12, '930111', '�λ�', 2);
INSERT INTO child_1 VALUES(13, '940112', '�뱸', 2);
INSERT INTO child_1 VALUES(14, '951124', '����', 3);

--������ ����
DELETE parent_1
WHERE seqno =2;

--ON DELETE CASCADE �ɰ� �Ȱɰ� ���� �Ȱɷ������� �ڽİ� ���� ������ �Ѵ�
--���� ����� �ϴ� DELETE�� �ϰ� �ڽĸ��� ����°� ��Ģ
DELETE CHILD_1
WHERE seqno =2;

--���ο� ���̺� �����ϱ�
DROP TABLE parent_2;
CREATE TABLE parent_2 (
    seqnum NUMBER PRIMARY KEY,
    usrid VARCHAR2(20) UNIQUE NOT NULL,
    usrname VARCHAR2(20) NOT NULL,
    email VARCHAR2(30) UNIQUE
);

-- ������ ���� �� ��
DROP SEQUENCE parent2_seq;

-- �Ϸù�ȣ�� �߻��ϴ� ��ü �����ϱ�(SEQUENCE)
CREATE SEQUENCE parent2_seq;    --1���� �߻���Ű�� ������

--parent2_seq.nextval: ���� ���� �߻���Ų��(�տ� ��������� �ؽ�Ʈ���� ��������� .�� ����ش�)
--parent2_seq.currval: ���� �󸶱��� �߻��Ǿ��°�?(���������� �߻���Ų �Ϸù�ȣ�� ���� �˰��� �Ҷ�)

SELECT parent2_seq.nextval FROM dual;
SELECT parent2_seq.currval FROM dual; -- �������̺�(���� ���̺�)

--parent_2 ���̺� sequence �� �̿��� �� �����ϱ�
INSERT INTO parent_2
(seqnum, usrid, usrname, email) --��������
VALUES
(parent2_seq.nextval, 'aaa', 'ȫ�浿', 'aaa@korea.com');

INSERT INTO parent_2
(seqnum, usrid, usrname, email) 
VALUES
(parent2_seq.nextval, 'bbb', '�տ���', 'bbb@korea.com');

SELECT*FROM parent_2;


/*[����] score_2���̺��� �����Ͻÿ�
seqno: ��������ȣ(������ ��ü �����ؼ� ����Ұ�: score2_seq)
seqnum: FK (on delete cascade �����Ұ�
kor : 0
eng : 0
mat : 0 */
DROP TABLE score_2;
DROP SEQUENCE score2_seq;

CREATE TABLE score_2(
    seqno NUMBER PRIMARY KEY,
    seqnum NUMBER REFERENCES Parent_2(seqnum) ON DELETE CASCADE,
    kor NUMBER(3) DEFAULT 0,
    eng NUMBER(3) DEFAULT 0,
    mat NUMBER(3) DEFAULT 0
);

CREATE SEQUENCE score2_seq;

--�ڱ� �ڽ��� Į���� �����ϴ� ���̺� �����ϱ�
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
INSERT INTO emp VALUES(3, '�����', '��', 1);
INSERT INTO emp VALUES(4, '�̸���', '��ȹ����', 2);
INSERT INTO emp VALUES(5, '������', 'ȫ������', 3);

SELECT
    employee_id, FIRST_NAME, JOB_ID, MANAGER_ID
FROM employees;

/*�Լ� �������� ����*/

--initcap�� ù���ڸ��빮��
SELECT FIRST_NAME, lower(first_name), upper(first_name), initcap(first_name) 
FROM employees;

--length(), concat()
SELECT FIRST_NAME, length(FIRST_NAME), concat(FIRST_NAME,'��')
FROM employees;

-- substr(���ڿ�, n), substr(���ڿ�, n1, n2) ����Ŭ�� �ε����� 1���� ����
SELECT substr('����ȭ ���� �Ǿ����ϴ�.', 7)
FROM dual;          --�������������Ƿ� ���̿���

SELECT substr('����ȭ ���� �Ǿ����ϴ�.', 5, 1)
FROM dual;   

--substr�� �̿��ؼ� ���� �ش��ϴ� ������ �����Ͻÿ�
SELECT sysdate, substr(sysdate,4,2)
FROM dual;

--employees ���̺��� hire_dateĮ������ �Ի翬����(substr)�� �����Ͻÿ�.
SELECT hire_date, substr(hire_date,1,2)
FROM employees;

--employees ���̺��� hire_dateĮ������ �Ի翬��(substr, concat)�� �����Ͻÿ�. 03
SELECT hire_date,concat(substr(hire_date,1,2), '��')
FROM employees;

--replace()
SELECT '010-1234-4567' as "��ȭ��ȣ", replace('010-1234-4567', '-' ,'/') as "������ ��ȭ��ȣ"
FROM dual;

--�����Լ�
SELECT 
    1234.5678, 
    ROUND(1234.5678, 2),
    ROUND(1234.5678, 0),
    ROUND(1234.5678, -1)
FROM dual;

SELECT 
    1234.5678, 
    ceil(1234.5678),
    floor(1234.5678)
FROM dual;

SELECT 
    -1234.5678, 
    ROUND(-1234.5678, 2),
    ROUND(-1234.5678, -1),
    ceil(-1234.5678),
    floor(-1234.5678)
FROM dual;




