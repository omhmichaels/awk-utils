#!/bin/bash

# Run mail_merge
awk -f mail_merge.awk proposals.csv
