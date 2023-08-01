-- �߰�ŷ� ����Ʈ ����


-- ȸ������ ���̺�
create table market_member (
	memberid     VARCHAR2(20)  PRIMARY KEY     		--����� �ĺ�ID
    , memberpw   VARCHAR2(100) NOT NULL   			--��й�ȣ
    , membername VARCHAR2(20)  NOT NULL   			--������̸�
    , phone 	 VARCHAR2(20)  NOT NULL   	        --��ȭ��ȣ
    , enabled    NUMBER(1) DEFAULT 1				--���� ����(���� 1:��밡�� 0:�Ұ���)
    , rolename   VARCHAR2(20) DEFAULT 'ROLE_USER'	--Role(ȸ�����)('ROLE_USER':�Ϲ�ȸ��,'ROLE_ADMIN':������)
);

SELECT * FROM market_member;

-- �Ǹű� ���̺�
create table market_board (
	boardnum 	 NUMBER PRIMARY KEY								 --�۹�ȣ
	,memberid	 VARCHAR2(20)  NOT NULL	     					 --�ۼ��� ���̵�
	,title 		 VARCHAR2(200) NOT NULL							 --�� ����
	,contents 	 VARCHAR2(2000) NOT NULL						 --�� ��������
	,inputdate 	 DATE DEFAULT SYSDATE							 --�ۼ���
	,category	 VARCHAR2(50)									 --��ǰ�з�
	,soldout	 CHAR(1)	DEFAULT 'N'						     --�ǸſϷῩ��
	,buyerid	 VARCHAR2(20)								     --�����ھ��̵�
);

--�Ǹű� �Ϸù�ȣ ������
CREATE SEQUENCE market_board_seq;

SELECT * FROM market_board;

-- ���� ���̺�
create table market_reply (
	replynum 	NUMBER PRIMARY KEY                                          --��۹�ȣ
    ,boardnum   NUMBER REFERENCES market_board(boardnum) ON DELETE CASCADE  --�����۹�ȣ
    ,memberid   VARCHAR2(20)   NOT NULL       					            --�ۼ��� ID
    ,replytext 	VARCHAR2(500)                                  				--���ó���
    ,inputdate 	DATE DEFAULT SYSDATE       
);

--���� �Ϸù�ȣ ������
CREATE SEQUENCE  market_reply_seq;

SELECT * FROM market_reply;
 
--Ŀ��
COMMIT;
