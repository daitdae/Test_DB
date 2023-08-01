/* 11월 24일(목) 
FK - 
   부모테이블 + 자식테이블
   
Sequence 객체 생성 및 사용
*/


/* 관계 형성하기 */
DROP TABLE child_1;
DROP TABLE parent_1;

-- 부모테이블 생성
CREATE TABLE parent_1
(
    seqno     NUMBER PRIMARY KEY,
    usrname  VARCHAR2(20) NOT NULL,
    phone     VARCHAR2(10)
);

CREATE TABLE child_1
(
    seqnum  NUMBER PRIMARY KEY,
    jumin     VARCHAR2(13) NOT NULL,
    address  VARCHAR2(50),
    seqno    NUMBER  REFERENCES parent_1(seqno)
);

-- 부모테이블에 데이터 삽입
INSERT INTO parent_1 VALUES(1, '홍길동', '1111');
INSERT INTO parent_1 VALUES(2, '저팔계', '2222');
INSERT INTO parent_1 VALUES(3, '사오정', '3333');


-- 자식테이블에 데이터 삽입
INSERT INTO child_1 VALUES(11, '921124', '서울', 1);
INSERT INTO child_1 VALUES(12, '931124', '부산', 2);
INSERT INTO child_1 VALUES(13, '941124', '인천', 2);
INSERT INTO child_1 VALUES(14, '951124', '제주', 3);

SELECT * FROM parent_1;
SELECT * FROM child_1;
-- 
DELETE child_1
WHERE seqno = 2;

DELETE parent_1
WHERE seqno = 2;

-- 새로운 테이블 생성하기

DROP TABLE parent_2;


CREATE TABLE parent_2
(
    seqnum NUMBER PRIMARY KEY,
    usrid     VARCHAR2(20) UNIQUE NOT NULL,
    usrname VARCHAR2(20) NOT NULL,
    email     VARCHAR2(30) UNIQUE
);

-- 일련번호 발생하는 객체 생성하기(SEQUENCE)
DROP SEQUENCE parent2_seq;

CREATE SEQUENCE parent2_seq;  -- 1부터 발생시키기 시작함

-- parent2_seq.nextval : 다음 값을 발생시킴
-- parent2_seq.currval : 마지막으로 발생시킨 일련번호의 값을 알고자 할 때

SELECT parent2_seq.nextval FROM dual; -- 가상테이블(더미테이블)

SELECT parent2_seq.currval FROM dual; -- 가상테이블(더미테이블)

-- parent_2 테이블에 sequence를 이용해 값 삽입하기
INSERT INTO parent_2
(seqnum, usrid, usrname, email )
VALUES
(parent2_seq.nextval, 'aaa', '홍길동','aaa@korea.com' );


INSERT INTO parent_2
(seqnum, usrid, usrname, email )
VALUES
(parent2_seq.nextval, 'bbb', '손오공','bbb@korea.com' );

SELECT * FROM parent_2;

/*
[ 문제 ] score_2 테이블을 생성하시오
seqno : 시퀀스 번호 (시퀀스 객체 생성해서 사용할 것 : score2_seq ) PK
seqnum : FK (on delete cascade 설정할 것) FK
kor : 0
eng : 0
mat : 0
*/
DROP TABLE score_2;
DROP SEQUENCE score2_seq;

CREATE TABLE score_2
(
    seqno    NUMBER PRIMARY KEY,
    seqnum NUMBER REFERENCES parent_2(seqnum) ON DELETE CASCADE,
    kor       NUMBER(3) DEFAULT 0,
    eng      NUMBER(3) DEFAULT 0,
    mat      NUMBER(3) DEFAULT 0
);

CREATE SEQUENCE score2;

-- 자기 자신의 컬럼을 참조하는 테이블 생성하기 
DROP TABLE emp;

CREATE TABLE emp
(
    empno NUMBER PRIMARY KEY,
    ename VARCHAR2(20) NOT NULL,
    jobtitle VARCHAR2(30),
    mgrno NUMBER REFERENCES emp(empno)  
);

INSERT INTO emp VALUES(1, '홍길동', '대표이사', NULL);
INSERT INTO emp VALUES(2, '손오공', '전무', 1);
INSERT INTO emp VALUES(3, '사오정', '사무', 1);

INSERT INTO emp VALUES(4, '이몽룡', '기획팀장', 2);
INSERT INTO emp VALUES(5, '성춘향', '홍보팀장', 3);

/* 문제 */
-- 1) Den 의 모든 정보를 조회하시오 (DEN, den, DEn)


-- 2) D로 시작하는 이름을 가진 모든 사람의 정보를 조회하시오 
--   (%:글자제한 없음, _ 글자제한)


-- 3) 이름이 3글자인 모든 사람의 정보를 조회하시오.


-- 4) 부서가 10이거나 50이거나 60번 부서의 직원의 정보(이름, 급여, 부서)를 조회하시오.  


-- 5) 부서가 60이거나 이름이 A로 시작하는 시작하는 직원의 정보(이름, 급여, 부서)를 조회하시오.


-- 6) 급여가 10000을 초과하면서 JOB_ID가 'SA_REP'인 사람의 이메일, 이름, 전화번호, JOB_ID 정보를 조회하시오


-- 7) 매니저가 103인 직원의 정보(아이디, 이름, 부서, 매니저번호)를 조회하시오.


/*
■ 다음과 같은 내용으로 테이블을 생성하시오

1. 
테이블 명 : STAR_WARS (영화 정보를 저장하는 테이블)
컬럼 : 
 - EPISODE_ID : 에피소드 아이디로써, 정수형 타입으로 기본 키
 - EPISODE_NAME : 에피소드에 따른 영화 제목을 저장하는 컬럼이며, 
                가변 길이 문자형 타입(50 BYTE)
 - OPEN_YEAR : 개봉 년도로써, 정수형 타입(4자리)
 
2. 
테이블 명 : CHARACTERS (등장인물 정보를 저장하는 테이블)
컬럼 : 
 - CHARACTER_ID : 등장인물 아이디로써,  정수 5자리으로 기본 키
 - CHARACTER_NAME : 등장인물 명으로 가변 길이 문자형 타입(30 BYTE)이다.
 - MASTER_ID : 등장인물이 제다이일 경우 마스터 아이디 값을 가지는 컬럼. 정수 5자리
 - ROLE_ID : 등장인물의 역할 아이디로써, 정수형 타입.
 - EMAIL : 등장인물의 이메일 주소로 가변길이 문자형 타입(40 BYTE).

3. 테이블 명 : CASTING (등장인물과 실제 배우의 정보를 저장하는 테이블)
 컬럼 : 
 - EPISODE_ID: 에피소드 아이디로써, 숫자형 타입(5자리)으로 기본 키.
 - CHARACTER_ID: 등장인물 아이디로써, 숫자형 타입(5자리)이며 기본 키.
 - REAL_NAME : 등장인물의 실제 이름을 저장하는 컬럼으로, 가변길이 문자형 타입(30 BYTE).
