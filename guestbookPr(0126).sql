DROP TABLE guestbookPr;
DROP SEQUENCE guestbookPr_seq;

CREATE TABLE guestbookPr(
    num            NUMBER PRIMARY KEY      --글번호 
    ,name          VARCHAR2(30) NOT NULL   --이름
    ,password      VARCHAR2(30) NOT NULL   --비밀번호
    ,contents      VARCHAR2(2000) NOT NULL --글 내용
    ,inputdate     DATE DEFAULT SYSDATE    --작성시간
);

--방명록 글번호에 사용할 시퀀스
CREATE SEQUENCE guestbookPr_seq;

--글 저장 SQL 구문 예
INSERT INTO 
    guestbookPr(num, name, password, contents)
VALUES
    (guestbookPr_seq.nextval, '홍길동', '1111', '내용내용내용');
    
COMMIT;

select*from guestbookPr;