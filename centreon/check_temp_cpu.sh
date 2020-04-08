#!/bin/bash
#===============================================================================
# Centreon Plugin Bash Script - check_temp_cpu.sh
# Auteur : kermith72
# Date   : 08/04/2020
# But    : This script checks the temperature of cpu in Raspberry
#===============================================================================
#
# Usage info
show_help() {
cat << EOF
Usage: ${0##*/} [-w=<warning temperature>] [-c=<critical temperature>]
This script checks the temperature of cpu in Raspberry (-25°/80°)
 
    -w|--warning  Threshold warning.
    -c|--critical Threshold critical.
    -h|--help     help
EOF
}
 
for i in "$@"
do
  case $i in
    -w=*|--warning=*)
      WARNING="${i#*=}"
      shift # past argument=value
      ;;
    -c=*|--critical=*)
      CRITICAL="${i#*=}"
      shift # past argument=value
      ;;
    -h|--help)
      show_help
      exit 3
      ;;
    *)
            # unknown option
    ;;
  esac
done
 
 
# Check for missing parameters
if [[ -z "$WARNING" ]] || [[ -z "$CRITICAL" ]] ; then
    echo "UNKNOWN - Missing parameters!"
    show_help
    exit 2
fi
 
# Check warning is lower  than critical
if [[ "$WARNING" -gt "$CRITICAL" ]]; then
        echo "UNKNOWN - WARNING must be lower than CRITICAL ! "
        exit 2
fi
 
# read temperature of raspberry
cpu=$(</sys/class/thermal/thermal_zone0/temp)
tempcpu=$((cpu/1000))
 
# Check if temperature is lower than WARNING  threshold parameter
if [[ "$tempcpu" -lt "$WARNING" ]]; then
        echo "OK - $tempcpu C | temp=${tempcpu}C;$WARNING;$CRITICAL;0;100"
        exit 0
fi
# Check if temperature is greater than WARNING threshold parameter and lower than CRITICAL threshold parameter
if [[ "$tempcpu" -ge "$WARNING" ]] && [[ "$tempcpu" -lt "$CRITICAL" ]]; then
        echo "WARNING - $tempcpu C | temp=${tempcpu}C;$WARNING;$CRITICAL;0;100"
        exit 1
fi
# Check if temperature is greater than CRITICAL threshold parameter
if [[ "$tempcpu" -ge "$CRITICAL" ]]; then
        echo "CRITICAL - $tempcpu C | temp=${tempcpu}C;$WARNING;$CRITICAL;0;100"
        exit 2
fi
