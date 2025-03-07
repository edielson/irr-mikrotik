#!/bin/bash
# Script for generating BGP filter for Mikrotik RouterOS


path=/usr/share/mikrotik-irrupdater

bgpq4 -F '%n/%l \n' -4 -A $2 > $path/db/$1.4.agg
bgpq4 -F '%n/%l \n' -6 -A $2 > $path/db/$1.6.agg
