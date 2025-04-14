from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime,timedelta

##setting default arguments

default_args = {
    'owner': 'airflow',
    'retries': 1,
    'retry_delay': timedelta(minutes = 5)
}

##DAG definition to exec the pipeline

with DAG(
    dag_id = 'pipeline',
    default_args=default_args,
    description='It will Execute dbt seed for staging tables and after dbt run for the others',
    schedule_interval='@hourly',
    start_date=datetime(2025,4,13),
    catchup=False,
    tags=['dbt']
) as dag:

    dbt_seed = BashOperator(
        task_id='dbt_seed',
        bash_command='cd /opt/airflow/dbt && dbt seed --profiles-dir .'
    )

    dbt_run = BashOperator(
        task_id='dbt_run',
        bash_command='cd /opt/airflow/dbt && dbt run --profiles-dir .'
    )

    dbt_seed >> dbt_run