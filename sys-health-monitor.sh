#!/bin/bash

set -x

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

get_cpu_usage(){
     cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1 )
     cpu_int=${cpu_usage%.*}

     if [ $cpu_int -gt 80 ]; then
          echo -e "${RED}$cpu_usage%${NC}"
     elif [ $cpu_int -gt 60 ]; then
          echo -e "${YELLOW}$cpu_usage%${NC}"
     else
          echo -e "${GREEN}$cpu_usage%${NC}"
     fi
}

get_memory(){
     total_mem=$(free -h | grep Mem | awk '{print $2}')
     used_mem=$(free -h | grep Mem | awk '{print $3}')
     free_mem=$(free -h | grep Mem | awk '{print $4}')
     mem_percent=$(free -h | grep Mem | awk '{print $3/$2*100}' | cut -d'.' -f1)

     if [ $mem_percent -gt 80 ]; then
         echo -e "Total: $total_mem | Used: ${RED}$used_mem${NC} | Free: $free_mem"
     elif [ $mem_percent -gt 60 ]; then
         echo -e "Total: $total_mem | Used: ${YELLOW}$used_mem${NC} | Free: $free_mem"
     else
         echo -e "Total: $total_mem | Used: ${GREEN}$used_mem${NC}  Free: $free_mem"
     fi
}

get_disk_usage(){
     df -h / | tail -1 | awk '{print "Used: " $3 " / " $2 " (" $5 ")"}'
}

show_top_processes(){
     echo -e "\n${BLUE}Top 5 CPU-Consuming Processes:${NC}"
     ps aux --sort=-%cpu | head -6 | tail -5 | awk '{print "%-8s %-20s %s%%\n", $1, $11, $3}'
}

while true; do
     clear
     echo -e "${BLUE}==============================${NC}"
     echo -e "${BLUE}    System Health Dashoard    ${NC}"
     echo -e "${BLUE}==============================${NC}"
     echo ""
     echo -e "CPU Usage: $(get_cpu_usage)"
     echo -e "Memory: $(get_memory)"
     echo -e "Disk: $(get_diak_usage)"
     echo -e "Uptime: $(uptime | cut -d' ' -f2-)"
     echo -e "Load: $(uptime | awk -F'load average:' '{print $2}')"

     show_top_processes

     echo -e "\n${YELLOW}Options: [R]efresh [P]rocesses [N]etwork [Q]uit${NC}"
     read -t 5 -n 1 option

     case $option in
          [Rr]) continue ;;
          [Pp])
                echo -e "\n${BLUE}press any key to return to dashboard ..${NC}"
                htop 2>/dev/null || top
                ;;
          [Nn])
                echo -e "\n${BLUE}Active Network Connections:${NC}"
                netstat -tunap 2>/dev/null | grep ESTABLISHED | head -5
                read -p "Press enter to continue..."
                ;;
          [Qq])
                echo -e "\n${GREEN}Exiting....${NC}"
                exit 1
                ;;
      esac
done


set +x

