create database churn;

use churn;

CREATE TABLE customers (
    gender VARCHAR(10),
    SeniorCitizen VARCHAR(10),
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(50),
    InternetService VARCHAR(50),
    OnlineSecurity VARCHAR(50),
    OnlineBackup VARCHAR(50),
    DeviceProtection VARCHAR(50),
    TechSupport VARCHAR(50),
    StreamingTV VARCHAR(50),
    StreamingMovies VARCHAR(50),
    Contract VARCHAR(50),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(100),
    MonthlyCharges FLOAT,
    TotalCharges FLOAT,
    Churn INT,
    TenureGroup VARCHAR(20),
    ChargeLevel VARCHAR(20)
);
USE CHURN;
SELECT * FROM CUSTOMERS;

drop table customers;

rename table cleaned_churn to customer;

select * from customer;

select count(*) from customer;

-- 1. Overall customer metrics  (KPI)

select 
count(*) as Total_customers,
sum(Churn) as Churned_customers,
avg(Churn) as Churn_rate
from customer;

-- 2. Churn Analysis by Contract type
select Contract, avg(Churn)*1000 as Churn_Rate
from customer
group by Contract
order by Churn_Rate desc;

-- 	3. Churn Analysis by Tenure group 

select TenureGroup, avg(Churn)*100 as Churn_rate
from customer
group by TenureGroup;

-- 4.. Churn Analysis by Monthly Charge level 

select MonthlyCharges, avg(Churn)*100 as Churn_rate
from customer
group by MonthlyCharges;

-- 5. Revenue loss due to churn 

select sum(MonthlyCharges) as Revenue_lost
from customer 
where Churn = 1 ;

select avg(Churn) as Churn_rate , PaymentMethod
from Churn 
group by PaymentMethod
order by Churn_rate desc;