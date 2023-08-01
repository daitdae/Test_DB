/*join
 - cross join : m x n
 - Equi join : pk == fk (FK쪽에 NULL이 존재하면 데이터를 조회하지 못할 수 있다)
 - Self Join : 하나의 테이블에 PK와 FK가 존재하는 경우
 - Inner / Outer Join : (FK쪽에 NULL이 존재하더라도 데이터를 조회한다.)
*/


--cross join
SELECT
    e.first_name, e.salary, d.department_name
FROM
    employees e, departments d;
    
    
--Equi Join ( = ANSI 표준방식의 join)
SELECT
    e.first_name, e.salary, d.department_name
FROM
    employees e, departments d
WHERE
    e.department_id = d.department_id; 
    
-- 3개의 테이블로부터 조회
SELECT
    e.first_name, d.department_name, l.city
FROM
    employees e, departments d, locations l
WHERE
    e.department_ID = d.department_ID
    AND
    d.location_id = l.location_ID;
    
--[문제] 부서명, 도서명을 조회
SELECT
    d.department_name, l.city
FROM
    departments d, locations l
WHERE
   d.location_id = l.location_id;
    
    
--[문제] 근속년수 20년 이상인 사람의 이름 입사일 부서명을 조회하시오.
SELECT
    e.first_name, e.hire_date, d.department_name,
    SUBSTR(sysdate, 1,2) - SUBSTR(hire_date, 1,2) as"근속년수"
FROM
     employees e, departments d
WHERE
    e.department_ID = d.department_ID
AND
    SUBSTR(sysdate, 1,2) - SUBSTR(hire_date, 1,2) >=20; 
    

--[문제] 조인과 와일드카드를 이용해서 이름에 'A'가 포함된 모든 사람의 이름과 부서명을 조회하시오.
--       (이때 이름을 조회할때 대소문자 구분이 없이 조회되어야 함)
SELECT
    e.first_name, e.hire_date, d.department_name
FROM
     employees e, departments d
WHERE
    e.department_ID = d.department_ID
AND
    UPPER(e.first_name) LIKE '%A%';
    
--[문제] 'Seattle' 에 근무하는 모든 직원의 부서번호, 이름, 업무명(job_title), 부서명을 조회하시오.
SELECT 
    e.department_id, e.first_name, j.job_title, d.department_name
FROM
    departments d, employees e, jobs j, locations l
WHERE
    e.department_ID = d.department_ID
AND
    e.job_id = j.job_id
AND
    d.location_ID = l.location_id
AND
    l.city = 'Seattle'
ORDER BY 
    first_name;
    
--OUTER JOIN        부모쪽에 +
SELECT
    e.first_name, e.salary, d.department_name
FROM
    employees e, departments d
WHERE
    e.department_id = d.department_id(+);
    
--[문제] 부서명과 매니져명을 조회하시오
SELECT
    d.department_name, d.manager_id, e.first_name
FROM 
    departments d, employees e
WHERE
    e.manager_id = d.manager_id;



--Self Join : 하나의 테이블에 PK와 FK가 모두 존재하는 경우 사용
--직원명과 매니져명을 조회하시오
--예) xxx의 매니저는 xxx입니다
-- null data가 있을때 부모쪽에 (+) 붙인다
SELECT
    e1.first_name as"매니저명", e2.first_name as"직업명"
FROM
    employees e1, employees e2
WHERE
    e1.employee_id(+) = e2.manager_id
ORDER BY
    e1.first_name;
    
--삼발이가 있는쪽이 자식
SELECT
    d.department_name, c.country_name, r.region_name, l.location_id
FROM
    departments d, countries c, regions r, locations l
WHERE
    r.region_name(+)  = c.country_name
AND
    c.country_name(+) = l.location_id 
AND 
    l.location_id(+) = d.department_name;
    
/* SUB QUERY
 - 쿼리안에 다른 쿼리가 포함되어 있는 명령문
 
 - main query
   조회에대한 결과를 가지고 있는 바깥쪽 쿼리
   서브쿼리의 실행 결과에 의해 메인 쿼리가 실행됨
  
 - sub query
   안쪽에 포함된 쿼리
   서브쿼리가 먼저 실행, 그 결과를 메인쿼리 조건절이나 FROM 절등에서 사용됨
   서브쿼리가 메인의 어느부분에서 사용되는가?
   where, from, select, having, insert into, update set 절 */
   
--[문제] 사번이 162인 직원의 이름과 급여를 조회
SELECT 
    first_name, salary
FROM
    employees
WHERE
    employee_id=162;
    
--[문제] 급여가 10500인 직원의 모든 정보를 조회
SELECT
    *
FROM
    employees
WHERE 
    salary = 10500;
    
--[문제] 162번 직원이 받는 급여와 동일한 급액을 받는 모든 직원의 정보를 조회하시오(이게 서브쿼리)
--두번에 나눠서 작업할 걸 한번에 하는거
SELECT
    *
FROM
    employees
WHERE 
    salary = ( 
        SELECT 
            salary
        FROM
            employees
        WHERE
            employee_id=162) ;
            
--[문제] 서브쿼리가 from절에 있는거, 
-- 80번 부서의 사원번호, 이름, 급여, 부서번호를 조회하는데 8000이 넘는 사람만
-- rownum 맨 왼쪽 번호
SELECT
    rownum, tbl.first_name
FROM
    (SELECT 
        employee_id, first_name, salary, department_id
    FROM
        employees
    WHERE
        department_id = 80) tbl
WHERE
    tbl.salary>8000;
    
--[문제] 서브쿼리 조인 같이들어가는거 'Bruce'라는 직원과 동일한 부서에 근무하는 직원을 조회하시오
-- 조회 먼저 조건 동일부서(id),  (직원명:first_name, 부서명: department_name)
SELECT
    e.first_name, d.department_name
FROM
    employees e, departments d
WHERE
    e.department_id = d.department_id   --join때문에 나오는 조회조건
AND
    e.department_id = (
        SELECT
            department_id
        FROM
            employees
        WHERE
            first_name = 'Bruce');
        
--[문제] 30번 부서에 근무하는 직책과 동일한 직책으로 근무하는 직원이 다른 부서에도 있는지 확인하여 직원의 모든정보를 검색
SELECT
    *
FROM
    employees
WHERE
    job_id IN (
        SELECT DISTINCT 
            job_id
        FROM
            employees
        WHERE
            department_id = 30);
 
    
--[문제] 회사의 전체 급여평균(6461.xx)보다 적게 받는 직원의 명단을 조회하시오
SELECT
    *
FROM
    employees
WHERE   
    salary<(
        SELECT AVG
            (salary)
        FROM
            employees);
    
--[문제] 각 직원별로 자신이 근무하고 있는 부서의 평균임금을 출력하는 SQL 명령문은? 이름,급여,부서번호,부서명, 부서 평균급여




    
