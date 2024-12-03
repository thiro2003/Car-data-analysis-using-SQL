-- Basic Queries (1-10)
-- Find the distinct types of vehicles in the dataset.
select distinct Type from data;
-- List all vehicles with MSRP greater than $30,000 and originating from the USA.
select * from data where MSRP>30300 and Origin="USA";
update  data set MSRP=cast(replace(MSRP,',','') as int)
select MSRP from data;

-- Retrieve the top 5 most expensive models based on MSRP, showing Make, Model, and MSRP.
SELECT MSRP,Make,Model from data order by MSRP desc limit 10;
-- Display all vehicles that have an EngineSize of 4.0 liters or higher.
select * from data where EngineSize>=4.0;
-- Find models with an MPG_Highway greater than 30 and Horsepower over 200.
select Model,Make,MPG_Highway from data where MPG_Highway>30 and Horsepower>200;
SELECT Make, Model, MPG_Highway, Horsepower FROM your_table WHERE MPG_Highway > 30 AND Horsepower > 200;
-- Show the total count of vehicles per type.
select Type,count(make) from data group by Type;
-- Retrieve the models with less than 6 cylinders but Horsepower greater than 150.
select Model from data where Cylinders<6 and Horsepower>150;
-- Find all models where the Invoice price is less than $20,000 and Weight is under 3,000 pounds.
select Model from data where Invoice<20000 and Weight<3000;
-- Display vehicles with a Wheelbase between 100 and 120 inches.
select * from data where Wheelbase between 100 and 200;
-- Find all models whose Length is below the average Length across all vehicles.
select Model  from data where Length<(select  avg(Length) from data);
-- Aggregations (11-20)
-- Calculate the average MSRP per vehicle type.
select Type,avg(MSRP) from data group by Type;
-- Find the maximum and minimum Horsepower for each Origin.
select Origin,max(Horsepower),min(Horsepower) from data group by Origin;
-- List the total MSRP and total Invoice amounts for vehicles with DriveTrain = 'All Wheel'.

-- Show the average MPG_City for each combination of Type and DriveTrain.
select Type, DriveTrain,avg(MPG_City) from data  group by Type, DriveTrain;
-- Calculate the average Length of vehicles from each Origin.
select Origin,avg(Length) from data group by Origin;
-- Find the sum of Weights for all vehicles with an EngineSize greater than 3.0 liters.
select sum(Weight) from data where EngineSize>3.0 ;
-- Retrieve the average Horsepower for each cylinder count.
select cylinders,avg(Horsepower) from data group by cylinders;
-- Calculate the total count of models with MPG_Highway over 35 and originating from USa.
select sum(Model) from data where MPG_Highway>35 and Origin="USA";
-- Find the average Wheelbase for each vehicle type and order by the highest average Wheelbase.
select Type,avg(Wheelbase) as av from data group by Type order by av limit 1;
-- Show the total number of models per DriveTrain where the Horsepower exceeds 250.
select DriveTrain ,sum(Model) from data where Horsepower>250 group by DriveTrain ;
-- Advanced Aggregations and Joins (21-30)
-- List all models whose MSRP is more than 20% above the average MSRP for their type.
SELECT* FROM your_table WHERE MSRP > 1.2 * (SELECT AVG(MSRP) FROM your_table AS avg_msrp WHERE avg_msrp.Type = your_table.Type);


