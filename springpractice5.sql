--SpringPractice 5 ���� ���̺� ����
--ȸ������

DROP TABLE springpractice5_member;

CREATE TABLE springpractice5_member(
	memberid 		VARCHAR2(20) PRIMARY KEY --����� �ĺ� ID
	,memberpw 		VARCHAR2(100) NOT NULL --��й�ȣ
	,membername 	VARCHAR2(30) NOT NULL --����� �̸�
	,email 			VARCHAR2(50) -- �̸��� �ּ�
	,phone			VARCHAR2(50) -- ��ȭ��ȣ
	,address VARCHAR2(150) --�ּ�
	,enabled NUMBER(1) DEFAULT 1 --��������(����1: ��밡�� 0:�Ұ���)
	,rolename VARCHAR2(20) DEFAULT 'ROLE_USER'
);

SELECT * FROM springpractice5_member;

-- ��� ���� sql ����
INSERT INTO 
	springpractice5_member (memberid, memberpw, membername, email, phone, address) 
VALUES 
	('aaa','111','ȫ�浿','aaa@aaa.com','010-1111-1111','����� ������ �Ｚ�� 1111');

COMMIT;