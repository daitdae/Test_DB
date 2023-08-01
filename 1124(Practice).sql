desc employees; 
--employee_id, first_name, last_name, email, phone_number,hire
-- 1) Den �� ��� ������ ��ȸ�Ͻÿ� (DEN, den, DEn)
SELECT 
    *
FROM
    employees
WHERE
    First_name LIKE 'Den';

-- 2) D�� �����ϴ� �̸��� ���� ��� ����� ������ ��ȸ�Ͻÿ�
--   (%:�������� ����, _ ��������)
SELECT
    *
FROM 
    employees
WHERE
    First_name Like 'D%';


-- 3) �̸��� 3������ ��� ����� ������ ��ȸ�Ͻÿ�.
SELECT
    *
FROM
    employees
WHERE
    first_name Like '___';


-- 4) �μ��� 10�̰ų� 50�̰ų� 60�� �μ��� ������ ����(�̸�, �޿�, �μ�)�� ��ȸ�Ͻÿ�.  
SELECT 
    first_name, salary, department_ID
FROM 
    employees
WHERE
    department_ID IN (50,60);
    

-- 5) �μ��� 60�̰ų� �̸��� A�� �����ϴ� �����ϴ� ������ ����(�̸�, �޿�, �μ�)�� ��ȸ�Ͻÿ�.
SELECT
    first_name, salary, department_ID
FROM
    employees
WHERE 
    department_ID=60 or First_name LIKE'A%';


-- 6) �޿��� 10000�� �ʰ��ϸ鼭 JOB_ID�� 'SA_REP'�� ����� �̸���, �̸�, ��ȭ��ȣ, JOB_ID ������ ��ȸ�Ͻÿ�
SELECT
    email,first_name,phone_number,job_id
FROM
    employees
Where
    salary>=10000 AND Job_id = 'sa_rep';


-- 7) �Ŵ����� 103�� ������ ����(���̵�, �̸�, �μ�, �Ŵ�����ȣ)�� ��ȸ�Ͻÿ�.
