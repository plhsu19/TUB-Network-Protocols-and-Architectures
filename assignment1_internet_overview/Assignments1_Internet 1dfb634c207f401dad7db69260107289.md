# Assignments1_Internet

## Assignment1

### Q1

(a) Consider Figure 1 carefully. What statistics are provided in the figure? Please name these
statistics and briefly (one sentence) explanin each:

Statistics provided in the graph are:

1. average traffic (bits/sec): average data flow rate passing through the IXP. The average value was probably calculated over each day.
2. peak traffic (bits/sec): the maximum data flow passing routed by IXP within each day.
3. Current: current traffic flow of 6478.1 Gigabits/sec at the moment when data was extracted.
4. Averaged: the average traffic flow of 9870.8 Gigabits/sec in the day when data is extracted.
5. Graph Peak (9370.8 G): the maximum peak traffic in the graph.
6. DE-CIX All-Time Peak: the all-time maximum peak traffic recorded in the IXP history.
7. Created at 2020-10-19 08:45 UTC: the timestamp when the graph/data was extracted.
8. Copyright: copyright belongs to the IXP company.

(b) Between March and April, both average and peak traffic increasd obviously. The increasing traffic trend reached its local maximum at the beginning of April, and then gradually decreased. In addition to the trend, there is a surge of traffic (both average and peak traffic) appeared around 10~15th of March. The increasing traffic in March is because of the Coronas lockdown, which enforced many peopole to work from home. The increasing amount of online-meeting, online-classes, and communications over internet resulted in the increasing traffic flow. The date that traffic surge happened also match the date that government announced the start of lockdown. As the pandemic became less severe, some people started to go back to workplaces, which resulted in the slight decrements of traffic in April.

(c) Yes, a roughly 1 TBits increment of average traffic flow is observed before and after the March. As mentioned in (b), it is very likely because of the lockdown policy which forced people to work remotely.

(d) In the second part of Dec. 2019, the peak traffic decreased in a large amount twice (dropped 0.6 to 1 TBits) while average traffic also showed decrements in these two periods. The two events corresponded to these sharp drops are Christmas (around 24th) and New Year (around 29th), when people were either spending time with family or celebrating new year with friends but not using the internet. In addition, people do not need to start working at the same time in the morning, e.g., 8:30, therefore the traffic congestion will not happen in the vacation and the peak traffic is relatively low as compared with the working days.

### Q2

a. b.

[Untitled](https://www.notion.so/2edf2daffff149c9b070193e61caeb71)

- RTT to the DNS resolver in Japan is longer than to Brazil although the distanc is shorter. Possible reasons are:
    1. There are more hops, e.g., ISPs, on the path to Kobe's resolver.
    2. There is congestion happen on the path the packets take, which make the packets queueing in the routers.
    3. There is congestions happen on the shorter paths to Japan, which force packets take longer path (more hops) to reach Kobe.

c. traceroute:

- Traceroute: include a small TTL (time to live) in the IP header(include Destination, source IP) of the probe packet. Once  the TTL is reached, the device on the route will send back a packet dropping message to the source, and the traceroute can record the RTT to the device. Then the traceroute will send a new probe packet with TTL += 1, by doing this the packet can reach next router of previous one, and again send back the packet dropping message to the sorce. Doing this iteratively until reach the destination
    - TTL:

        to avoid looping in the same circular route. 

        common is 64 hops, deduce 1 per hop. If exceed 64, the packet drops.

- Instead of ICMP, traceroute uses UDP by default to send the **probe packets** on some machines, eg., Mac. If you can reach a DNS resolver using ping (ICMP request/response), but traceroute does not terminate (i.e., reach/show the resolver), you can try using the -I option (on Linux and macOS). This option forces traceroute to send the **ICMP echo** requests instead of **UDP packets** towards the target server. (
- Some divices block these "I drop the packet" message from sending back even using ICMP packet.
1. Germany, Aachen (212.66.129.107):
    - with default UDP ping to the devices on the route to the resolver

        1 192.168.0.1 (192.168.0.1) 4.572 ms 5.278 ms 3.018 ms
        2 [h-155-4-58-1.na.cust.bahnhof.se](http://h-155-4-58-1.na.cust.bahnhof.se/) (155.4.58.1) 3.919 ms 4.442 ms 3.044 ms
        3 [h-109-228-167-222.na.cust.bahnhof.se](http://h-109-228-167-222.na.cust.bahnhof.se/) (109.228.167.222) 4.627 ms 5.498 ms 3.576 ms
        4 [quadracom-a328-sto-gw.bahnhof.net](http://quadracom-a328-sto-gw.bahnhof.net/) (46.59.116.241) 4.131 ms 3.684 ms 2.603 ms
        5 [netnod-a.stk.retn.net](http://netnod-a.stk.retn.net/) (194.68.123.157) 2.651 ms 3.104 ms 3.421 ms
        6 [et0110-2.rt.ncl.cgn.de.retn.net](http://et0110-2.rt.ncl.cgn.de.retn.net/) (87.245.233.141) 36.272 ms 40.956 ms 56.135 ms
        7 [gw-netcologne.retn.net](http://gw-netcologne.retn.net/) (87.245.227.97) 60.569 ms 55.539 ms 64.289 ms
        8 [ip-core-sto1-ae3.netcologne.de](http://ip-core-sto1-ae3.netcologne.de/) (81.173.192.113) 59.556 ms 28.616 ms 33.124 ms
        9 [ip-core-eup1-et2-2-2.netcologne.de](http://ip-core-eup1-et2-2-2.netcologne.de/) (87.79.17.17) 33.727 ms
        [ip-core-eup2-et2-2-2.netcologne.de](http://ip-core-eup2-et2-2-2.netcologne.de/) (87.79.17.25) 33.661 ms
        [ip-core-eup1-et2-2-2.netcologne.de](http://ip-core-eup1-et2-2-2.netcologne.de/) (87.79.17.17) 33.000 ms
        10 [bdr-eup1-ae2.netcologne.de](http://bdr-eup1-ae2.netcologne.de/) (195.14.195.54) 30.214 ms
        [bdr-eup1-ae1.netcologne.de](http://bdr-eup1-ae1.netcologne.de/) (195.14.195.50) 32.296 ms
        [bdr-eup1-ae2.netcologne.de](http://bdr-eup1-ae2.netcologne.de/) (195.14.195.54) 33.878 ms
        11 78.35.33.106 (78.35.33.106) 34.185 ms 35.952 ms 36.130 ms
        12 212.66.129.151 (212.66.129.151) 36.827 ms 34.768 ms 33.692 ms
        13 * * *
        14 * * *
        15 * * *
        16 * * *
        17 * * *
        18 * * *

        ⇒ Does not reach the resolver until 51 devices

    - Use -I to infoce using ICMP to send probe packages

        traceroute to 212.66.129.107 (212.66.129.107), 64 hops max, 72 byte packets
        1 192.168.0.1 (192.168.0.1) 3.229 ms 4.452 ms 1.234 ms
        2 [h-155-4-58-1.na.cust.bahnhof.se](http://h-155-4-58-1.na.cust.bahnhof.se/) (155.4.58.1) 5.361 ms 2.119 ms 2.815 ms
        3 [h-109-228-167-222.na.cust.bahnhof.se](http://h-109-228-167-222.na.cust.bahnhof.se/) (109.228.167.222) 4.575 ms 2.257 ms 2.144 ms
        4 [quadracom-a328-sto-gw.bahnhof.net](http://quadracom-a328-sto-gw.bahnhof.net/) (46.59.116.241) 2.981 ms 3.082 ms 2.392 ms
        5 [netnod-a.stk.retn.net](http://netnod-a.stk.retn.net/) (194.68.123.157) 2.864 ms 5.446 ms 3.014 ms
        6 [et0110-2.rt.ncl.cgn.de.retn.net](http://et0110-2.rt.ncl.cgn.de.retn.net/) (87.245.233.141) 34.910 ms 34.739 ms 35.161 ms
        7 [gw-netcologne.retn.net](http://gw-netcologne.retn.net/) (87.245.227.97) 27.222 ms 27.127 ms 26.050 ms
        8 [ip-core-sto2-ae3.netcologne.de](http://ip-core-sto2-ae3.netcologne.de/) (81.173.192.117) 32.187 ms 27.455 ms 28.121 ms
        9 [ip-core-eup1-et10-3-2.netcologne.de](http://ip-core-eup1-et10-3-2.netcologne.de/) (87.79.17.21) 28.939 ms 30.835 ms 29.682 ms
        10 [bdr-eup1-ae1.netcologne.de](http://bdr-eup1-ae1.netcologne.de/) (195.14.195.50) 29.338 ms 32.775 ms 51.049 ms
        11 78.35.33.106 (78.35.33.106) 50.981 ms 59.293 ms 57.149 ms
        12 212.66.129.151 (212.66.129.151) 36.049 ms 49.382 ms 34.957 ms
        13 [na-dns-p01.netaachen.com](http://na-dns-p01.netaachen.com/) (212.66.129.107) 33.567 ms 33.444 ms 33.996 ms

2. To Rio de Janeiro:

    traceroute to 200.196.57.42 (200.196.57.42), 64 hops max, 72 byte packets
    1 192.168.0.1 (192.168.0.1) 5.696 ms 2.382 ms 2.864 ms
    2 [h-155-4-58-1.na.cust.bahnhof.se](http://h-155-4-58-1.na.cust.bahnhof.se/) (155.4.58.1) 3.004 ms 2.628 ms 3.010 ms
    3 [h-109-228-167-222.na.cust.bahnhof.se](http://h-109-228-167-222.na.cust.bahnhof.se/) (109.228.167.222) 2.177 ms 4.222 ms 2.767 ms
    4 [quadracom-a328-sto-gw.bahnhof.net](http://quadracom-a328-sto-gw.bahnhof.net/) (46.59.116.241) 4.006 ms 3.251 ms 4.579 ms
    5 [10gigabitethernet1-2.core1.sto1.he.net](http://10gigabitethernet1-2.core1.sto1.he.net/) (194.68.123.187) 3.285 ms 12.586 ms 3.450 ms
    6 [100ge8-2.core1.ams1.he.net](http://100ge8-2.core1.ams1.he.net/) (184.105.65.125) 40.761 ms 26.436 ms 25.856 ms
    7 [100ge16-1.core1.lon2.he.net](http://100ge16-1.core1.lon2.he.net/) (72.52.92.213) 33.436 ms 32.520 ms 65.386 ms
    8 [100ge4-1.core1.nyc4.he.net](http://100ge4-1.core1.nyc4.he.net/) (72.52.92.166) 110.580 ms 98.853 ms 99.224 ms
    9 [ve951.core2.nyc6.he.net](http://ve951.core2.nyc6.he.net/) (184.105.64.178) 100.624 ms 111.223 ms 105.805 ms
    10 [cr1-tck1-us.globenet.net](http://cr1-tck1-us.globenet.net/) (206.82.104.44) 100.045 ms 105.032 ms 98.587 ms
    11 [globenet.ftlza.br.as52320.net](http://globenet.ftlza.br.as52320.net/) (200.16.69.3) 187.294 ms 211.655 ms 408.176 ms
    12 [globenet.rio.br.as52320.net](http://globenet.rio.br.as52320.net/) (200.16.69.45) 221.110 ms 302.949 ms 203.974 ms
    13 [globenet.sp2.br.as52320.net](http://globenet.sp2.br.as52320.net/) (200.16.68.84) 209.026 ms 207.164 ms 206.847 ms
    14 45.238.98.57 (45.238.98.57) 506.607 ms 295.703 ms 212.167 ms
    15 [mvx-t-0-2-0-cav-rd-rj.mundivox.com](http://mvx-t-0-2-0-cav-rd-rj.mundivox.com/) (187.16.126.94) 265.582 ms 295.542 ms 225.377 ms
    16 [mvx-t-0-2-0-cav-rd-rj.mundivox.com](http://mvx-t-0-2-0-cav-rd-rj.mundivox.com/) (187.16.126.94) 398.830 ms 298.234 ms 412.362 ms
    17 [mvx-189-91-74-72.mundivox.com](http://mvx-189-91-74-72.mundivox.com/) (189.91.74.72) 402.019 ms 515.319 ms 295.493 ms
    18 [mvx-200-196-57-42.mundivox.com](http://mvx-200-196-57-42.mundivox.com/) (200.196.57.42) 241.927 ms 309.171 ms 214.701 ms

3. To Spain

    traceroute to 195.76.198.10 (195.76.198.10), 64 hops max, 72 byte packets
    1 192.168.0.1 (192.168.0.1) 4.633 ms 4.148 ms 2.200 ms
    2 [h-155-4-58-1.na.cust.bahnhof.se](http://h-155-4-58-1.na.cust.bahnhof.se/) (155.4.58.1) 3.133 ms 8.962 ms 2.284 ms
    3 [h-109-228-167-222.na.cust.bahnhof.se](http://h-109-228-167-222.na.cust.bahnhof.se/) (109.228.167.222) 6.932 ms 2.912 ms 3.342 ms
    4 [quadracom-a328-sto-gw.bahnhof.net](http://quadracom-a328-sto-gw.bahnhof.net/) (46.59.116.241) 14.325 ms 3.971 ms 7.645 ms
    5 [sto-ste-er1.sto-cr1.bahnhof.net](http://sto-ste-er1.sto-cr1.bahnhof.net/) (46.59.112.42) 4.086 ms 2.749 ms 3.523 ms
    6 [ae51.edge4.stockholm2.level3.net](http://ae51.edge4.stockholm2.level3.net/) (213.249.107.93) 2.589 ms 3.348 ms 3.557 ms
    7 [ae-2-3204.edge7.amsterdam1.level3.net](http://ae-2-3204.edge7.amsterdam1.level3.net/) (4.69.162.181) 27.718 ms 27.909 ms 27.513 ms
    8 4.68.37.66 (4.68.37.66) 36.956 ms 37.511 ms 36.150 ms
    9 5.53.3.19 (5.53.3.19) 46.492 ms 40.181 ms 51.553 ms
    10 176.52.249.62 (176.52.249.62) 60.437 ms 62.511 ms 63.191 ms
    11 * [rima-ae0-400-grtmadad1.net.telefonicaglobalsolutions.com](http://rima-ae0-400-grtmadad1.net.telefonicaglobalsolutions.com/) (213.140.50.219) 59.909 ms 59.391 ms
    12 * * *
    13 [90.red-81-46-1.customer.static.ccgg.telefonica.net](http://90.red-81-46-1.customer.static.ccgg.telefonica.net/) (81.46.1.90) 66.947 ms 58.534 ms 59.948 ms
    14 [38.red-81-46-7.customer.static.ccgg.telefonica.net](http://38.red-81-46-7.customer.static.ccgg.telefonica.net/) (81.46.7.38) 58.776 ms 58.341 ms 63.898 ms
    15 [238.red-81-46-14.customer.static.ccgg.telefonica.net](http://238.red-81-46-14.customer.static.ccgg.telefonica.net/) (81.46.14.238) 58.157 ms 59.380 ms 58.573 ms
    16 [110.red-193-152-57.static.ccgg.telefonica.net](http://110.red-193-152-57.static.ccgg.telefonica.net/) (193.152.57.110) 66.051 ms 61.040 ms 69.580 ms
    17 195.76.198.10 (195.76.198.10) 62.096 ms 79.308 ms 74.504 ms

Describe: 

1. The number of devices on the route is larger for locally further resolver (# to Brazil > # to Germany)
2. The RRT of each device increases generally along the route, but not necessary. Some later devices in the route exhibit the shorter RRT than their previous ones.
3. There is one device on the route to Spain sent no reply. It is probably because the device does configured to send the 'the packet is dropped' message to the source when the packet's RRT is reached. However, the packet did continuous go to the next device on the route as we received the new reply from the device in the next hop.