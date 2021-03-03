# assignment10_recap web page loading

### Q1

---

![assignment10_recap%20web%20page%20loading%20351dba9307de4c0bad7c63625870a7d0/Screen_Shot_2021-03-03_at_4.15.12_PM.png](assignment10_recap%20web%20page%20loading%20351dba9307de4c0bad7c63625870a7d0/Screen_Shot_2021-03-03_at_4.15.12_PM.png)

As shown in the figure, AIAD would not converge toward the equal bandwidth share line and thus is not an equal share algorithm. When the combination of current throughputs is below the bandwidth, ie, A, both TCP connections increase the congestion window by the same amount. Until the total throughput larger than the bandwidth, the packets start to be dropped by the network (B), and both TCP decrease their congestion windows with the same amount. The throughput condition will go back to the original condition below the bandwidth (C). We can see that the throughput will oscillate along a 45 degree line parallel to the equal share line, and will never converge to the equal share line. The share of bandwidth that participants get in the same time will never change. 

### Q2

Discuss what the Internet would look like if every flow were based on UDP and would not use
congestion control.

Every end-host will send as many packets as it can to the internet, and the internet will often suffer from packet delay and packet lost caused by the congestion.

- **Congestion:**

    No congestion control with UDP → the UDP packets will quickly take up all available bandwidth and overwhelm the internet, causing huge packet delay and dropped packets.

- Fairness:

    Moreover, since UDP will use as much bandwidth as it can at any given moment, some participants would get all the bandwidth while others get almost none. → unfairness

    Some participates will not get any bandwidth, e.g., their packets will be dropped, even if the network is not congested most of the time.

    The number of participants who can use the network at the same time would decrease.

### Q3 Have a look at the figure below and explain why it can cause problems having switches S2 and S3 connected to both switches S1 and S4 and what can be done to prevent this.

---

![assignment10_recap%20web%20page%20loading%20351dba9307de4c0bad7c63625870a7d0/Screen_Shot_2021-03-03_at_4.29.37_PM.png](assignment10_recap%20web%20page%20loading%20351dba9307de4c0bad7c63625870a7d0/Screen_Shot_2021-03-03_at_4.29.37_PM.png)

Connecting switch with multiple switches, eg, S3 is connected to 2 switches S1 and S4, might cause the broadcast packets to circulate in the loop network forever, e.g., S3→S1→S2→S4→S1. Moreover, the broadcast packets could be multiplied at the node with multiple switch connections, e.g., S3, and overwhelm the network with these endless broadcast transmitted in the network, i.e., the broadcast storm.

- each switch interface is sending each of the broadcast messages to each of the outgoing interfaces→ broadcast storm.

Solution: Use spanning tree protocol to decide the routes for broadcasting, which will remove all circle in the broadcast topology and thus will not cause the broadcast storm. (via disabling one/multiple link in the switched while broadcasting) 

### Q4

1.  2 host names ([www.some-provider.org](http://www.some-provider.org/) and [images.some-provider.org](http://images.some-provider.org/)) have to be resolved. The user's browser need to resolve IPv4 address and IPv6 address for each host name, therefore totally 4 DNS queries needed to be make by the user's computer to the resolver (9.9.9.9).

     DNS records queried for each server's host name:

    - Name: host name of the server
    - Type: "A" for host's IPv4 addresses, "AAAA" for IPv6 addresses.

    The resolver will answer the following records as well as the Name and Type:

    - Value: IPv4 or IPv6 addresses corresponding to the host name in the query, e.g., 193.99.144.85.
    - TTL(Time to Live): the remaining time that the record can be cached.
2. minimum 2 TCP connections needed. 
    - one for loading the base page and the css file from www.some-provider.org
        1. same TCP connection will keep open and can be used to download multiple files because HTTP keep-alive header.
    - one for loading the image "banner.png" from the image server.
3. DNS query

    ![assignment10_recap%20web%20page%20loading%20351dba9307de4c0bad7c63625870a7d0/Screen_Shot_2021-02-02_at_7.42.35_PM.png](assignment10_recap%20web%20page%20loading%20351dba9307de4c0bad7c63625870a7d0/Screen_Shot_2021-02-02_at_7.42.35_PM.png)

4. TCP handshake

    ![assignment10_recap%20web%20page%20loading%20351dba9307de4c0bad7c63625870a7d0/Screen_Shot_2021-02-02_at_8.33.15_PM.png](assignment10_recap%20web%20page%20loading%20351dba9307de4c0bad7c63625870a7d0/Screen_Shot_2021-02-02_at_8.33.15_PM.png)

5. Loading the base page
    - Bytes have to be sent from the user's computer to the server:

        HTTP GET request ⇒ 200 Bytes

    - Bytes have to be sent from the user's computer to the server:

        base page ⇒ 5KB

        HTTP 200 response header ⇒ 500 Bytes

        Total: 5000 + 500 = 5500 Bytes

    - Packet trace:

        ![assignment10_recap%20web%20page%20loading%20351dba9307de4c0bad7c63625870a7d0/Screen_Shot_2021-03-03_at_5.57.06_PM.png](assignment10_recap%20web%20page%20loading%20351dba9307de4c0bad7c63625870a7d0/Screen_Shot_2021-03-03_at_5.57.06_PM.png)

Note: The maximum segment size (MSS) is a parameter of the options field of the TCP header that specifies the largest amount of data, specified in bytes, that a computer or communications device can receive in a single TCP segment. It does not count the TCP header or the IP header