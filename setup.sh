
#!/bin/bash

host_ip=$(ip addr show | awk '/state UP/{
    while ($1 != "inet") getline; 
    split($2, a, "/"); 
    print a[1]; 
    exit}')

docker swarm init --advertise_addr $host_ip