# sql_project_data_analysis_jobs 


# INTRODUCTION
By Diving into the job market, and focusing on data analyst role, this project explores top paying jobs, in-demand skills and the intersecrtion between high demand skills and high salaries in data analytics. Check it out here ([sql_basics_project.ipynb](https://github.com/dareoyeleke/sql_queries_colab/blob/da219484324013f37575926119d1bc79ef830913/sql_basics_project.ipynb))



# BACKGROUND
The Data I used for this project, while imported from my google drive was from (https://lukebarousse.com/sql)
### The questions I wanted to answer through my queries were 
1) What are the top paying Data-analyst jobs?
2) What skills are required for these top-paying jobs?
3) What skills are most in demand for data analysts?
4) Which skills are associated with higher salaries
5) What skills are most optimal to learn



# TOOLS I USED
For my dive into the data analyst job market, I used several key tools including 
- **SQL**: The most important tool for my analysis, both implemented in VScode and Google colab IDE
- **PostgreSQL**: The database management system used to handle the job postings data
- **VScode**: One of the IDE's used to manage and execute SQL queries as well as integrate with postgreSQL
- **Google Colab** : Another IDE used while on the move and not having access to my PC, used in accordance with python to import files from Drive and connect to postgreSQL and run SQL code using %sql magic
- **Python**: Used to import files from drive and access PostgreSQL as well as use %sql magic to run SQL queries on colab
- **bash** : used to create a local directory on colab to store the imported files from drive 
- **Git&Github** : Used for collaboration and project tracking to share my SQL queries from both IDE's.


# The ANALYSIS
Each query in this project is aimed at investigating different aspects of the Data analyst job market 
1) **Top paying Data Analyst Jobs** - To identify the highest paying roles by filtering data analyst positions by average yearly salary, degree requirement and location.
  ```sql
    SELECT
      name AS company_name,
      job_id,
      job_title,
      job_location,
      job_schedule_type,
      CAST(salary_year_avg AS INTEGER),
      job_posted_date::DATE
    FROM
      job_postings_fact jpf
    LEFT JOIN company_dim cd ON jpf.company_id = cd.company_id
    WHERE job_title_short = 'Data Analyst' AND (job_location = 'United States' OR job_location = 'Anywhere') AND job_no_degree_mention = TRUE AND salary_year_average IS NOT NULL 
    ORDER BY salary_year_avg DESC
    LIMIT 100
  ```
# The results show
- **Wide Salary range** From $40 - $650 thousand (USD) indicating significant potential salaries in the field
- **Diverse employers** From Tech companies to law firms to even job recruiters, different sectors of the economy need and pay well for Data Analyst skills
- **Job Variety** Along with diverse employers, diverse job titles show diverse job roles in finance, tech, management to name a few


2) **Top paying skills** -  Building on the last query, adding the specific skills needed for said jobs to help understand what skills are required to get those jobs to encourage guided effort towaards building those skills
  ```sql
    WITH data_analyst_jobs AS
    (
    SELECT
      name AS company_name,
      job_id,
      job_title_short,
      job_location,
      job_no_degree_mention,
      job_schedule_type,
      CAST(salary_year_avg AS INTEGER),
      job_posted_date::DATE
    FROM
      job_postings_fact jpf
    LEFT JOIN company_dim cd ON jpf.company_id = cd.company_id
    WHERE
      job_title_short = 'Data Analyst'
      AND job_location = 'United States'
      AND job_no_degree_mention = TRUE
    ORDER BY
      salary_year_avg DESC
    LIMIT 100
    )
    SELECT
      skills,
      type,
      company_name,
      job_title_short,
      job_no_degree_mention,
      job_location,
      CAST(salary_year_avg AS INTEGER),
      job_posted_date::DATE
    FROM skills_job_dim sjd
    INNER JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
    INNER JOIN data_analyst_jobs daj ON sjd.job_id = daj.job_id
    WHERE
      job_title_short = 'Data Analyst'
      AND job_location = 'United States'
      AND job_no_degree_mention = TRUE
      AND salary_year_avg IS NOT NULL
    # would be 2025, but no data inputs for current year
    ORDER BY
      salary_year_avg DESC
  ```
# The results show
- The top skills are SQL,excel and POWERBI with salaries of $118,640(USD) per annum in USD with the company Invernegy.
- Coming in second are Python as a skill and two of it's libraries numpy and panda along with SQL, zoom and slack at $100,500(USD) for Udacity Inc
- Lastly American National pay $59,500(USD) for Data Analyst jobs with SQL and tablue skills respectively.
- This result set also took into consideration that no skills without salary values i.e null values were pulled from the table.



3) **Country Specific or remote jobs** Query to find skills and no of jobs per skill for Data Analyst jobs that are in the US or are remote jobs
  ```sql
    SELECT
      skills,
      sd.skill_id,
      COUNT(skills) AS skill_count
    FROM
      job_postings_fact jpf
    LEFT JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
    LEFT JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
    WHERE 
      job_title_short = 'Data Analyst' 
      AND job_location = 'United States'
      OR job_work_from_home = TRUE 
    GROUP BY sd.skills, sd.skill_id
    ORDER BY skill_count DESC
  ```
# The results show 
    - Python and sql are the leading skills for US based or remote jobs with the total mention for each skill at 40,616 and 40,352 respectively
    - Following the top two skills, we see a steep drop in the mention for aws and azure skills at 18,286 and 13,928  respectively



4) **Average salary by skill** The next Query pulls data from the table for the average pay for each skill for remote Data analyst jobs
  ```sql
    SELECT
      skills,
      CAST(AVG(salary_year_avg) AS INTEGER) AS avg_yearly_salary
    FROM
      job_postings_fact jpf
    FULL JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
    FULL JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
    WHERE 
      job_title_short = 'Data Analyst' 
      AND job_work_from_home = TRUE  
      AND (skills, salary_year_avg) IS NOT NULL
    GROUP BY sd.skills
    ORDER BY AVG(salary_year_avg) DESC
  ```
# The results show
  - The top five skills differ from the past 3 result sets by showing niche skills such as
    - Pyspark (python BASED API, an open source framework for machine learning and big data analytics) with an average salary of $208,172
    - Bitbucket(Git based coding platform for hosting, managing and collaborating using git repositories) at $189,155,
    - Watson(IBM AI platform using natural language for data analysis and linear modelling) at $160,515
    - couchbase(Cloud based database platform for high performance in-memory NoSQL database) at $160,515
    - Datarobot(AI platform for end to end learning and ML lifecycle and modeldeployment ) at $155,486
    - The query also pulls data for the lower end with skills such as visual basic($62,500), ruby($61,780), css($52,500), ruby on rails($51,059) and wire($42,500)
      - **All in ($USD)**
    - This shows the differing range of salaries for jobs in the same field and how capitalizing on different skills sets can lead to vastly different outcomes in salary earned per year

5) **Most profitable skill** Comparing sum of jobs with their skills by salary average.
   ```sql
      SELECT
        sd.skills,
        skill_counts.skill_id,
        skill_counts.job_count,
        CAST(skill_counts.avg_yearly_salary AS INT) AS avg_yearly_salary
      FROM (
        SELECT
          sjd.skill_id,
          COUNT(jpf.job_id) AS job_count,
          AVG(jpf.salary_year_avg) AS avg_yearly_salary
        FROM
          job_postings_fact jpf
        LEFT JOIN 
          skills_job_dim sjd ON jpf.job_id = sjd.job_id
        WHERE 
          jpf.salary_year_avg IS NOT NULL
        GROUP BY 
          sjd.skill_id
      ) AS skill_counts 
      LEFT JOIN skills_dim sd ON skill_counts.skill_id = sd.skill_id
      WHERE 
        skill_counts.job_count > 10
      ORDER BY 
        skill_counts.avg_yearly_salary DESC, 
        skill_counts.job_count DESC
   ```

 
# WHAT I LEARNED

CONCLUSIONS 
