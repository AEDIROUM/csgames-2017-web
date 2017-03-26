#!/bin/sh
rm -f project9/sgbd.db
sqlite3 project9/sgbd.db < project9/scheme.sql
./run.py
