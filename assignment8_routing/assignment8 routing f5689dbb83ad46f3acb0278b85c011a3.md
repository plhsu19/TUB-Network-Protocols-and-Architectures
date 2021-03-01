# assignment8 routing

### Q1

---

1. Explain the terms Interior Gateway Protocol (IGP) and Exterior Gateway Protocol (EGP) and
distinguish them in terms of their purpose.
    1. IGP: the protocol used within an autonomous system for routing.
        - find cost effect route between routers within AS.
        - different ASes can use different IGPs.
    2. EGP: the protocol used between autonomous systems for routing
        1. management of inter-network connectivity
        2. consider business relations → the calculated route is not always cost effect, but selected due to the agreement between peering ASes.
2. Explain the routing mechanisms Link State and Distance Vector by describing the underlying
principles and how these principles work.
    1. Link-State: 
        - Global planning algorithm: every node in the network knows the entire network topology and link costs.
        - Use Dijkstra's shortest path algorithm.
        - Each node calculates a comprehensive routes to all nodes in the network from itself.
        - Link states are periodically exchanged between routers.
    2. Distance Vector: 
        - Distributed algorithm: each node only knows the information about its direct links, i.e., link costs, to the neighbors. → fully distributed knowledge.
        - Bellman-Ford algorithm.
        - Each node only calculates the shortest distances to the nodes in the network as well as the start interface, i.e., one of its neighbor, of the route based on the information it has.
        - The node advertisement its calculated distance table to all other nodes.
3. Classify the routing protocols RIP, BGP, OSPF, IGRP, and ISIS in terms of their protocol family from (a) and the applied mechanism from (b).
    - EGP + DV: BGP (path vector)
    - IGP
        - DV: RIP, IGRP
        - LS: OSPF, ISIS,

### Q2 Intra- vs. Inter-AS routing: concepts

---

1. Consider intra- and inter-AS routing. Where do policies play a role in selecting between different
possible routes, and where not? Justify briefly.
    - The inter-AS routing needs policy because network admin wants control over how its traffic routed and who routes through its network. → business relations determines the routes.
    - ~~Intra-AS routing does not need policy decisions because there is only one admin in the subnet.~~
    - Intra-AS routing decided the route based efficiency, e.g., the length of the route, but not based on the business relations. Thus they don't need the policy. The efficiency is the only metric that  matters in the intra-AS routing.
2. Intra-AS routes are optimized towards little delay (delay as cost). In your opinion, is it a good idea to use **congestion** at the interface as a metric to achieve that goal? Briefly justify your answer.
    - No, it's not a good idea. If we use congestion as the metric, the router will choose the link with minimum congestion to its neighbors as the next hop, and this next hop, i.e., the neighboring node, may choose the same link, which also has the minimum congestion among its links, as its next hop. This will result in a routing loop, where the packet is stuck and will never reach the destination. → the congestion often changes, and then the routes would changes very fast, which may leads to oscillation, ie, the looped routes. (especially for DV algorithm, which converges slowly)
3. How does BGP – as a member of the path-vector protocol family – attempt to bypass the
problem of routing loops?
    - BGP use an attribute called **AS-path** to prevent any looped route. The AS-path records the autonomous systems (AS number) on the route to a prefix destination when the route is advertised to an autonomous system by its neighboring autonomous system. If the autonomous system receiving the advertisement finds its own AS number is on the AS-path, it will drop this advertisement, i.e., the route to the advertised prefix, in order to prevent the routing loop. (same AS-number appears on a route means there is a loop in the route)
4. The de-facto standard for inter-AS routing is BGP. Why is it difficult to introduce alternatives to BGP or switch completely to a different protocol that is incompatible with BGP?
    - There are several reasons why it is difficult to switch to a different protocol for inter-AS routing. The most important reason is BGP's ubiquity. Unlike intra-AS routing, whose change of protocol will only affect the routing within an autonomous system, the change of EGP will affect the entire internet. Consider that the BGP is already implemented in over 20000 autonomous systems in the internet, it is really difficult to switch to a new protocol in all autonomous systems at the same time or only change protocols in some autonomous systems without impacting the entire internet. Therefore, no other protocol for intra-AS routing is used in the internet except the BGP.

### Q3

---

1. A - Q1 - Q2 - Q3 - B, cost = 12
2. In the moment immediately after the weight change, we assume that the information of change has not yet been advertised to all the nodes but stays in Q2 and Q3's routing tables. Because node A's routing table has not yet updated to the new cost-optimal route from A to B through P1 and P2, the current cost-optimal route, at least in A's point of view, is still A - Q1 - Q2 - Q3 - B with the actual cost of 17.

    After the routing tables have converged, the packet from A to B will take the new cost-optimal route of A-Q1-P1-P2-Q3-B with the minimum cost of 15.

    ![assignment8%20routing%20f5689dbb83ad46f3acb0278b85c011a3/Screen_Shot_2021-03-01_at_9.18.18_PM.png](assignment8%20routing%20f5689dbb83ad46f3acb0278b85c011a3/Screen_Shot_2021-03-01_at_9.18.18_PM.png)

3. The edge weight between Q2 and Q3 is still 8. Which path will a packet from A to B take? Explain why. What is the cost?
    - The principle of BGP routing policy is only to forward the traffic whose source or the destination is one of AS provider's customers. Otherwise the AS will not earn money.
    - P1 will not advertises the route P1-P2-Q3-B to Q1 because neither the source or the destination of this route is AS P's customer. P will not earn money by forwarding this traffic.
    - Path A-Q1-Q2-Q3-B, cost: 17
4. Supposing that the link between Q2 and Q3 fails, how can packets be routed from A to B in this case? Explain why.
    - Q needs to route across P to connect to B, that is its only route.
    - In this case, Q needs to be the customer of P (not peering agreement), and pay P to route its packets.

### Q4 Dijkstra

---

![assignment8%20routing%20f5689dbb83ad46f3acb0278b85c011a3/Screen_Shot_2021-03-01_at_9.56.22_PM.png](assignment8%20routing%20f5689dbb83ad46f3acb0278b85c011a3/Screen_Shot_2021-03-01_at_9.56.22_PM.png)

[Untitled](https://www.notion.so/3144e75325ff441896a4f1e23e64c2d3)