This document outlines the proposed solution for Task 3 of the IMAGO project.
In this task, a DBT (Data Build Tool) project was developed and is located within the /dbt directory inside the Airflow Docker container.
To orchestrate the daily execution of DBT models, a DAG (Directed Acyclic Graph) is defined in the ETL.py file, which resides in the /dags directory. This DAG is scheduled to run daily using Apache Airflow, ensuring that data transformations are executed consistently.
The entire pipeline is designed to load and transform data within Snowflake, leveraging its scalability and performance for data warehousing and analytics.
