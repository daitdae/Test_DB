-- spring practice2 ������ ���̺�
-- �ֹε�Ϲ�ȣ, �̸�, ���� ������ ���̺� �ۼ�(personPr)
CREATE TABLE personPr(
    idnum VARCHAR2(20) PRIMARY KEY
    , name VARCHAR2(30)
    , age NUMBER(3) DEFAULT 0
);

-- ���� ��
    COMMIT;
    
-- ������ ���� ��
    INSERT INTO personPr VALUES('123456-1234567','ȫ�浿',34);
    INSERT INTO personPr VALUES('1111','�Ӳ���',35);
    INSERT INTO personPr VALUES('2222','�����',30);
    INSERT INTO personPr VALUES('3333','���Ȱ�',39);
    
-- 1��˻� ��
    SELECT * FROM personPr
    WHERE idnum ='123456-1234567';
    
-- ��ü ��ȸ
    SELECT * FROM personPr;

-- 1�� ����
    DELETE personPr
    WHERE idnum ='123456-1234567';

-- 1���� ���� ����
    UPDATE personPr
    SET
        age=30
    WHERE
       idnum ='123456-1234567';
