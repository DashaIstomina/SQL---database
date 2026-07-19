Задача 1. Анализ популярных кредитных продуктов  

Необходимо подготовить отчет, который покажет:  
•	loan_product_id;   
•	количество поданных заявок.   
В отчет должны попасть только те кредитные продукты, по которым подано не менее 5 заявок.  
Результат отсортировать:     
1.	по количеству заявок (от большего к меньшему);   
2.	при одинаковом количестве — по loan_product_id (по возрастанию).  
Решение:  
SELECT loan_product_id, COUNT(application_id) AS applications_count   
FROM loan_applications   
GROUP BY loan_product_id    
HAVING COUNT(application_id) >= 5  
ORDER BY applications_count DESC , loan_product_id ASC;  


Задача 2. Статистика по кредитным продуктам  

Необходимо подготовить отчет, который покажет для каждого кредитного продукта:  
•	loan_product_id;   
•	количество поданных заявок;     
•	среднюю запрашиваемую сумму;     
•	минимальную запрашиваемую сумму;     
•	максимальную запрашиваемую сумму.    
Условия:  
В отчет должны попасть только те кредитные продукты, по которым подано не менее 3 заявок.  
Отсортируйте результат:  
1.	по средней запрашиваемой сумме (average_amount) — от большей к меньшей.  
Решение:  
SELECT loan_product_id, COUNT(application_id) AS applications_count,
AVG(requested_amount) AS average_amount,
MIN(requested_amount) AS min_amount,
MAX(requested_amount) AS max_amount FROM loan_applications
GROUP BY loan_product_id
HAVING COUNT(application_id) >= 3
ORDER BY average_amount DESC;


Задача 3. Оценить нагрузку сотрудников по каждому кредитному продукту.   
  
Необходимо подготовить отчет, который покажет:  
•	employee_id;   
•	loan_product_id;   
•	количество оформленных заявок (applications_count).   
В отчет должны попасть только те комбинации сотрудник + кредитный продукт, по которым оформлено не менее 2 заявок.  
Отсортируй результат:  
1.	по employee_id (по возрастанию);   
2.	затем по количеству заявок (applications_count) — от большего к меньшей.  
SELECT employee_id, loan_product_id, COUNT(application_id) AS applications_count  
FROM loan_applications  
GROUP BY employee_id, loan_product_id  
HAVING COUNT(application_id) >= 2  
ORDER BY employee_id ASC, applications_count DESC;  



