#!/bin/bash

psql -c "create database gateway_db;"

python gateway/manage.py makemigrations texts texts_admin
python topic_modeling/manage.py makemigrations api
python seo_analysis/manage.py makemigrations api

python gateway/manage.py migrate
python topic_modeling/manage.py migrate
python seo_analysis/manage.py migrate

python gateway/manage.py test
python topic_modeling/manage.py test
python seo_analysis/manage.py test

coverage run -a gateway/manage.py test
coverage run -a topic_modeling/manage.py test
coverage run -a seo_analysis/manage.py test
coverage report