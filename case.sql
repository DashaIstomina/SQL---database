Задача 1. Статистика заявок по сотрудникам  

Нужно вывести:  
employee_id   
applications_count — общее количество заявок сотрудника    
approved_count — количество заявок со статусом 'APPROVED'  
В выборку должны попасть только сотрудники, у которых не менее 3 заявок.  
Отсортировать по:    
1.	applications_count — по убыванию  
2.	employee_id — по возрастанию  
Решение:  
SELECT employee_id, 
COUNT (application_id) AS applications_count, 
COUNT( CASE WHEN current_status = 'APPROVED' THEN 1 ELSE NULL END) AS approved_count 
FROM loan_applications
GROUP BY employee_id
HAVING COUNT (application_id) >= 3
ORDER BY applications_count DESC, employee_id ASC;


Задача 2. Расчет комиссии по кредиту  

Необходимо вывести:
loan_id   
issued_amount   
commission   
Правила расчета комиссии:  
если сумма кредита меньше 100000, комиссия составляет 1% от суммы кредита     
если сумма кредита от 100000 до 500000 включительно, комиссия составляет 0.7%   
иначе комиссия составляет 0.5%  
Отсортировать результат по:    
1.	commission — по убыванию;   
2.	loan_id — по возрастанию.  
Решение:  
SELECT loan_id, issued_amount,   
CASE  
WHEN issued_amount < 100000 THEN (issued_amount * 0.01)  
WHEN issued_amount BETWEEN 100000 AND 500000 THEN (issued_amount * 0.007)  
ELSE issued_amount * 0.005   
END AS commission  
FROM loans  
ORDER BY commission DESC, loan_id ASC;  


Задача 3. Определение размера кредита  
Вывести:  
loan_id   
issued_amount   
loan_size  
Правила:  
если issued_amount < 100000 → 'Маленький'  
если issued_amount от 100000 до 500000 включительно → 'Средний'  
иначе → 'Крупный'  
Отсортировать по:  
1.	issued_amount по убыванию;   
2.	loan_id по возрастанию.  
Решение:
SELECT loan_id, issued_amount,   
CASE   
WHEN issued_amount < 100000 THEN 'Маленький'  
WHEN issued_amount BETWEEN 100000 AND 500000 THEN 'Средний'  
ELSE 'Крупный' AND AS loan_size  
FROM loans    
ORDER BY issued_amount DESC, loan_id ASC;  


Задача 4. Изменение процентной ставки кредитного продукта   
Необходимо вывести:  
loan_product_id   
product_name   
interest_rate (как old_rate)  
new_rate   
Правила:  
для продукта с названием «Ипотека» процентная ставка не изменяется  
если процентная ставка меньше 10%, увеличить ее на 1 процентный пункт   
во всех остальных случаях увеличить ставку на 0.5 процентного пункта  
Отсортировать результат:  
1.	по new_rate — по убыванию  
2.	по loan_product_id — по возрастанию  
Решение:  
SELECT loan_product_id, product_name, interest_rate AS old_rate, 
CASE 
WHEN product_name = 'Ипотека' THEN interest_rate 
WHEN interest_rate < 10 THEN interest_rate + 1 
ELSE interest_rate + 0.5 
END AS new_rate 
FROM loan_products 
ORDER BY new_rate DESC, loan_product_id ASC;

