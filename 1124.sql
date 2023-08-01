/*11월 24일(목)
FK - 
    부모테이블+자식테이블
    
    Sequence 객체 생성 및 사용
*/

/*관계형성하기
DROP TABLE child_1
DROP TABLE Parent_1 없앨땐 아이먼저*/

--부모테이블 생성
CREATE TABLE Parent_1
(
    seqno NUMBER PRIMARY KEY,
    usrname VARCHAR2(20) NOT NULL,
    phone VARCHAR2(10)
    );
    
CREATE TABLE child_1
(
    seqnum NUMBER PRIMARY KEY,
    jumin VARCHAR2(13) NOT NULL,
    address VARCHAR2(50),
    seqno NUMBER REFERENCES Parent_1(seqno) ON DELETE CASCADE --참조무결성 부모의 레코드를 지우면 관련된 자식의 레코드도 지운다
    );
    
--부모테이블에 데이터 삽입
INSERT INTO parent_1 VALUES(1, '홍길동', '1111');
INSERT INTO parent_1 VALUES(2, '저팔계', '2222');
INSERT INTO parent_1 VALUES(3, '사오정', '3333');

--자식테이블에 데이터 삽입
INSERT INTO child_1 VALUES(11, '921224', '서울', 1);
INSERT INTO child_1 VALUES(12, '930111', '부산', 2);
INSERT INTO child_1 VALUES(13, '940112', '대구', 2);
INSERT INTO child_1 VALUES(14, '951124', '대전', 3);

--데이터 삭제
DELETE parent_1
WHERE seqno =2;

--ON DELETE CASCADE 걸고 안걸고 차이 안걸려있으면 자식거 먼저 지워야 한다
--원래 드랍을 하던 DELETE를 하건 자식먼저 지우는게 원칙
DELETE CHILD_1
WHERE seqno =2;

--새로운 테이블 생성하기
DROP TABLE parent_2;
CREATE TABLE parent_2 (
    seqnum NUMBER PRIMARY KEY,
    usrid VARCHAR2(20) UNIQUE NOT NULL,
    usrname VARCHAR2(20) NOT NULL,
    email VARCHAR2(30) UNIQUE
);

-- 시퀀스 삭제 할 때
DROP SEQUENCE parent2_seq;

-- 일련번호를 발생하는 객체 생성하기(SEQUENCE)
CREATE SEQUENCE parent2_seq;    --1부터 발생시키기 시작함

--parent2_seq.nextval: 다음 값을 발생시킨다(앞에 어떤시퀀스의 넥스트인지 시퀀스명과 .을 찍어준다)
--parent2_seq.currval: 현재 얼마까지 발생되었는가?(마지막으로 발생시킨 일련번호의 값을 알고자 할때)

SELECT parent2_seq.nextval FROM dual;
SELECT parent2_seq.currval FROM dual; -- 가상테이블(더미 테이블)

--parent_2 테이블에 sequence 를 이용해 값 삽입하기
INSERT INTO parent_2
(seqnum, usrid, usrname, email) --생략가능
VALUES
(parent2_seq.nextval, 'aaa', '홍길동', 'aaa@korea.com');

INSERT INTO parent_2
(seqnum, usrid, usrname, email) 
VALUES
(parent2_seq.nextval, 'bbb', '손오공', 'bbb@korea.com');

SELECT*FROM parent_2;


/*[문제] score_2테이블을 생성하시오
seqno: 시퀀스번호(시퀀스 객체 생성해서 사용할것: score2_seq)
seqnum: FK (on delete cascade 설정할것
kor : 0
eng : 0
mat : 0 */
DROP TABLE score_2;
DROP SEQUENCE score2_seq;

CREATE TABLE score_2(
    seqno NUMBER PRIMARY KEY,
    seqnum NUMBER REFERENCES Parent_2(seqnum) ON DELETE CASCADE,
    kor NUMBER(3) DEFAULT 0,
    eng NUMBER(3) DEFAULT 0,
    mat NUMBER(3) DEFAULT 0
);

CREATE SEQUENCE score2_seq;

--자기 자신의 칼럼을 참조하는 테이블 생성하기
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
INSERT INTO emp VALUES(3, '사오정', '상무', 1);
INSERT INTO emp VALUES(4, '이몽룡', '기획팀장', 2);
INSERT INTO emp VALUES(5, '성춘향', '홍보팀장', 3);

SELECT
    employee_id, FIRST_NAME, JOB_ID, MANAGER_ID
FROM employees;

/*함수 서브쿼리 조인*/

--initcap은 첫글자만대문자
SELECT FIRST_NAME, lower(first_name), upper(first_name), initcap(first_name) 
FROM employees;

--length(), concat()
SELECT FIRST_NAME, length(FIRST_NAME), concat(FIRST_NAME,'님')
FROM employees;

-- substr(문자열, n), substr(문자열, n1, n2) 오라클은 인덱스가 1부터 시작
SELECT substr('무궁화 꽃이 피었습니다.', 7)
FROM dual;          --존재하지않으므로 더미에서

SELECT substr('무궁화 꽃이 피었습니다.', 5, 1)
FROM dual;   

--substr을 이용해서 월에 해당하는 정보만 추출하시오
SELECT sysdate, substr(sysdate,4,2)
FROM dual;

--employees 테이블에서 hire_date칼럼에서 입사연도만(substr)로 추출하시오.
SELECT hire_date, substr(hire_date,1,2)
FROM employees;

--employees 테이블에서 hire_date칼럼에서 입사연도(substr, concat)로 추출하시오. 03
SELECT hire_date,concat(substr(hire_date,1,2), '년')
FROM employees;

--replace()
SELECT '010-1234-4567' as "전화번호", replace('010-1234-4567', '-' ,'/') as "수정된 전화번호"
FROM dual;

--숫자함수
SELECT 
    1234.5678, 
    ROUND(1234.5678, 2),
    ROUND(1234.5678, 0),
    ROUND(1234.5678, -1)
FROM dual;

SELECT 
    1234.5678, 
    ceil(1234.5678),
    floor(1234.5678)
FROM dual;

SELECT 
    -1234.5678, 
    ROUND(-1234.5678, 2),
    ROUND(-1234.5678, -1),
    ceil(-1234.5678),
    floor(-1234.5678)
FROM dual;




