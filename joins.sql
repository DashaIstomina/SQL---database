Задача 1. Список заявок с данными клиентов  
Необходимо подготовить отчет, который покажет:    
•	application_id;     
•	last_name;    
•	first_name;    
•	requested_amount;     
•	current_status.   
Результат отсортировать:  
по application_id — по возрастанию.  
Select   application_id, last_name, first_name, requested_amount,  current_status  
from loan_applications  
inner join clients on loan_applications.client_id = clients.client_id   
order by application_id asc;  

Задача 2. Полная информация по заявке   
Необходимо подготовить отчет, который покажет:  
•	application_id;   
•	фамилию клиента;   
•	название кредитного продукта;    
•	фамилию сотрудника, который оформил заявку;   
•	requested_amount;   
•	current_status.   
Результат отсортируй:  
по application_id — по возрастанию.   
Решение:  
Select la. current_status, la.requested_amount, c.last_name, e.last_name, la.application_id, lp.product_name from loan_applications la  
Inner join clients c on la.client_id = c.client_id  
Inner join employees e on la.employee_id = e.employee_id  
Inner join loan_products lp on la.loan_product_id = lp.loan_product_id  
Order by  application_id asc;  

Задача 3.  
В системе необходимо подготовить отчет, содержащий информацию о клиентах и их кредитных заявках.   
В отчет должны попасть все клиенты, зарегистрированные в системе, включая тех, кто еще ни разу не подавал заявку.  
Для каждого клиента необходимо вывести его фамилию, имя, а также информацию о заявке: идентификатор заявки, запрашиваемую сумму и текущий статус.   
Если у клиента отсутствуют заявки, данные о заявке должны отображаться как NULL.  
Результат отсортируйте по фамилии клиента в порядке возрастания.  
Решение:    
Select c.first_name, c.last_name, la.application_id, la.requested_amount, la.current_status  
From clients c  
Left join loan_applications la on c.client_id = la.client_id  
Order by c.last_name asc;  

Задача 4. Отчет по выданным кредитам  
В системе необходимо подготовить отчет по выданным кредитам.  
Для каждого кредита необходимо вывести:  
•	идентификатор кредита;   
•	фамилию и имя клиента;   
•	название кредитного продукта;   
•	сумму выданного кредита;   
•	процентную ставку;   
•	дату выдачи кредита.   
Результат отсортируйте по дате выдачи кредита в порядке убывания.  
Решение:  
Select l.loan_id, l.issue_date, l.interest_rate, lp.product_name, c.last_name, c.first_name, l.issued_amount from loans l  
Inner join loan_applications la on l.application_id = la.application_id  
inner join clients c on la.client_id = c.client_id  
inner  join loan_products lp on  la.loan_product_id = lp.loan_product_id  
Order by l.issue_date desc;  

