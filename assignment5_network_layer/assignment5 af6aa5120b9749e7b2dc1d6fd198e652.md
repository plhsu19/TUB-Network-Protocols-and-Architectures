# assignment5

### Q1

1. 4, because the TCP sends as many segments as it could within the window size. It sent 4 segments, so the window is 4 at the first transmission round.
2. time interval under slow start: 1 - 4, 11 - 14, 25 - 28. Because they all increase exponentially with the base of 2, i.e., 2^0, 2^1, 2^2, 2^3, ...
3. Congestion Avoidance: 5 - 10, 15-24. The window increases 1 segment per transmission round.
4. TDACK, because the TCP enter the fast recovery (window = 1/2 old threshold, congestion avoidance)  rather than the slow start from window = 1.
5. Timeout, because the TCP restart from the slow start with window = 1.
6. threshold = 32 at the 1st. transmission round. Because the TCP entering CA after reaching window = 32.
7. threshold = 17. Because when the TDACK occur at round 6, the old congestion window = 34. Therefore the threshold = 1/2 old congestion window after entering the fast recovery (CA).
8. threshold = 10. Because when the timeout occurs at round 10, the congestion window = 20, the new threshold should = 1/2 old congestion window after entering the slow start.
9. at 4th round: 4+8+16+4
    1. 4
    2. 8
    3. 16
    4. 32
10. congestion window = threshold = 4

    If the TDACK happens, new threshold = 1/2 old congestion window, and new congestion window = new threshold

### Q2

1. Which bandwidth will be provided to this connection? What are the implications for the other connections between Router A and Router B? Explain your answers briefly.
    1. bandwidth = 10 Mbit/s: Because the bottleneck will be the link 5, where the connection between host A and B has to share a total of 30 Mbit/s with other 2 connections ⇒ 30/3 = 10 Mbit. (as long as all connections do not have other bottleneck link)
    2. BW of other 2 connections between router A and router B: 100 Mbit/s for each connection.

        Because the connection of A and B only uses 10 Mbit/s, so the other 2 connections can share the remaining 200 Mbit/s, as long as they are not limited by other bottleneck link.

2. Assume that we have the capability to modifiy the total capacity on Link 5. For the rest, all stays as before. How much bandwidth needs to be available on Link 5, so that the blue highlighted connection can obtain the highest possible bandwidth? Briefly show how you calculated the bandwidth required on Link 5. Why would an additional expansion of capacity on Link 5 not yield in a higher throughput? Explain briefly.
    1. 100 Mbit/s

        In order to acquire the highest possible bandwidth by only changing the capacity on link 5, the link 5 cannot be the bottleneck, or at least have the same BW as the bottleneck link. The current bottleneck except link5 are link 1 and link 2, which each connection can have 70 Mbit/s if shares the capacity fairly. Therefore, the connection needs at least 70 Mbit/s on the link 5.  The maximal total bandwidth of another 2 connections can only be 30 Mbit/s because their bandwidths are limited by the bottleneck link4 with capacity = 30 Mbit/s. The minimal capacity necessary is 100 Mbit/s.

    2. Because the bottleneck will be on the link1 and link2 if link5's capacity ≥ 100 Mbit/s, which is 70 Mbit/s for the high lighted connection, further increments of capacity in link5 will not yeild a higher throughput.
3. What are the consequences of Link 5’s expansion for the connections on Link 1? Specify the changes in bandwidths on Link 1 for each connection and explain your answer briefly.
    - Changes in BW on L1 for each connection:
        1. connection btw host A and host B: 10 Mbit/s → 70 Mbit/s
        2. For other 2 connections: 100 Mbit/s → 70 Mbit/s

### Q3

1. Briefly describe the following special IP address types and their purpose (1-2 sentences):
    1. loop-back: The packet send to this IP does not leave device. This IP type is used to run a network service on a host without requiring a physical network interface. Any traffic that a computer program sends on the loopback network is addressed to the same computer.
    2. multicast: multicast address represents a group of IP devices, i.e., a host group, in a computer network that are available to receive and process packets packets intended to be multicast for a specific (network) service.
    3. link-local: link-local addresses are non-routable addresses which can be only used for communications within the network that the host is connected to. Link-local addresses are not guaranteed to be unique beyond their network segment, therefore routers do not forward packets with link-local source or destination addresses.
2. Display all IP addresses (IPv4 and IPv6) that your computer currently has on all its interfaces on the command line. Include both the command that you used and the output of the command in your solution.
    - `ifconfig` is a system administration utility in Unix-like operating systems for network interface configuration.
    - Network Interface: A network interface is the point of interconnection between a computer and a private or public network. A network interface is generally a network interface card (NIC), but does not have to have a physical form. Instead, the network interface can be implemented in software. For example, the loopback interface (127.0.0.1 for IPv4 and ::1 for IPv6) is not a physical device but a piece of software simulating a network interface. The loopback interface is commonly used in test environments.
        - wiki: a network interface is a **software** or **hardware** interface between two pieces of equipment or protocol layers in a computer network.
    - physical network interface: a computer **hardware** component that **connects a computer to a computer network.**

    ```bash
    peilunhsu@Peis-MBP ~/D/P/T/C/2/I/T/assignment5_network_layer (main)> ifconfig
    lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384
    	options=1203<RXCSUM,TXCSUM,TXSTATUS,SW_TIMESTAMP>
    	inet 127.0.0.1 netmask 0xff000000
    	inet6 ::1 prefixlen 128
    	inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1
    	nd6 options=201<PERFORMNUD,DAD>
    gif0: flags=8010<POINTOPOINT,MULTICAST> mtu 1280
    stf0: flags=0<> mtu 1280
    en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
    	options=400<CHANNEL_IO>
    	ether 88:e9:fe:7f:9c:fe
    	inet6 fe80::44:8b27:f2b7:4051%en0 prefixlen 64 secured scopeid 0x4
    	inet 192.168.0.8 netmask 0xffffff00 broadcast 192.168.0.255
    	nd6 options=201<PERFORMNUD,DAD>
    	media: autoselect
    	status: active
    en1: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500
    	options=460<TSO4,TSO6,CHANNEL_IO>
    	ether 82:34:26:83:b8:01
    	media: autoselect <full-duplex>
    	status: inactive
    en2: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500
    	options=460<TSO4,TSO6,CHANNEL_IO>
    	ether 82:34:26:83:b8:00
    	media: autoselect <full-duplex>
    	status: inactive
    bridge0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
    	options=63<RXCSUM,TXCSUM,TSO4,TSO6>
    	ether 82:34:26:83:b8:01
    	Configuration:
    		id 0:0:0:0:0:0 priority 0 hellotime 0 fwddelay 0
    		maxage 0 holdcnt 0 proto stp maxaddr 100 timeout 1200
    		root id 0:0:0:0:0:0 priority 0 ifcost 0 port 0
    		ipfilter disabled flags 0x0
    	member: en1 flags=3<LEARNING,DISCOVER>
    	        ifmaxaddr 0 port 5 priority 0 path cost 0
    	member: en2 flags=3<LEARNING,DISCOVER>
    	        ifmaxaddr 0 port 6 priority 0 path cost 0
    	nd6 options=201<PERFORMNUD,DAD>
    	media: <unknown type>
    	status: inactive
    p2p0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 2304
    	options=400<CHANNEL_IO>
    	ether 0a:e9:fe:7f:9c:fe
    	media: autoselect
    	status: inactive
    awdl0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1484
    	options=400<CHANNEL_IO>
    	ether 5e:08:9b:76:fd:95
    	inet6 fe80::5c08:9bff:fe76:fd95%awdl0 prefixlen 64 scopeid 0x9
    	nd6 options=201<PERFORMNUD,DAD>
    	media: autoselect
    	status: active
    llw0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
    	options=400<CHANNEL_IO>
    	ether 5e:08:9b:76:fd:95
    	inet6 fe80::5c08:9bff:fe76:fd95%llw0 prefixlen 64 scopeid 0xa
    	nd6 options=201<PERFORMNUD,DAD>
    	media: autoselect
    	status: active
    utun0: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380
    	inet6 fe80::1bf4:554f:14b7:7682%utun0 prefixlen 64 scopeid 0xb
    	nd6 options=201<PERFORMNUD,DAD>
    utun1: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 2000
    	inet6 fe80::3c0f:5092:dba:a662%utun1 prefixlen 64 scopeid 0xc
    	nd6 options=201<PERFORMNUD,DAD>
    utun2: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380
    	inet6 fe80::4386:49f5:9568:1021%utun2 prefixlen 64 scopeid 0xd
    	nd6 options=201<PERFORMNUD,DAD>
    utun3: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380
    	inet6 fe80::8b64:6f2a:1fe:9608%utun3 prefixlen 64 scopeid 0xe
    	nd6 options=201<PERFORMNUD,DAD>
    utun4: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380
    	inet6 fe80::8170:afa1:7e81:b171%utun4 prefixlen 64 scopeid 0xf
    	nd6 options=201<PERFORMNUD,DAD>
    utun5: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380
    	inet6 fe80::36d:698c:e3be:bbad%utun5 prefixlen 64 scopeid 0x10
    	nd6 options=201<PERFORMNUD,DAD>
    ```

3. For each address, answer the following questions: (i) Is this an IPv4 or an IPv6 address?
(ii) Is this a **loopback**, a **link-local**, a **multicast**, a **private/local unicast**, or a **global unicast IP**
address? (iii) What **subnet size** is being used?
    - network mask: A Netmask is a 32-bit "mask" used to divide an IP address into subnets and specify the network's available hosts. In a netmask, two bits are always automatically assigned. For example, in 255.255.225.0, "0" is the assigned network address. In 255.255.255.255, "255" is the assigned broadcast address. The 0 and 255 are always assigned and cannot be used.
    - prefix(ipv6): The leftmost fields of the IPv6 address along with the network bits length represented in CIDR format is known as the network prefix. The prefixes in IPv6 can be considered similar to the subnet mask used in IPv4 addresses. In IPv6, we use a notation similar to CIDR mask (using an integer between 1-128 to represent the network bits) representation in IPv4.
    - ip

        ipv4 or ipv6, ip type, subnet mask/prefix length, usable ip # in the subnets

    - 127.0.0.1

         ipv4, loopback, /8 (0xff000000), 16,777,214

    - ::1

        ipv6, loopback, /128, 1

    - fe80::1

        ipv6, link-local unicast, /64, 18,446,744,073,709,551,616

    - fe80::44:8b27:f2b7:4051

        ipv6, link-local unicast, /64, 18,446,744,073,709,551,616

    - 192.168.0.8

        ipv4, Private Ranges (RFC1918), /24, 254

    - **ipv6, link-local unicast, /64, 18,446,744,073,709,551,616:**
        - fe80::5c08:9bff:fe76:fd95
        - fe80::1bf4:554f:14b7:7682
        - fe80::3c0f:5092:dba:a662
        - fe80::4386:49f5:9568:1021
        - fe80::8b64:6f2a:1fe:9608
        - fe80::8170:afa1:7e81:b171
        - fe80::36d:698c:e3be:bbad
4. Because my WIFI interface (en0) has only link-local IPv6 address but no global unicast (2000::/3 addresses), ~~I assume my network does not support IPv6 (or my router did not turn on the  IPv6 setting).~~ However, if my ISP supports the IPv6, I should reach both hosts on the internet and within my subnet via the IPv6 address that my ISP assign to me.
    - My local network (subnet) probably supports IPv6, since my network interface is assigned a link-local IPv6 address. However, I do not have a global unicast IPv6 address, so I assume the network that my subnet connects to, i.e., my ISP, does not support the IPv6.
    - I cannot reach the host on the global internet supporting IPv6.
    - I could reach the host supporting IPv6 within my subnet using my link-local IPv6 address.

### Interfaces

---

`lo0` is loopback, known as local host with address 127.0.0.1

`en0` at one point "ethernet", now is WiFi.

(en0...X refer to your physical network interfaces. Most new Mac devices will just have en0 - your WiFi. en0 is the first device to start, en1 the second, etc.)

`fw0` is the FireWire network interface.

`stf0` is an [IPv6 to IPv4 tunnel interface](https://www.freebsd.org/cgi/man.cgi?gif(4)) to support [the transition](http://en.wikipedia.org/wiki/6to4) from IPv4 to the IPv6 standard.

`gif0` is a more [generic tunneling interface](https://www.freebsd.org/cgi/man.cgi?gif(4)) [46]-to-[46].

`awdl0` is [Apple Wireless Direct Link](https://stackoverflow.com/questions/19587701/what-is-awdl-apple-wireless-direct-link-and-how-does-it-work)

`p2p0` is related to AWDL features. Either as an old version, or virtual interface with different semantics than `awdl`.