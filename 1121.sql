-- 2022�� 11�� 21��(��)
-- ������ ������ ��� ��

-- 1)��ȸ (select): 
-- select �÷��� from ���̺��;
select * from regions;
select * from countries;
select * from locations;

select * from departments;
select * from employees;
select * from jobs;
select * from job_history;

--�̸��� ��ȸ
select first_name, last_name from employees;

--�̸�(first_name) �޿�(salary)
select first_name, salary from employees;

--�����ȣ(employee_id), �̸�(first_name), �޿�(salary), �μ���ȣ(department_id)
select employee_id, first_name, salary, department_id from employees;

--�̸� �μ���ȣ �Ի���
select first_name, department_id, hire_date from employees;

--�μ���ȣ (distinct: �ߺ������� �����ϰ� ���, all: �� ���)
select distinct
    department_id 
from employees;

-- �������ִ°� : order by �ڿ� �÷���(���� �����Ұ��� ����) ���� ���� �������� ������ asc ��������(��������) desc(��������)
select distinct
    department_id 
from employees 
order by department_id desc;

