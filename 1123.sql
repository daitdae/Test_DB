--11월 23일(수)
--ROLE : previlege의 묶음을 의미한다

--연산자 : LIKE연산자 +(특수기호 %_)
-- % : 글자를 대신해서 사용된다 0~n개의 글자
-- _ : 한개의 글자를 의미한다

--[문제] CLERK직급의 사람이름, 직급을 조회
SELECT 
    first_name, job_id
FROM
    employees
--WHERE 
--  job_id LIKE '___CLERK'
WHERE 
    job_id LIKE '%CLERK'          -- 위 아래 결과문은 같음
ORDER BY
    job_id;
    
--[문제] 'J'로 시작하는 직원의 이름을 조회하시오
SELECT
    first_name
FROM
    employees
WHERE 
    first_name LIKE 'J%';
    
--[문제] 1월에 입사한 직원의 이름, 입사일, 전화번호를 조회하시오 '___01___' or '__/01/__' or 
--                                          '%01%'(이건 앞에 데이터가 없어도 되서 01년이나 1일에 입사한 사람까지 나온다)
SELECT
    first_name, hire_date, phone_number
FROM
    employees
WHERE
    hire_date LIKE '__/01/__';
    
--[문제] 전화번호가 515로 시작하는 직원의 이름,입사일 전화번호를 조회하시오.
SELECT
    first_name, hire_date, phone_number
FROM
    employees
WHERE
    phone_number LIKE '515%';

--desc employees : employees 안에 뭐가 있는지 확인할수 있는 코드

--DDL(Data Definition Language) : Create, Alter, Drop
/*CREATE TABLE 테이블명(
    컬럼명 데이터 타입 [CONSTRAINT 제약조건명(제약조건명 : 테이블명_컬럼명_타입)]  제약조건들,
    컬럼명 데이터 타입 [CONSTRAINT 제약조건명(제약조건명 : 테이블명_컬럼명_타입)]  제약조건들,
    컬럼명 데이터 타입 [CONSTRAINT 제약조건명(제약조건명 : 테이블명_컬럼명_타입)]  제약조건들,
); 
*/
CREATE TABLE customer (
    usrid CHAR(5) CONSTRAINT customer_usrid_pk PRIMARY KEY,
    age NUMBER(3) NOT NULL,
    usrname VARCHAR(20),
    height NUMBER(10,2) DEFAULT 0,            -- 소수점(넉넉잡은 수, 자릿수)
    weight NUMBER(10,2) DEFAULT 0,
    address VARCHAR(100) 
);

--DROP TABLE customer; 테이블 없애는 방법

SELECT * FROM customer;

/*INSERT: 데이터 삽입명령

INSERT INTO 테이블명
(컬럼명...) 1,2,3,4,5
VALUES
(데이터...) 1,2,3,4,5 ; 컬럼명과 맞춰서 데이터 순서대로 삽입
*/

INSERT INTO customer
(usrid,age,usrname,height,weight,address)
VALUES
('aaa', 31, '홍길동', 176, 67.5, '서울시 영등포구');

INSERT INTO customer        --순서대로 다 넣었을 경우엔 컬럼명 생략가능 (usrid...생략가능)
VALUES
('bbb', 32, '저팔계', 188, 88.5, '서울시 동작구');

INSERT INTO customer
(usrid,age,address)     --일부만 넣었을땐 컬럼명 생략 불가
VALUES
('ccc', 23, '서울시 동작구');

INSERT INTO customer
(usrid, usrname, age,address)     
VALUES
('ccc', '손오공', 23, '서울시 동작구');



COMMIT; --save //commit 하면 롤백 안됨

--DELETE : 레코드 삭제 0~ALL 가능
DELETE FROM customer;

--DELETE + WHERE : 조건별 삭제
DELETE FROM customer
WHERE usrname IS NULL;

COMMIT;

--UPDATE : 레코드 수정 WHERE 조건절 필요함 없으면 한번에 다 바뀜
UPDATE customer
SET
    height = 177.7
    ,weight = 77.7
WHERE
    usrid='ccc';
    
SELECT
    *
FROM customer;

ROLLBACK;       --트랜지션이 마무리 된 상태까지 되돌리는거 커밋이전은 불가능

-- "member" 테이블명 만들때 안된다 하면 큰 따옴표 붙이면 가능하긴 한데 비추


/*[문제] members 테이블을 생성한 후 insert update delete commit rollback 연습하기
seqno 정수 pk
usrid 가변문자열 30자리 unique nn
usrname  가변문자열 30자리 nn
birth 날짜
joindate 날짜
gender 성별 고정길이 문자열 1byte
*/

CREATE TABLE members(
 seqno NUMBER CONSTRAINT members_seqno_pk PRIMARY KEY,
 usrid VARCHAR(30) CONSTRAINT members_usrid_uqnn UNIQUE NOT NULL,
 usrname VARCHAR(30) CONSTRAINT members_usrname_nn NOT NULL,
 birth DATE,
 joindate DATE,     -- 현재날짜 입력 : DATE DEFAULT SYSDATE;
 gender CHAR(1)     -- 한정된 값만 들어가게 하는 제약조건 : 
                    -- DEFAULT 'M'(값이 없으면 디폴트값 M넣겠다 다만 순서가 무조건 앞에와야 함) CONSTRAINT members_members_ck CHECK (gender IN ('M', 'F'))
);


INSERT INTO members
(seqno, usrid, usrname, birth, joindate, gender)
VALUES
(1,'aaa','name','01/10/10', '03/12/12', 'm');

INSERT INTO members
(seqno, usrid, usrname, birth, joindate, gender)
VALUES
(2,'bbb','james','01/10/10', sysdate , 'm');    -- 현재날짜 삽입: sysdate

UPDATE members
SET 
    birth = '03/01/25', 
    usrid = 'Paul'
WHERE
    usrid = 'aaa';
    
DELETE FROM members;

ROLLBACK;

SELECT
    *
FROM members;




