# Assignment 9 Link Layer

### Question1

---

a. In the topology from Figure 1, assign MAC addresses to all layer 2 interfaces1. For simplicity, it is sufficient to provide the last 8 bits of the MAC address, i. e., two characters in HEX notation (e. g., AB) as long as they are unique. You do not have to assign MAC addresses to the “255 other hosts”.

![Assignment%209%20Link%20Layer%20293974e1d449429d8a47ec97f3186fba/Screen_Shot_2021-03-02_at_4.21.26_PM.png](Assignment%209%20Link%20Layer%20293974e1d449429d8a47ec97f3186fba/Screen_Shot_2021-03-02_at_4.21.26_PM.png)

b. In the topology, clearly mark any broadcast and collision domain. How do these domains change when switch S2 is replaced by a hub?

![Assignment%209%20Link%20Layer%20293974e1d449429d8a47ec97f3186fba/Screen_Shot_2021-03-02_at_4.43.44_PM.png](Assignment%209%20Link%20Layer%20293974e1d449429d8a47ec97f3186fba/Screen_Shot_2021-03-02_at_4.43.44_PM.png)

- 255 other hosts: each host-switch port pair is a collision domain.

c. Which parts of the Ethernet, IP and TCP header will be modified when a packet is
forwarded by:
i) router R1: 

- Ethernet: source/destination MAC addresses will be changed to the pair for next hop, e.g., S1 port1 (AC)/R1 eth1(AB) to R1 eth0(AA)/R4 eth0(A9)
- IP: source or destination IP address, converted from private host address to the public address in case of NAT.
- TCP: change port number from the original one on host to a port number assigned by the R1 for representing the private IP address and port combination.

ii) switch S1

- Switch does not modify any headers because It creates **a single broadcast domain** for the hosts connected to it.

d. ARP broadcast and response

[Untitled](https://www.notion.so/23775fc5d5cf48ba99852ff4ef3964c1)

e. packet from the server to the client

[Untitled](https://www.notion.so/2907200168ad4c7daaad4595c1c0f719)

### Question2 Neighbor discovery in IPv6

---

1. First, explain all packets in the trace, except for the packets belonging to the TCP connection, with one or two short sentences each. Second, give a short summary about the purpose of the TCP connections. Hint: You can give names to the communicating devices.
    1. Packet1: machine A sends a ICMP neighbor solicitation to machine B's multicast address, which is ff02::1:ff + last 24-bit of machine B's address.
    2. Packet2: machine B sends a ICMP neighbor advertisement with its MAC address as the response.
    3. Packet163: machine B sends a ICMP neighbor solicitation to machine A using machine A's IP and MAC as source addresses for refresh its information (IP + MAC) in A's neighbor table.
    4. Packet 164: machine A sends a ICMP neighbor advertisement back to machine B. In the same time, A refreshes its MAC and IP addresses in B's neighbor table.
    - TCP packets are used to build a connection between the machineA (client) and machine B(server). Client then sent a HTTP GET request for a .jpg file from the server. Server transfers the file to the client. The client then terminates the TCP connection with the server.
2. 2 neighbor discoveries in the trace:
    1. packet no. 1, time: 0.000000	
    2. packet 163, time 5.236116
3. Only 2 hosts are involved in this scenario: A and B
    - A discover B's MAC address by multicast a neighbor solicitation to the B's multicasting group. In the meantime, A also advertises its own MAC address corresponding to its IP address in the ICMP message.
    - B receives A's ICMP solicitation, records A's IP and MAC addresses as an entry in its neighbor table(cache). B then advertises its MAC address to A via a ICMP message using A's IPv6 unicast address.
    - A receives B's advertisement and records B's MAC with B's IP in A's neighbor table

    → 2 ICMP packets are sufficient to populate IPv6's neighbor cache.

4. Comparing Neighbor Discovery in IPv6 and ARP in IPv4, at which layer(s) of the network stack do they operate? Hint: You can probably take a quick look at some ARP packets on your local network just by opening Wireshark and starting a capture.
    1. IPv6's neighbor discovery runs on ICMP. Although ICMP runs on IP, it is an 'network layer' protocol used to transfer operation messages between routers and hosts (layer 3).
    2. IPv4's neighbor discovery runs on ARP. Although ARP has its own Ether type in the ethernet frame's header, it is a link layer protocol (layer2).