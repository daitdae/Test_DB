DROP TABLE guestbookPr;
DROP SEQUENCE guestbookPr_seq;

CREATE TABLE guestbookPr(
    num            NUMBER PRIMARY KEY      --�۹�ȣ 
    ,name          VARCHAR2(30) NOT NULL   --�̸�
    ,password      VARCHAR2(30) NOT NULL   --��й�ȣ
    ,contents      VARCHAR2(2000) NOT NULL --�� ����
    ,inputdate     DATE DEFAULT SYSDATE    --�ۼ��ð�
);

--���� �۹�ȣ�� ����� ������
CREATE SEQUENCE guestbookPr_seq;

--�� ���� SQL ���� ��
INSERT INTO 
    guestbookPr(num, name, password, contents)
VALUES
    (guestbookPr_seq.nextval, 'ȫ�浿', '1111', '���볻�볻��');
    
COMMIT;

select*from guestbookPr;