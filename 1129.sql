--11월 29일(화)
--Java와 연동하기 위한 샘플 테이블 작성

--회원정보 테이블
CREATE TABLE usrinfo(
    usrid   VARCHAR2(20) PRIMARY KEY,
    usrname VARCHAR2(20) NOT NULL,
    age     NUMBER(3)  DEFAULT 0
    );
    

--샘플데이터 넣어보기
INSERT INTO usrinfo VALUES ('AAA','손오공',29);
INSERT INTO usrinfo VALUES ('BBB','저팔계',31);
INSERT INTO usrinfo VALUES ('CCC','사오정',24);
INSERT INTO usrinfo VALUES ('DDD','임꺽정',45);
INSERT INTO usrinfo VALUES ('EEE','홍길동',35);

-- 트랜젝션 마무리(저장)
COMMIT;
