#!/bin/bash
rm sgbd.db
sqlite3 sgbd.db < scheme.sql
