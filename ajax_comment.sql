Drop table ajax_comment;
--ajax comment table

CREATE TABLE ajax_comment(
    num	 NUMBER PRIMARY KEY	
    ,name VARCHAR2(20)   NOT NULL
    ,text VARCHAR2(3000) NOT NULL
    );

--�Խ��� �۹�ȣ�� ����� ������
CREATE SEQUENCE ajax_comment_seq;

--���� �ۼ� SQL���� ��
INSERT INTO
	ajax_comment (num,name,text) 
VALUES 
	(ajax_comment_seq.nextval,'aaa','��۳���');
	
SELECT * FROM ajax_comment;



COMMIT;