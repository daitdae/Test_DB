--11�� 29��(ȭ)
--Java�� �����ϱ� ���� ���� ���̺� �ۼ�

--ȸ������ ���̺�
CREATE TABLE usrinfo(
    usrid   VARCHAR2(20) PRIMARY KEY,
    usrname VARCHAR2(20) NOT NULL,
    age     NUMBER(3)  DEFAULT 0
    );
    

--���õ����� �־��
INSERT INTO usrinfo VALUES ('AAA','�տ���',29);
INSERT INTO usrinfo VALUES ('BBB','���Ȱ�',31);
INSERT INTO usrinfo VALUES ('CCC','�����',24);
INSERT INTO usrinfo VALUES ('DDD','�Ӳ���',45);
INSERT INTO usrinfo VALUES ('EEE','ȫ�浿',35);

-- Ʈ������ ������(����)
COMMIT;
