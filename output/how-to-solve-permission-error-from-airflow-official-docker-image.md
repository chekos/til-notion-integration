---
title: how to solve permission error from airflow official docker image
date: 2022-01-27T20:00:00.000Z
tags: [docker, airflow, python]
---
## what i learned
tl;dr: If you get a permission error (Errno 13) regarding python’s logging config make sure your local `./logs/` folder has read write permissions for “Others”. Use `sudo chmod o+rw logs` to allow the container airflow user to write logs. This user is the
when using Airflow’s official `docker-compose.yml` in a virtual machine (VM) you might find a permissions error from the first step ( `docker-compose up airflow-init` .) This is because you are bind mounting a local `./logs/` directory to `/opt/airflow/logs/` in the container and within the container there is another user writing these logs to `/opt/airflow/logs/` that belongs to the `root` user group. Your local `./logs/` directory may not have read and write permissions for that user or user group.

## how i learned


## reference