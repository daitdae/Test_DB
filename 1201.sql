DROP TABLE members;
DROP TABLE addr;
DROP SEQUENCE addr_seq;

CREATE TABLE addr
(
    addrno        NUMBER PRIMARY KEY
    , city            VARCHAR2(20) CHECK (city IN ('서울시', '인천시', '부산시', '제주시'))
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


-- 데이터 삽입 예
INSERT INTO addr VALUES (addr_seq.NEXTVAL, '서울시', '종로구');
INSERT INTO addr VALUES (addr_seq.NEXTVAL, '인천시', '연수구');
INSERT INTO addr VALUES (addr_seq.NEXTVAL, '서울시', '강남구');
INSERT INTO addr VALUES (addr_seq.NEXTVAL, '부산시', '연제구');
INSERT INTO addr VALUES (addr_seq.NEXTVAL, '제주시', '북제주군');

SELECT * FROM addr;

COMMIT;

INSERT INTO members VALUES('hong', '홍길동', 'hong@naver.com', 1);
INSERT INTO members VALUES('son', '손오공', 'son@naver.com', 2);
INSERT INTO members VALUES('ssao', '사오정', 'ssao@korea.com', 5);
INSERT INTO members VALUES('aaa', '저팔계', 'aaa@korea.com', 3);

SELECT * FROM members;

SELECT * FROM members
WHERE usrid = 'hong';


-- 아이디, 이름, 이메일, 도시, 주소
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