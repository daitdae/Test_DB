-- spring3 예제의 테이블
-- 주민등록번호, 이름, 나이 저장할 테이블 작성(person)

CREATE TABLE person(
    idnum VARCHAR2(20) PRIMARY KEY
    ,name VARCHAR2(30) NOT NULL
    ,age  NUMBER(3) DEFAULT 0
);

-- 저장 예
    COMMIT;
-- 롤백 예
    ROLLBACK;
    
-- 1명검색 예
    SELECT * FROM person
    WHERE idnum = '890111-1234567';

-- 전체 조회
    SELECT * FROM person;

-- 1명 삭제
    DELETE person
    WHERE idnum = '유재석';

-- 1명의 나이 수정
    UPDATE person
    SET 
        age = 30
    WHERE
        idnum = '890111-1234567';

-- 데이터 삽입 예
    INSERT INTO person VALUES('890111-1234567', '홍길동', '34');
