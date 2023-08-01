desc employees; 
--employee_id, first_name, last_name, email, phone_number,hire
-- 1) Den 의 모든 정보를 조회하시오 (DEN, den, DEn)
SELECT 
    *
FROM
    employees
WHERE
    First_name LIKE 'Den';

-- 2) D로 시작하는 이름을 가진 모든 사람의 정보를 조회하시오
--   (%:글자제한 없음, _ 글자제한)
SELECT
    *
FROM 
    employees
WHERE
    First_name Like 'D%';


-- 3) 이름이 3글자인 모든 사람의 정보를 조회하시오.
SELECT
    *
FROM
    employees
WHERE
    first_name Like '___';


-- 4) 부서가 10이거나 50이거나 60번 부서의 직원의 정보(이름, 급여, 부서)를 조회하시오.  
SELECT 
    first_name, salary, department_ID
FROM 
    employees
WHERE
    department_ID IN (50,60);
    

-- 5) 부서가 60이거나 이름이 A로 시작하는 시작하는 직원의 정보(이름, 급여, 부서)를 조회하시오.
SELECT
    first_name, salary, department_ID
FROM
    employees
WHERE 
    department_ID=60 or First_name LIKE'A%';


-- 6) 급여가 10000을 초과하면서 JOB_ID가 'SA_REP'인 사람의 이메일, 이름, 전화번호, JOB_ID 정보를 조회하시오
SELECT
    email,first_name,phone_number,job_id
FROM
    employees
Where
    salary>=10000 AND Job_id = 'sa_rep';


-- 7) 매니저가 103인 직원의 정보(아이디, 이름, 부서, 매니저번호)를 조회하시오.
