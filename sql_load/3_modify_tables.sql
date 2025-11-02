
-- importing csv files from computer to populate previosly created tables with csv file data 
COPY company_dim
FROM 'C:\Users\14075\Desktop\SQL_Project_Data_Job_Analysis\cvs_imports\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM 'C:\Users\14075\Desktop\SQL_Project_Data_Job_Analysis\cvs_imports\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM 'C:\Users\14075\Desktop\SQL_Project_Data_Job_Analysis\cvs_imports\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM 'C:\Users\14075\Desktop\SQL_Project_Data_Job_Analysis\cvs_imports\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

