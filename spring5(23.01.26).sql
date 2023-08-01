-- spring5 ���� ���̺� ����
-- ȸ������

DROP TABLE spring5_member;

CREATE TABLE spring5_member(
    memberid     VARCHAR2(20)  PRIMARY KEY     		--����� �ĺ�ID
    , memberpw   VARCHAR2(100) NOT NULL   			--��й�ȣ
    , membername VARCHAR2(30)  NOT NULL   			--������̸�
    , email      VARCHAR2(50)  						--�̸����ּ�
    , phone 	 VARCHAR2(50)    				    --��ȭ��ȣ
    , address	 VARCHAR2(150)						--�ּ�
    , enabled    NUMBER(1) DEFAULT 1				--���� ����(���� 1:��밡�� 0:�Ұ���)
    , rolename   VARCHAR2(20) DEFAULT 'ROLE_USER'	--Role(ȸ�����)('ROLE_USER':�Ϲ�ȸ��,'ROLE_ADMIN':������)
);


SELECT * FROM spring5_member;

-- �� ���� SQL���� ��
INSERT INTO 
	spring5_member (memberid, memberpw, membername, email, phone, address) 
VALUES 
	('aaa','111','ȫ�浿','aaa@aaa.com','010-1111-1111','����� ������ �Ｚ�� 1111');

DELETE FROM spring5_member WHERE memberid = 'zxcv';

-- Ŀ��
COMMIT;


DROP TABLE spring5_board;

--�Խ��� �� ���� ���̺�
CREATE TABLE spring5_board(
	boardnum 	 NUMBER PRIMARY KEY								 --�۹�ȣ
	,memberid	 VARCHAR2(20) REFERENCES spring5_member(memberid)--�ۼ��� ���̵�
	,title 		 VARCHAR2(300) NOT NULL							 --�� ����
	,contents 	 VARCHAR2(3000) NOT NULL						 --�� ��������
	,inputdate 	 DATE DEFAULT SYSDATE							 --�ۼ���
	,hits 		 NUMBER DEFAULT 0								 --��ȸ��
	,originfile  VARCHAR2(300)								 	 --÷������ �����̸�
	,savedfile 	 VARCHAR2(200)									 --÷�������� ������ ������̸�
);

--�Խ��� �۹�ȣ�� ����� ������
CREATE SEQUENCE spring5_board_seq;

--�� ���� SQL���� ��
INSERT INTO
	spring5_board (boardnum, memberid, title, contents) 
VALUES 
	(spring5_board_seq.nextval, 'aaa', '����20', '�� ����20');
	
SELECT * FROM spring5_board;

-- Ŀ��
COMMIT;

--���� ���̺�
CREATE TABLE spring5_reply(
    replynum NUMBER PRIMARY KEY                                            --��۹�ȣ
    ,boardnum NUMBER REFERENCES spring5_board(boardnum) ON DELETE CASCADE  --�����۹�ȣ
    ,memberid VARCHAR2(20) REFERENCES spring5_member(memberid)             --�ۼ��� ID
    ,replytext VARCHAR2(200) NOT NULL                                      --��۳���
    ,inputdate DATE DEFAULT SYSDATE                                        -- �ۼ���
);
--���ù�ȣ�� ����� ������
CREATE SEQUENCE spring5_reply_seq;

--���� �ۼ� SQL���� ��
INSERT INTO
	spring5_reply (replynum,boardnum, memberid, replytext) 
VALUES 
	(spring5_reply_seq.nextval, 1, 'aaa','��۳���');
	
SELECT * FROM spring5_reply;