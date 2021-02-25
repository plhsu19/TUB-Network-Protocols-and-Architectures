# assignment 4

### Assignment4 Advanced Transport Layer

---

**Introduction to Wireshark**

1. Color Coding
    - light purple is TCP traffic
    - light blue is UDP traffic
    - black identifies packets with errors—for example, they could have been delivered out of order.
2. Sample Capture
    - Save your own **captures** in Wireshark and open them later. Click File > Save to save your captured packets.
    - 

**Question1**

1. L = 40 bytes

    RTT = 60 ms

    R = 32 Kibit/s = 32*2^7 Byte/1000ms = 2^12/1000 B/ms = 4.096 B/ms

    PD = 30ms - 40/4.096 = 20.23 ms

    Answer: ~20ms

2. OptW = (Lwp/R + 2PD + Lnp/R) * R

**Question2**

1. Benefit of parallel TCP connections for the server
    1. The serve can transfer more data over time in total
        - The data transfer will be the sum of all window sizes of the connections
        - if one connection experiences packet loss and decreases its window size, the other connections will not be affected
    2. Disadvantage of parallel TCP connections for the server
        - Opening connections creates overheads
            - The server has to keep states of the connections
            - The server has to keep the connection open
        - Keeping many states might not be suitable for server that handles many clients
    3. Fairness of parallel TCP connections to other hosts (server-client) share the same networks
        - TCP shares resources fairly
        - the available bandwidth is divided by the TCP connections that using it. Each connection has the same proportion of the BW.
        - If a server-client pair has many parallel TCP connections, it will use more bandwidth than other server-client pair.
        - The bandwidth allocation is not fair to other hosts using the same network.

**Question3**

a)

1. *How many packets do you get in total?*

    116 packets

2. *How many of them contain TCP?*

    100 packets contain TCP.

    - display filter: `tcp`
3. *How many of them contain HTTP/1.1?*

    10 packets contain HTTP/1.1

    - display filter: `http`

*b) set a display filter to show **only packets** that correspond to **a single TCP connection** of your web page request and response.*

- display filter:

    `tcp.stream == 3`

    `tcp.stream == 4`

- Explain:

    I used `tcp.stream == n` filter to follow all conversations within a single TCP connection/stream in the capture trace. `n` indicates that I want to show the **nth** TCP connection/stream the Wireshark found in the capture trace. In this case, I noticed that my browser started two TCP connections with the server ([researchvm.inet.tu-berlin.de](http://researchvm.inet.tu-berlin.de/)) for sending the requests and responses of the web-page. For example, one TCP connection loaded the **html** file and **two cat images** while another TCP connection loaded other **two cat images** to load the webpage containing total four images. Therefore, I use two display filters (3 and 4) to select two TCP connections that contain the request and response packets for the web-page separately.

c) 

```bash
tcp.stream == 3
http.request == 1
http.response == 1
tcp.stream == 3 and (frame.time_relative > 5)
```

I only show the screen-shot of one TCP connection that loaded the html and two image files of the web-page as an example because another TCP connection is very similar as this one.

1. packets belongs to the TCP connection setup (3-way handshake):

    ![assignment%204%20ea799ea83d8c4f4084e6ffa208bdb317/Screen_Shot_2020-12-08_at_4.57.08_PM.png](assignment%204%20ea799ea83d8c4f4084e6ffa208bdb317/Screen_Shot_2020-12-08_at_4.57.08_PM.png)

2. transmission of the HTTP request:

    ![assignment%204%20ea799ea83d8c4f4084e6ffa208bdb317/Screen_Shot_2020-12-08_at_4.57.53_PM.png](assignment%204%20ea799ea83d8c4f4084e6ffa208bdb317/Screen_Shot_2020-12-08_at_4.57.53_PM.png)

    - HTTP request for the web-page html and two cat images (.jpg).
3. the transmission of the HTTP response: 

    ![assignment%204%20ea799ea83d8c4f4084e6ffa208bdb317/Screen_Shot_2020-12-08_at_4.58.09_PM.png](assignment%204%20ea799ea83d8c4f4084e6ffa208bdb317/Screen_Shot_2020-12-08_at_4.58.09_PM.png)

    - responses with the html and JPEG files from the server corresponding to the requests from my browser.
4. the tear-down of the connection:

    ![assignment%204%20ea799ea83d8c4f4084e6ffa208bdb317/Screen_Shot_2020-12-08_at_11.59.50_PM.png](assignment%204%20ea799ea83d8c4f4084e6ffa208bdb317/Screen_Shot_2020-12-08_at_11.59.50_PM.png)

    - The sever closed the TCP connection actively by sending the FIN flag to the client after the **last ACK** corresponding to the **last http response** sent is received. However, the client browser only sent the ACK to the server's FIN but did not send a FIN back before the end of the capture, i.e., 10 sec. This means that the client was still in the "CLOSE_WAIT" state and wait for the application process to finish and close the connection by sending the FIN from the client side.

**Marked screenshot of Wireshark:**

![assignment%204%20ea799ea83d8c4f4084e6ffa208bdb317/Screen_Shot_2020-12-09_at_12.11.43_AM.png](assignment%204%20ea799ea83d8c4f4084e6ffa208bdb317/Screen_Shot_2020-12-09_at_12.11.43_AM.png)

d) Load [inet.tu-berlin.de](http://inet.tu-berlin.de/)

![assignment%204%20ea799ea83d8c4f4084e6ffa208bdb317/Screen_Shot_2021-02-25_at_1.16.52_PM.png](assignment%204%20ea799ea83d8c4f4084e6ffa208bdb317/Screen_Shot_2021-02-25_at_1.16.52_PM.png)

1. Set a display filter for DNS, and find the queries for [inet.tu-berlin.de](http://inet.tu-berlin.de/). What records does
the browser ask for, and what replies does it get?

    The browser send a DNS query to the resolver (my apartment's router in my case) for host name: inet.tu-berlin.de, type A (IPv4), and class IN

    (Class referring to the DNS class. 'IN' refers to 'Internet' while the only other option in common use is 'CH' for 'CHAOS'. The CH class is (presently) commonly used for things like querying DNS server versions, while the IN class is the default and generally what "the internet" uses.)

    ![assignment%204%20ea799ea83d8c4f4084e6ffa208bdb317/Screen_Shot_2021-02-25_at_1.24.53_PM.png](assignment%204%20ea799ea83d8c4f4084e6ffa208bdb317/Screen_Shot_2021-02-25_at_1.24.53_PM.png)

    The DNS resolver returns the answer of the query with the IPv4 address (type A) corresponding to the host name: [inet.tu-berlin.de](http://inet.tu-berlin.de), as well as other information, e.g., TTL and class.

2. What TCP connections do you see? What can you see in them, and what can you not see?
Why?

    TCP connections I can see after the DNS query:

    1. 3-way handshake to build the connection initiated by the browser
    2. browser sends http GET request for the html file sent by the browser
    3. The server returns the status code "302 found" indicates that the resource requested has been temporarily moved to the URL in HTTPS given by the Location header: [https://inet.tu-berlin.de/](https://inet.tu-berlin.de/)
    4. The browser open a new TCP connection to communicate with the server over TLS (port 443) and load the page. All the  application layer data payload in the TLS packets cannot be seen as they are encrypted.
    5. The browser also send a new DNS query for another TUB hostname ([www.inet.tu-berlin.de](http://www.inet.tu-berlin.de/)), probably where some resources in the page are located. It then open several TCP connections with the new server over TLS.
    6. The server of  [inet.tu-berlin.de](http://inet.tu-berlin.de) terminates the TCP connection with the browser via FIN status. The browser send FIN,ACK back and the connection is terminated.