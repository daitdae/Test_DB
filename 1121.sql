-- 2022년 11월 21일(월)
-- 밑으로 내려서 적어도 됨

-- 1)조회 (select): 
-- select 컬럼명 from 테이블명;
select * from regions;
select * from countries;
select * from locations;

select * from departments;
select * from employees;
select * from jobs;
select * from job_history;

--이름을 조회
select first_name, last_name from employees;

--이름(first_name) 급여(salary)
select first_name, salary from employees;

--사원번호(employee_id), 이름(first_name), 급여(salary), 부서번호(department_id)
select employee_id, first_name, salary, department_id from employees;

--이름 부서번호 입사일
select first_name, department_id, hire_date from employees;

--부서번호 (distinct: 중복데이터 제거하고 출력, all: 다 출력)
select distinct
    department_id 
from employees;

-- 정렬해주는거 : order by 뒤에 컬럼명(어찌 정렬할건지 적음) 문장 가장 마지막에 적어줌 asc 생략가능(오름차순) desc(내림차순)
select distinct
    department_id 
from employees 
order by department_id desc;

