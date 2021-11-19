#!/bin/bash

## Nested iteration to try all possible combinations of model- generation technique - article.

Models="google/pegasus-xsum google/pegasus-cnn_dailymail google/pegasus-large facebook/bart-large-cnn facebook/bart-large-xsum sshleifer/distilbart-cnn-12-6 sshleifer/distilbart-xsum-12-6"
Articles="articles/one.txt articles/two.txt articles/three.txt"
Generation="search sampling"

for article in $Articles; do
    echo "Summarizing article '$article'"  
    for technique in $Generation; do
      echo "Using '$technique' as generation technique"
      for model in $Models; do
        echo "Trying with model '$model' ..."
        python summarize.py --model_name="$model" --article="$article" --generation="$technique"
      done
    done
done