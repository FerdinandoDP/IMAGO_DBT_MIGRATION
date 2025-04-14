FROM apache/airflow:2.10.5

USER airflow
RUN pip install dbt-core dbt-snowflake

USER airflow