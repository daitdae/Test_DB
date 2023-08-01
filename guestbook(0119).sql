DROP TABLE gusetbook;
DROP SEQUENCE guestbook_seq;

CREATE TABLE guestbook(
    num         NUMBER  PRIMARY KEY     --�۹�ȣ
    , name      VARCHAR2(30) NOT NULL   --�̸�
    , password  VARCHAR2(30) NOT NULL   --��й�ȣ
    , contents  VARCHAR2(2000) NOT NULL --�۳���
    , inputdate DATE DEFAULT SYSDATE    --�ۼ��ð�
);

--���� �۹�ȣ�� ����� ������
CREATE SEQUENCE guestbook_seq;

SELECT
    *
FROM
guestbook;

--�� ���� SQL���� ��
INSERT INTO guestbook (num, name, password, contents) VALUES (guestbook_seq.nextval, '�迵��', '1111', '�� ����');