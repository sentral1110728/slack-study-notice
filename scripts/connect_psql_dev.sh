#!/bin/sh -exv
cd infrastructire/environments/dev
eval "$(direnv export bash)"
PGPASSWORD=$TF_VAR_master_password psql --host=$TF_VAR_rds_psql_ip --port=5432 --username=$TF_VAR_master_user_name --dbname=$TF_VAR_db_name
