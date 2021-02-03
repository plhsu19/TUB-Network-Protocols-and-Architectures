# assignment10_recap web page loading

### Q4

1.  2 host names ([www.some-provider.org](http://www.some-provider.org/) and [images.some-provider.org](http://images.some-provider.org/)) have to be resolved. The user's browser need to resolve IPv4 address and IPv6 address for each host name, therefore totally 4 DNS queries needed to be make by the user's computer to the resolver (9.9.9.9).

     DNS records queried for each server's host name:

    - Name: host name of the server
    - Type: "A" for host's IPv4 addresses, "AAAA" for IPv6 addresses.

    The resolver will answer the following records as well as the Name and Type:

    - Value: IPv4 or IPv6 addresses corresponding to the host name in the query, e.g., 193.99.144.85.
    - TTL(Time to Live): the remaining time that the record can be cached.
2. minimum 2 TCP connections needed. 

    one for loading the base page and the css file from www.some-provider.org

    one for loading the image "banner.png" from the image server.

3. DNS query

    ![assignment10_recap%20web%20page%20loading%201333296af6e74b358d4943612c967b0c/Screen_Shot_2021-02-02_at_7.42.35_PM.png](assignment10_recap%20web%20page%20loading%201333296af6e74b358d4943612c967b0c/Screen_Shot_2021-02-02_at_7.42.35_PM.png)

4. TCP handshake

    ![assignment10_recap%20web%20page%20loading%201333296af6e74b358d4943612c967b0c/Screen_Shot_2021-02-02_at_8.33.15_PM.png](assignment10_recap%20web%20page%20loading%201333296af6e74b358d4943612c967b0c/Screen_Shot_2021-02-02_at_8.33.15_PM.png)

5. Loading the base page
    - Bytes have to be sent from the user's computer to the server:

        HTTP GET request ⇒ 200 Bytes

    - Bytes have to be sent from the user's computer to the server:

        base page ⇒ 5KB

        HTTP 200 response header ⇒ 500 Bytes

        Total: 1024 * 5 + 500 = 5620 Bytes

    - Packet trace:

        ![assignment10_recap%20web%20page%20loading%201333296af6e74b358d4943612c967b0c/Screen_Shot_2021-02-03_at_12.24.47_PM.png](assignment10_recap%20web%20page%20loading%201333296af6e74b358d4943612c967b0c/Screen_Shot_2021-02-03_at_12.24.47_PM.png)