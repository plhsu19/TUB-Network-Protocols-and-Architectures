# Assignment7: Network Layer

### Question1

1. In the topology, draw a circle around each sub-network (subnet), i.e., mark which devices,
interfaces, and links belong to the same subnet. Assume that the switches are Layer-2, so they
do not speak IP and they do not have IP addresses.
Hint: Remember that the boundary of the subnet is at the router, as routers connect different
subnets with each other.

    ![Assignment7%20Network%20Layer%20cca1e3ebc8c54845a7a09a2a978dc2b5/Screen_Shot_2021-01-12_at_11.06.50_AM.png](Assignment7%20Network%20Layer%20cca1e3ebc8c54845a7a09a2a978dc2b5/Screen_Shot_2021-01-12_at_11.06.50_AM.png)

2. Within each subnet, how many interfaces are there? How many IP addresses are needed
for each subnet, if each interface only gets one IP address?
Hint: The number of interfaces and the number of IP addresses needed are NOT equal to each
other.
    - How many interfaces are there in each subnet?

        subnet 1: 2 

        subnet 2: 256

        subnet 3: 2

        subnet 4: 2

        subnet 5: 2

        subnet 6: 5

    - How many IP addresses are needed for each subnet, if each interface only gets one IP address?
        - you always need 2 additional addresses, one for **broadcast** (all host part digits equal to 1)and one for the network (al host part digits equal 0)
        - For IPv4 case, where local network & NAT are adopted:
            - subnet 1: 2 internal IP addresses for local-use in the subnet. All internal IP addresses and ports are translated into one public external IP address corresponding to the R2 eth0, separated via different ports, by the NAT router R2.
            - subnet 2: 256 internal IP addresses for local-use in the subnet. All internal IP addresses and ports are translated into one public external IP address corresponding to the R2 eth0, separated via different ports, by the NAT router R2.
            - subnet 3: 2 internal IP addresses for local-use in the subnet. All internal IP addresses and ports are translated into one public external IP address corresponding to the R2 eth0, separated via different ports, by the NAT router R2.
            - subnet 4: 2 public IP addresses, which are routable in the internet.
            - subnet 5: same as subnet 4, 2 public IP addresses.
            - subnet 6: 5 internal IP addresses only for local-use in the subnet, which will be translated into one public external IP address corresponding to the R1 eth0 by the NAT router R1.
        - For IPv6 case
            - Each subnet has the same number of IPv6 addresses as the number of subnet's interfaces and all the IPv6 addresses are routable in the internet. The NAT and internal IP addresses for subnets are not necessary in this case because IPv6 does not suffer from address exhaustion.

    ### Q2

    ---

    a. 

    - Total 500 hosts + router interfaces: class C 2^16 addresses availabel

    b. Answer: b, c

    c. 

    (i) Linux Server: 136.78.1.1 - 136.78.1.50 
    (ii) Linux PCs: 136.78.2.1 - 136.78.2.50
    (iii) Windows PCs: 

    - A: 136.78.3.1 - 136.78.3.200
    - B: 136.78.4.1 - 136.78.4.200

    d. 

    - Linux server 50:
        - 2^6 > 50
        - 000000,  111111: saved for broadcast and the subnet. 63 - 2 = 61 available address
        - subnet: 192.168.0.64/26 (.01000000)
    - Linux pc 50:
        - subnet: 192.168.0.128/26 (.10000000)
    - Windows PCs A 200:
        - 2^8 > 200
        - 255 - 2 = 253 available addresses
        - \m: 32 - 8 = 24
        - 192.168.1.0/24 (.00000001.)
    - windows PC B 200:
        - 192.168.2.0/24 (.00000010.)

    e. NAT

    [Untitled](https://www.notion.so/824b35cc59644170ab12dbe24a5c28e4)

    f. destination IP, port: 133.178.23.14, port: 71 → 192.168.1.2, port: 2939

    g. source IP, port: 192.168.0.65, port 80 → 133.178.23.14, port: 80

    h.

    ![Assignment7%20Network%20Layer%20cca1e3ebc8c54845a7a09a2a978dc2b5/Screen_Shot_2021-03-01_at_11.19.10_AM.png](Assignment7%20Network%20Layer%20cca1e3ebc8c54845a7a09a2a978dc2b5/Screen_Shot_2021-03-01_at_11.19.10_AM.png)

    - [https://hpd.gasmi.net/](https://hpd.gasmi.net/)   (ethernet header decoder)
    - IPv4, TCP
    - 10.0.2.3 → 193.99.144.85 TCP 63626 → 80
    - The browser probably only browsed a website www.heise.de. with IPv4/TCP/HTTP from his/her windows computer, it is not a file sharing problem.
- nslookup (name server lookup) is a tool used to perform DNS lookups in Linux. It is used to display DNS details, such as the IP address of a particular computer, the MX records for a domain or the NS servers of a domain.

    reverse lookup for the **domain name**

    ```bash
    peilunhsu@Peis-MBP ~> nslookup 193.99.144.85
    Server:		192.168.0.1
    Address:	192.168.0.1#53

    Non-authoritative answer:
    85.144.99.193.in-addr.arpa	name = www.heise.de.

    Authoritative answers can be found from:
    ```