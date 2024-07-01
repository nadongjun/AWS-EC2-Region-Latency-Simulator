#172.18.0.1 - 172.18.0.62 california
#172.18.0.65 - 172.18.0.126 tokyo
#172.18.0.129 - 172.18.0.190 singapore
sleep 60s
# root qdisc 생성
tc qdisc add dev eth0 root handle 1: prio

# 1:1 클래스 생성
tc qdisc add dev eth0 parent 1:1 handle 10: netem delay 50ms
tc filter add dev eth0 parent 1:0 protocol ip prio 1 u32 match ip dst 172.18.0.64/26 flowid 1:1

# 1:2 클래스 생성
tc qdisc add dev eth0 parent 1:2 handle 20: netem delay 85ms
tc filter add dev eth0 parent 1:0 protocol ip prio 1 u32 match ip dst 172.18.0.128/26 flowid 1:2

# Default
tc qdisc add dev eth0 parent 1:3 handle 30: netem delay 0ms
tc filter add dev eth0 parent 1:0 protocol ip prio 2 u32 match ip dst 0.0.0.0/0 flowid 1:3