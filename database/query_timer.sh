#!/bin/bash

label="$1"
num_reps="$2"
query="$3"
db_file="$4"
csv_file="$5"

start_time=$(date +%s)

for i in $(seq "$num_reps"); do
    duckdb "$db_file" "$query"
done

end_time=$(date +%s)

elapsed=$((end_time - start_time))

avg=$(python3 -c "print($elapsed / $num_reps)")

echo "$label,$avg" >> "$csv_file"