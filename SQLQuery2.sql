-- global number

select date,sum(max(total_cases)), total_deaths,(total_deaths/total_cases)*100 as deathpercentage
from porfolioproject..CovidDeaths
where continent is not null
group by date
order by 1,2

--looking at total population vs vaccination
 select death.continent,death.location, death.date,death.population, vac.new_vaccinations, sum(cast(vac.new_vaccinations as int)) over (partition by death.location order by death.location , death.date) as peoplevaccinated
 from porfolioproject..CovidDeaths death
 join porfolioproject..Covidvacination vac
 on death.location= vac.location
 and death.date=vac.date
 where death.continent is not null
 order by 2,3

 --create cte
 with popvsvac ( continent , location , date, population, new_vaccination,peoplevaccinated)
 as
 (
 select death.continent,death.location, death.date,death.population, vac.new_vaccinations, sum(cast(vac.new_vaccinations as int)) over (partition by death.location order by death.location , death.date) as peoplevaccinated
 from porfolioproject..CovidDeaths death
 join porfolioproject..Covidvacination vac
 on death.location= vac.location
 and death.date=vac.date
 where death.continent is not null
 )
 select*, (peoplevaccinated/population)*100
 from popvsvac