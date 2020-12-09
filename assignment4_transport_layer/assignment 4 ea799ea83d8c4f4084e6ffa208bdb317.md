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