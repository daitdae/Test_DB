DROP TABLE gusetbook;
DROP SEQUENCE guestbook_seq;

CREATE TABLE guestbook(
    num         NUMBER  PRIMARY KEY     --글번호
    , name      VARCHAR2(30) NOT NULL   --이름
    , password  VARCHAR2(30) NOT NULL   --비밀번호
    , contents  VARCHAR2(2000) NOT NULL --글내용
    , inputdate DATE DEFAULT SYSDATE    --작성시간
);

--방명록 글번호에 사용할 시퀀스
CREATE SEQUENCE guestbook_seq;

SELECT
    *
FROM
guestbook;

--글 저장 SQL구문 예
INSERT INTO guestbook (num, name, password, contents) VALUES (guestbook_seq.nextval, '김영희', '1111', '글 내용');