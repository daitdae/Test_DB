-- spring practice2 예제의 테이블
-- 주민등록번호, 이름, 나이 저장할 테이블 작성(personPr)
CREATE TABLE personPr(
    idnum VARCHAR2(20) PRIMARY KEY
    , name VARCHAR2(30)
    , age NUMBER(3) DEFAULT 0
);

-- 저장 예
    COMMIT;
    
-- 데이터 삽입 예
    INSERT INTO personPr VALUES('123456-1234567','홍길동',34);
    INSERT INTO personPr VALUES('1111','임꺽정',35);
    INSERT INTO personPr VALUES('2222','사오정',30);
    INSERT INTO personPr VALUES('3333','저팔계',39);
    
-- 1명검색 예
    SELECT * FROM personPr
    WHERE idnum ='123456-1234567';
    
-- 전체 조회
    SELECT * FROM personPr;

-- 1명 삭제
    DELETE personPr
    WHERE idnum ='123456-1234567';

-- 1명의 나이 수정
    UPDATE personPr
    SET
        age=30
    WHERE
       idnum ='123456-1234567';
