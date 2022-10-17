-- https://sql-ex.ru/help/select13.php#db_1

-- 1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
select model, speed, hd
from pc
where price < 500

-- 2. Найдите производителей принтеров. Вывести: maker
select distinct maker 
from Product  
where type = 'Printer'

-- 3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
select model, ram, screen 
from laptop where price > 1000

-- 4. Найдите все записи таблицы Printer для цветных принтеров.
Select * from printer where color = 'y'

-- 5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
Select distinct model, speed, hd 
from PC 
where (cd = '12x' or cd = '24x') and price < 600

-- 6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
select distinct product.maker, laptop.speed
from product, laptop
where product.model = laptop.model
and laptop.hd >= 10

-- 7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
select distinct pc.model, price from pc join product on pc.model = product.model
where maker = 'B'
union
select distinct laptop.model, price from laptop join product on laptop.model = product.model
where maker = 'B'
union 
select distinct printer.model, price from printer join product on printer.model = product.model
where maker = 'B'

-- 8. Найдите производителя, выпускающего ПК, но не ПК-блокноты.
select distinct maker 
from product 
where type = 'pc' 
and maker not in 
(select maker 
from product 
where type = 'laptop') 

-- 9. Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
select distinct maker
from pc 
join product on pc.model=product.model 
where type = 'pc' and speed >= 450

-- 11. Найдите среднюю скорость ПК.
select avg (speed) from pc

-- 12. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
select avg (speed) from laptop where price >1000

-- 13. Найдите среднюю скорость ПК, выпущенных производителем A.
select avg (speed)
from pc join product on pc.model=product.model
where maker = 'A'

-- 14. Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
Select ships.class, ships.name, country 
from ships join classes on ships.class = classes.class 
where numGuns >= 10

-- 15. Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
Select hd from pc group by hd having count (hd) >1

