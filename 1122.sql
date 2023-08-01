--11월 22일

SELECT employee_ID,first_name,hire_date,salary FROM employees;

SELECT employee_ID, first_name, salary from employees order by salary desc;

SELECT first_name, phone_number, department_ID 
from employees
order by first_name;

SELECT DISTINCT department_ID
from employees;

----------------------------------------------------------------------------
-- 문자열 결합 연산자 ||
SELECT first_name || '님 안녕하세요?' as "Hello!"  -- Java문자열은"" 이건 '' as는 컬럼네임변경(특문 띄어쓰기 안되는데 ""쓰면가능)
FROM employees;
--홑 따옴표 : 오라클의 문자열
--겹따옴표 : 문자열아님!! 특수데이터 처리용

SELECT first_name, salary as "현재급여", salary*1.1 as "인상된 급여"
FROM employees;

--조건절의 사용
/*SELECT [ALL/DISTINCT] 컬럼명 FROM 테이블명
WHERE 조건절
ORDER BY 컬럼명 [ASC/DESC]*/

--[문제] 급여가 10,000달러 이상인 직원들의 이름,급여,부처,직급을 조회하시오
SELECT first_name, salary, department_ID, job_ID
From employees
WHERE salary>=10000;

--이름, 부서, 입사일을 2005년 이후에 입사한 직원을 입사일 순으로 조회하시오
SELECT first_name, department_ID, hire_date
FROM employees
WHERE hire_date>='05/01/01'     
ORDER by hire_date;

--2005년 이전에 입사한 직원의 이름, 부서, 입사일을 이름순로 조회하시오
SELECT first_name, department_ID, hire_date
FROM employees
WHERE hire_date<'05/01/01'
ORDER by first_name;

--[문제] 급여가 5000~10000사이인 직원의 이름, 부서번호, 급여 급여 내림차순으로 조회
SELECT first_name, department_ID, salary
FROM employees
WHERE salary>=5000 AND salary<=10000 
ORDER by salary DESC;

--[문제] 부서번호가 50이거나 80인 직원의 이름, 부서번호, 부서 오름차순으로 조회
SELECT first_name, department_ID
FROM employees
WHERE department_ID=50 OR department_ID=80
ORDER by department_ID ASC;


--[문제] 부서번호가 50이거나 80인 직원의 이름, 부서번호, 부서 오름차순으로 이름은 내림차순으로 조회
SELECT first_name, department_ID
FROM employees
WHERE department_ID=50 OR department_ID=80
ORDER by department_ID ASC, first_name DESC;


--[문제] 급여가 5000~10000사이인 직원의 이름, 부서번호, 급여 급여 내림차순으로 조회
--컬럼명 between 첫번째 값 and 두번째 값 
SELECT first_name, department_ID, salary
FROM employees
--WHERE salary>=5000 AND salary<=10000 
WHERE salary between 5000 and 10000  --위랑 같은말
ORDER by salary DESC;

--[문제] 급여가 5000미만 10000초과하는 직원의 이름, 부서번호, 급여 급여 내림차순으로 조회
--컬럼명 not between 첫번째 값 and 두번째 값 
SELECT first_name, department_ID, salary
FROM employees
WHERE salary NOT between 5000 and 10000
ORDER by salary DESC;

--[문제] 부서번호가 50이거나 80인 직원의 이름, 부서번호, 부서 오름차순으로 이름은 내림차순으로 조회
-- 컬럼명 in (값, 값)
SELECT first_name, department_ID
FROM employees
--WHERE department_ID=50 OR department_ID=80
WHERE department_ID IN (50,80)  -- 결과값은 위와 동일
ORDER by department_ID ASC, first_name DESC;

--[문제] 부서번호가 50이거나 80이 아닌 직원의 이름, 부서번호, 부서 오름차순으로 이름은 내림차순으로 조회
-- 컬럼명 NOT in (값, 값)
SELECT first_name, department_ID
FROM employees
WHERE department_ID NOT IN (50,80)  
ORDER by department_ID ASC, first_name DESC;

--[문제] 이름, 부서번호, 급여, 커미션비율을 이름오름차순으로 조회 commission_pct 
SELECT first_name, department_ID, commission_pct
FROM employees
ORDER by first_name;

--컬럼명 is null, is not null
SELECT first_name, department_ID, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER by first_name;

--컬럼명 is null, is not null
SELECT first_name, department_ID, commission_pct
FROM employees
WHERE commission_pct IS NULL
ORDER by first_name;

--[문제]관리자가 없는 사람을 조회 (이름 직급아이디job id 부서번호department id)
SELECT first_name, job_id, department_id
FROM employees
WHERE manager_ID IS NULL;

--[문제]커미션을 받는 직원의 이름 기본급여 커미션비율 커미션 금액 총급여를 조회(총금액 내림차순)
SELECT
    first_name, salary, commission_pct, salary*commission_pct as "커미션비율",salary+salary*commission_pct as 총급여
FROM 
    employees
WHERE
    commission_pct IS NOT NULL
ORDER by 
    총급여 DESC;

/* 문제 */
-- 1) 사원번호(EMPLOYEE_ID), 이름, 부서번호, 급여, 직급(JOB_ID)을 급여별로 내림차순 조회
SELECT employee_ID, first_name, department_id, salary, job_id
FROM employees
ORDER by salary DESC;

-- 2) 급여가 10000 이상인 사람의 이름, 급여, 부서번호 조회
SELECT first_name, salary, department_ID
FROM employees
WHERE salary>=10000;

-- 3) 100번 부서에 소속된 사람들의 이름, 부서번호, 급여를 이름순으로 오름차순 정렬하여 조회
SELECT first_name, department_ID, salary
FROM employees
WHERE department_ID = 100
ORDER by first_name;

-- 4) 입사일이 '07/02/07' 이후에 입사한 사람의 이름, 입사일을 날짜별 오름차순으로 조회
SELECT first_name, hire_date
FROM employees
WHERE hire_date>='07/02/07'
ORDER by hire_date;

-- 5) 이름, 입사일, 급여, 부서번호를 조회, (부서별 오름차순, 이름순 오름차순)
SELECT first_name, hire_date, salary, department_ID
FROM employees
ORDER by department_ID ASC, first_name ASC;

-- 6) 부서에 소속되지 않은 사람의 이름, 입사일, 급여, 부서번호를 조회
SELECT first_name, hire_date, salary, department_ID
FROM employees
WHERE department_ID IS NULL;

-- 7) 성과급이 있는 직원의 이름, 급여, 커미션비율, 성과급, 합계를 조회하시오. (별칭을 사용할 것)
SELECT first_name, salary, commission_pct, salary+salary*commission_pct as "합계"
FROM employees
WHERE commission_pct IS NOT NULL;

-- 8) 성과급이 있는 직원의 이름, 급여, 성과급, 합계를 조회하시오. (별칭을 사용할 것)
--   단, 성과급의 금액이 1000 이하인 직원들만 조회
SELECT first_name as "이름", salary as "급여", commission_pct as "성과급", salary+salary*commission_pct as "합계"
FROM employees
WHERE commission_pct IS NOT NULL
AND commission_pct<=1000;
