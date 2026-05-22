/* 1. Display Complete HR Attrition Dataset */
select * from attrition_data;

/* 2. Display Age Column With Encoding Issue */
SELECT `ï»¿Age`
FROM attrition_data;

/* 3. Rename Incorrect Age Column */
ALTER TABLE attrition_data
RENAME COLUMN `ï»¿Age` TO Age;

/* 4. Display Age And Attrition Status */
select age ,attrition
from attrition_data;

/* 5. Total Employee Count */
select count(age) 
from attrition_data;

/* 6. Count Of Employees Who Left Organization */
select count(attrition) 
from attrition_data
where attrition='yes';

/* 7. Gender Wise Employee Count */
select gender, count(gender)as total
from attrition_data
group by gender;

/* 8. Business Travel Wise Attrition Analysis */
select BusinessTravel, count(BusinessTravel) 
from attrition_data
where attrition='Yes'
group by BusinessTravel;
	
/* 9. Department Wise Attrition Count */    
select department ,count(department) as total
from attrition_data 
where attrition='Yes'
group by department
order by total desc;

/* 10. Education Level Wise Attrition Analysis */
select education_level ,count(education_level) as edlevel_count
from attrition_data
where attrition='Yes'
group by education_level 
order by edlevel_count  desc ;

/* 11. Environment Satisfaction Level Wise Attrition */
select Environment_Level , count(Environment_Level) as total
from attrition_data
where attrition='Yes'
group by  Environment_Level 
order by total  desc ;

/* 12. Job Involvement Level Wise Attrition */
select `Job Involvment_Level`, count(`Job Involvment_Level`) as total
from attrition_data
where attrition='Yes'
group by `Job Involvment_Level`
order by total  desc ;

/* 13. Job Role Wise Attrition Analysis */
select JobRole, count(JobRole) as total
from attrition_data
where attrition='Yes'
group by JobRole
order by total  desc ;

/* 14. Job Satisfaction Level Wise Attrition */
select Satisfaction_Level, count(Satisfaction_Level) as total
from attrition_data
where attrition='Yes'
group by Satisfaction_Level
order by total  desc ;

/* 15. Marital Status Wise Attrition Analysis */
select MaritalStatus , count(MaritalStatus) as total
from attrition_data
where attrition='Yes'
group by MaritalStatus
order by total  desc ;

/* 16. Average Monthly Salary Of Employees */
select avg(MonthlyIncome) from
attrition_data;

/* 17. Above Average Salary Employees Attrition By Department */
select department ,monthlyincome ,count(department)
from attrition_data
where attrition ='Yes' and monthlyincome>( select avg(monthlyincome)
from attrition_data)
group by  department,monthlyincome
order by
CASE 
    WHEN Department = 'Human Resources' THEN 1
    WHEN Department = 'Sales' THEN 2
    WHEN Department = 'Research & Development' THEN 3
    WHEN Department = 'Marketing' THEN 4
    ELSE 5
END,
MonthlyIncome DESC;

/* 18. Overtime Wise Attrition Analysis */
select OverTime  , count(OverTime) as total
from attrition_data
where attrition='Yes'
group by OverTime
order by total  desc ;

/* 19. Previous Companies Worked Wise Attrition */
select NumCompaniesWorked , count(NumCompaniesWorked) as total
from attrition_data
where attrition='Yes'
group by NumCompaniesWorked
order by total  desc;

/* 20. Relationship Satisfaction Level Wise Attrition */
select Relationshipsatisfaction_level, count(Relationshipsatisfaction_level) as total
from attrition_data
where attrition='Yes'
group by Relationshipsatisfaction_level
order by total  desc;

/* 21. Work Life Balance Level Wise Attrition */
select WLB_Level, count(WLB_Level) as total
from attrition_data
where attrition='Yes'
group by WLB_Level
order by total  desc;

/* 22. Highest Monthly Income Employee */
select MonthlyIncome
FROM attrition_data
WHERE MonthlyIncome = (
    select MAX(MonthlyIncome)
    FROM attrition_data
);

/* 23. Lowest Monthly Income Employee */
select MonthlyIncome
FROM attrition_data
WHERE MonthlyIncome = (
    select Min(MonthlyIncome)
    FROM attrition_data
);

/* 24. Average Employee Age */
select avg( age)
from attrition_data;

/* 25. Maximum Age Employee Leaving Organization */
SELECT Age, Attrition
FROM attrition_data
WHERE Attrition = 'Yes'
AND Age = (
    SELECT MAX(Age)
    FROM attrition_data
    WHERE Attrition = 'Yes'
);

/* 26. Minimum Age Employee Leaving Organization */
SELECT Age, Attrition
FROM attrition_data
WHERE Attrition = 'Yes'
AND Age = (
    SELECT Min(Age)
    FROM attrition_data
    WHERE Attrition = 'Yes'
);


/* 27. Maximum Years At Company */
SELECT  YearsAtCompany
FROM attrition_data
WHERE YearsAtCompany = (
    SELECT MAX(YearsAtCompany)
    FROM attrition_data
);


/* 28. Department Wise Employee Age Ranking Using Window Function */
select 
    age,
    department,
    ROW_NUMBER() OVER(
        PARTITION BY Department
        ORDER BY AGE DESC
    ) AS Row_Num
from attrition_data;

/* 29. Maximum Years Since Last Promotion */
SELECT YearsSinceLastPromotion
FROM attrition_data
WHERE YearsSinceLastPromotion = (
    SELECT MAX(YearsSinceLastPromotion)
    FROM attrition_data
);


