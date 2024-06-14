--examples tested on https://sql-ex.ru/

--select:
select model, speed, hd from PC where price < 500
    --distinct:
Select distinct maker from Product where type='Printer'
    --in:
Select model, speed, hd from PC where price<600 and cd in('12x', '24x')

--join, union:
    --classic join, alias:
select distinct maker, speed from laptop l join product p on l.model=p.model where hd>=10
    --union, simple join:
Select distinct p.model, price from product p, pc where p.model=pc.model and maker='B'
union
Select distinct p.model, price from product p, laptop l where p.model=l.model and maker='B'
union
Select distinct p.model, price from product p, printer pr where p.model=pr.model and maker='B'
    --join same table:
select pc1.model, pc2.model, pc1.speed, pc1.ram
from pc pc1 join PC pc2 on pc1.speed=pc2.speed
where pc1.ram=pc2.ram and pc1.model>pc2.model

--subqueries, aggregation, having:
Select distinct maker from product where type='PC' and maker not in(Select distinct maker from product where type='Laptop')
    --all, 3 tables:
select type, p.model, l.speed from product p join laptop l on l.model=p.model where l.speed<all(select speed from PC)
    --max:
Select model, price from printer where price in(select max(price) from printer)
    --avg
Select avg(speed) as speed from laptop where price>1000
    --having:
Select hd from pc group by hd having count(*)>=2
