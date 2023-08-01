-- 11월 25일(금)
/* 함수, 서브쿼리, 조인
내장함수의 종류   
1)단일행 함수
    - 문자열 함수 : lower(), upper(), initcap(), {영문에만 해당} length(), concat(), substr(문자열, n), substr(문자열, n1, n2)
                    replace(문자열, 찾는 문자열, 바꾸는 문자열)
    - 숫자 함수 : ceil() - 올림, floor() - 버림, round()-반올림
    - 날짜 함수 : add_months(), months_between()
    - 변환 함수 : to_date(), to_number(), to_char()
2)그룹행 함수 : 집계하는 용도
*/

SELECT sysdate,systimestamp
FROM dual;

SELECT sysdate, sysdate+1 AS "내일", sysdate-1 AS "어제"    -- +-만 가능
FROM dual;

SELECT sysdate - '91/11/15'  -- 오류 : 문자열로 인식해서 못함, 하려면 전환함수를 통해 날짜형태로 변환한 후 작업해야한다.
FROM dual;

--입사일 이후 현재까지 총 근무일
SELECT first_name, ceil (sysdate - hire_date) as "총 근무일"    --ceil이나 floor 넣어서 소수점 없애줌
FROM employees
ORDER by "총 근무일" DESC;

-- ADD_MONTH(날짜데이터,정수)
SELECT 
    sysdate, ADD_MONTHS(sysdate, 3), ADD_MONTHS(sysdate, -3)
FROM 
    dual;
    
-- MONTHS_BETWEEN(날짜데이터,정수)
SELECT 
    first_name, hire_date, CEIL(MONTHS_BETWEEN(sysdate, hire_date)) as "근무 개월"
FROM 
    employees;
    
--[문제] 근속년수 구하기
SELECT
    first_name, hire_date, 
    ROUND (MONTHS_BETWEEN(sysdate, hire_date), 1) as "근무 개월",  
    CEIL (MONTHS_BETWEEN(sysdate, hire_date)/12) as "근무 년수"
FROM 
    employees
ORDER by "근무 년수";


--변환함수의 사용 : TO_DATE(), TO_CHAR(), TO_NUMBER()
--'91/12/25'
SELECT '91/12/25', TO_DATE('91/12/25')+1
FROM dual;

-- 태어나서 오늘까지 몇일이 경과했는지 확인
SELECT CEIL(sysdate-TO_DATE('89/01/11'))
FROM dual;

--TO_CHAR(날짜,포멧) : YYYY-MM-DD HH(시) MI(분) SS(초)
SELECT sysdate, TO_CHAR(sysdate, 'YYYY-MM-DD HH:MI:SS (DAY)')
FROM dual;

--TO_NUMBER('1234') 문자열 형태를 숫자로 CAST(데이터,자료형) : 한방에 다바뀜
--숫자인지 문자인지 확인하는법 : 숫자는 셀의 오른쪽으로 정렬되고 문자는 왼쪽으로 정렬됨
SELECT TO_NUMBER('1234')+2,TO_NUMBER('1234.56')
FROM dual;

--[문제] 20년이상 근무한 직원의 명단을 조회
--      (사원번호(EMPLOYEE_ID),이름,입사일(YYYY-MM-DD),근속년수(XX년 근무) )
--      입사일 기준으로 내림차순 정렬
SELECT
    employee_ID, first_name, 
    TO_CHAR(hire_date, 'YYYY-MM-DD'), 
    FLOOR(MONTHS_BETWEEN(sysdate, hire_date)/12) as "근속년수"
FROM
    employees
WHERE
    FLOOR(MONTHS_BETWEEN(sysdate, hire_date)/12)>=20
ORDER BY
    "근속년수" desc;
    

--
--그룹행 함수 : COUNT(컬럼명) null데이터는 세지 않는다
-- COUNT() : 전체레코드의 개수를 센다
-- SUM(컬럼명)
-- AVG(컬럼명)
-- MIN(컬럼명)
-- MAX(컬럼명)
SELECT * FROM departments;

SELECT COUNT(*), COUNT(department_name), COUNT(manager_id)
FROM departments;

--[문제] 임차인의 인원수를 세는 쿼리를 작성하시오.
SELECT
    COUNT(*)
FROM
    employees;
    
--[문제] 커미션을 수령하는 인원수를 세는 쿼리를 작성하시오.
SELECT
    COUNT(commission_pct)
FROM
    employees;
    
--[문제] 커미션을 수령하지 못하는 인원수를 세는 쿼리를 작성하시오.
SELECT COUNT(*) - COUNT(commission_pct)
FROM employees;

--전체 임금의 합계, 임금의 평군, 최소급여 수령액, 최대급여 수령액, 
--최대급여 수령액과 최소급여 수령액의 급여차 SALARY
--SUM(컬럼명) AVG(컬럼명) MIN(컬럼명) MAX(컬럼명)

SELECT 
    SUM(salary),
    ROUND(AVG(salary),2),
    MIN(salary),
    MAX(salary),
    MAX(salary)-MIN(salary)
FROM employees;


--그루핑 시킨후 결제하기
--GROUP BY,HAVING (그룹화된 데이터에 조건을 걸고자 할때 사용)
SELECT 
    department_id,
    SUM(salary),
    ROUND(AVG(salary),2)
FROM employees
GROUP by department_ID
ORDER by 1; --1번째 컬럼이라는 뜻

--HAVING
--[문제] 7000이하의 평균급여를 받는 부서만 조회
SELECT 
    department_id,
    SUM(salary),
    ROUND(AVG(salary),2)
FROM employees
GROUP by department_ID
HAVING ROUND(AVG(salary),2)<=7000
ORDER by 1; 

--[문제] 각 부서별(=그루핑)로 급여의 최대급여, 최소급여, 급여평균, 부서별 인원수를을 조회하시오
SELECT
    MAX(salary) as "최대급여",
    MIN(salary) as "최소급여",
    ROUND(AVG(salary),2) as "평균급여",
    COUNT(department_id) as "인원수"
FROM employees
GROUP by department_ID;

--[문제4] 80번 부서의 급여 평균, 최고, 최저, 인원수를 조회
SELECT
    ROUND(AVG(salary),2),
    MAX(salary),
    Min(salary),
    COUNT(department_id)
FROM employees
--WHERE Department_id IN(80); 그루핑을 안했을 경우
GROUP by (department_id)
HAVING (department_id=80);

    
--[문제5]  각부서별 평균월급 전체월급 최저월급을 구하여 평균월급이 많은 순으로 조회
--단 부서번호가 널이면 출력하지 않는다
SELECT
    department_id,
    salary,
    ROUND(AVG(salary),2),
    MIN(salary)
FROM employees
GROUP by department_ID, salary
HAVING department_id IS NOT NULL
ORDER BY 2;

--[문제6] 같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수를 조회
--그루핑 시킨경우에만 함수랑 같이 쓸수 있다.
SELECT 
    job_id,COUNT(*)
FROM
    employees
GROUP by job_id
HAVING COUNT(job_id)>=4;
ORDER by 1;

/*JOIN 
 - 둘 이상의 관계가 있는 테이블들간의 데이터를 조회하는 것
 - PRIMARY KEY와 FK를 가진 컬럼이 있는 테이블을 조회
 
 **조인의 종류'
 - CROSS JOIN (=카르테시안 조인) 잘 안씀
 
 - EQUI JOIN 
    PK==FK의 관계를 가진 데이터를 조인
    FK에 NULL이 있을 경우 전체 조회가 안될수도 있다!!!
*/

-- CROSS JOIN
SELECT 
    e.salary, d.department_name
FROM
    employees e, departments d;
    
    
--EQUI JOIN
SELECT 
    e.first_name, d.department_name
FROM
    employees e, departments d
WHERE
    d.department_id = e.department_id; --null이 있는 한명 조회 안됨
    











