#!/bin/bash

for file in "./db"/*.sql; do
    psql -f "${file}" > ${file%.sql}.sh
  
done

