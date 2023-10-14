--hightest infection 

select location, population,max(total_cases) as hightestinfectioncount, MAX(total_cases/population)*100 as deathpercentage
from porfolioproject..CovidDeaths
group by location,population
order by deathpercentage

--highest death count
select location,max(cast(total_deaths as int)) as totaldeathcount
from porfolioproject..CovidDeaths
where continent is not null
group by location
order by totaldeathcount desc



--removing continents
select*
from porfolioproject..CovidDeaths
where continent is not null

select continent,max(cast(total_deaths as int)) as totaldeathcount
from porfolioproject..CovidDeaths
--where continent like '%state%'
where continent is not null
group by continent
order by totaldeathcount desc

--continents with hightest deathcount
select location,max(cast(total_deaths as int)) as totaldeathcount
from porfolioproject..CovidDeaths
where continent is not null
group by location
order by totaldeathcount desc

select date , sum(new_cases),sum(cast(new_deaths as int))
from porfolioproject..CovidDeaths
where continent is not null
group by date


