DROP TABLE members;
DROP TABLE addr;
DROP SEQUENCE addr_seq;

CREATE TABLE addr
(
    addrno        NUMBER PRIMARY KEY
    , city            VARCHAR2(20) CHECK (city IN ('�����', '��õ��', '�λ��', '���ֽ�'))
    , address      VARCHAR2(20)
);

CREATE SEQUENCE addr_seq;

CREATE TABLE members
(
    usrid             VARCHAR2(15) PRIMARY KEY
    , usrname     VARCHAR2(20) NOT NULL
    , email       VARCHAR2(30) UNIQUE NOT NULL
    , addrno     NUMBER REFERENCES addr(addrno)
);


-- ������ ���� ��
INSERT INTO addr VALUES (addr_seq.NEXTVAL, '�����', '���α�');
INSERT INTO addr VALUES (addr_seq.NEXTVAL, '��õ��', '������');
INSERT INTO addr VALUES (addr_seq.NEXTVAL, '�����', '������');
INSERT INTO addr VALUES (addr_seq.NEXTVAL, '�λ��', '������');
INSERT INTO addr VALUES (addr_seq.NEXTVAL, '���ֽ�', '�����ֱ�');

SELECT * FROM addr;

COMMIT;

INSERT INTO members VALUES('hong', 'ȫ�浿', 'hong@naver.com', 1);
INSERT INTO members VALUES('son', '�տ���', 'son@naver.com', 2);
INSERT INTO members VALUES('ssao', '�����', 'ssao@korea.com', 5);
INSERT INTO members VALUES('aaa', '���Ȱ�', 'aaa@korea.com', 3);

SELECT * FROM members;

SELECT * FROM members
WHERE usrid = 'hong';


-- ���̵�, �̸�, �̸���, ����, �ּ�
SELECT
    m.usrid, m.usrname, m.email, a.city, a.address
FROM
    members m, addr a
WHERE
    m.addrno = a.addrno
    AND
    usrid = 'hong';
    
select 
    account_number,
    team_code,
    player_name,
    height,
    weight,
    player_position,
    back_number,
    nationality,
    TO_CHAR(player_birthdate,'YY/MM/DD') as player_birthdate
from player;