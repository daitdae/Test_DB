-- spring3 ������ ���̺�
-- �ֹε�Ϲ�ȣ, �̸�, ���� ������ ���̺� �ۼ�(person)

CREATE TABLE person(
    idnum VARCHAR2(20) PRIMARY KEY
    ,name VARCHAR2(30) NOT NULL
    ,age  NUMBER(3) DEFAULT 0
);

-- ���� ��
    COMMIT;
-- �ѹ� ��
    ROLLBACK;
    
-- 1��˻� ��
    SELECT * FROM person
    WHERE idnum = '890111-1234567';

-- ��ü ��ȸ
    SELECT * FROM person;

-- 1�� ����
    DELETE person
    WHERE idnum = '���缮';

-- 1���� ���� ����
    UPDATE person
    SET 
        age = 30
    WHERE
        idnum = '890111-1234567';

-- ������ ���� ��
    INSERT INTO person VALUES('890111-1234567', 'ȫ�浿', '34');
