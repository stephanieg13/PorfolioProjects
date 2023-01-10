select * 
from PortfolioProject.dbo.internationaltouristarrivals
order by 1

--Showing highest tourism arrivals throughout the years, transforming float data to interger

select Entity, YearArrival, MAX(cast(ArrivalNumbers as int)) as ArrivalMax
from PortfolioProject.dbo.internationaltouristarrivals 
group by Entity, YearArrival
order by ArrivalMax desc 

--Breaking data down by max tourist arrival by year from 1995-2020 

select YearArrival, MAX(cast(ArrivalNumbers as int)) as ArrivalMax
from PortfolioProject.dbo.internationaltouristarrivals 
group by YearArrival
order by ArrivalMax desc 


--Joining data tables based on entity/location, and the year

select * 
from PortfolioProject.dbo.internationaltouristarrivals arri
 join PortfolioProject.dbo.tourismgdp gdp
	on arri.entity1 = gdp.entity2
	and arri.yeararrival = gdp.yearcollected
 


create view TourImpact as 
select * 
from PortfolioProject.dbo.internationaltouristarrivals arri
 join PortfolioProject.dbo.tourismgdp gdp
	on arri.entity1 = gdp.entity2 
	and arri.yeararrival = gdp.yearcollected 
	and arri.code1 = gdp.code2


	select * 
	from TourImpact

select Entity1, Code1, YearArrival
from PortfolioProject.dbo.internationaltouristarrivals
union
select Entity2, Code2, YearCollected
from PortfolioProject.dbo.tourismgdp

create view LocationYear as
select Entity1, Code1, YearArrival
from PortfolioProject.dbo.internationaltouristarrivals
union
select Entity2, Code2, YearCollected
from PortfolioProject.dbo.tourismgdp

select *
from LocationYear

select *
from TourImpact

