# display all IP addresses (IPv4 and IPv6) that your computer currently has on all its interfaces
ifconfig

# script log
# lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384
# 	options=1203<RXCSUM,TXCSUM,TXSTATUS,SW_TIMESTAMP>
# 	inet 127.0.0.1 netmask 0xff000000
# 	inet6 ::1 prefixlen 128
# 	inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1
# 	nd6 options=201<PERFORMNUD,DAD>
# gif0: flags=8010<POINTOPOINT,MULTICAST> mtu 1280
# stf0: flags=0<> mtu 1280
# en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
# 	options=400<CHANNEL_IO>
# 	ether 88:e9:fe:7f:9c:fe
# 	inet6 fe80::44:8b27:f2b7:4051%en0 prefixlen 64 secured scopeid 0x4
# 	inet 192.168.0.8 netmask 0xffffff00 broadcast 192.168.0.255
# 	nd6 options=201<PERFORMNUD,DAD>
# 	media: autoselect
# 	status: active
# en1: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500
# 	options=460<TSO4,TSO6,CHANNEL_IO>
# 	ether 82:34:26:83:b8:01
# 	media: autoselect <full-duplex>
# 	status: inactive
# en2: flags=8963<UP,BROADCAST,SMART,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1500
# 	options=460<TSO4,TSO6,CHANNEL_IO>
# 	ether 82:34:26:83:b8:00
# 	media: autoselect <full-duplex>
# 	status: inactive
# bridge0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
# 	options=63<RXCSUM,TXCSUM,TSO4,TSO6>
# 	ether 82:34:26:83:b8:01
# 	Configuration:
# 		id 0:0:0:0:0:0 priority 0 hellotime 0 fwddelay 0
# 		maxage 0 holdcnt 0 proto stp maxaddr 100 timeout 1200
# 		root id 0:0:0:0:0:0 priority 0 ifcost 0 port 0
# 		ipfilter disabled flags 0x0
# 	member: en1 flags=3<LEARNING,DISCOVER>
# 	        ifmaxaddr 0 port 5 priority 0 path cost 0
# 	member: en2 flags=3<LEARNING,DISCOVER>
# 	        ifmaxaddr 0 port 6 priority 0 path cost 0
# 	nd6 options=201<PERFORMNUD,DAD>
# 	media: <unknown type>
# 	status: inactive
# p2p0: flags=8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 2304
# 	options=400<CHANNEL_IO>
# 	ether 0a:e9:fe:7f:9c:fe
# 	media: autoselect
# 	status: inactive
# awdl0: flags=8943<UP,BROADCAST,RUNNING,PROMISC,SIMPLEX,MULTICAST> mtu 1484
# 	options=400<CHANNEL_IO>
# 	ether 5e:08:9b:76:fd:95
# 	inet6 fe80::5c08:9bff:fe76:fd95%awdl0 prefixlen 64 scopeid 0x9
# 	nd6 options=201<PERFORMNUD,DAD>
# 	media: autoselect
# 	status: active
# llw0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
# 	options=400<CHANNEL_IO>
# 	ether 5e:08:9b:76:fd:95
# 	inet6 fe80::5c08:9bff:fe76:fd95%llw0 prefixlen 64 scopeid 0xa
# 	nd6 options=201<PERFORMNUD,DAD>
# 	media: autoselect
# 	status: active
# utun0: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380
# 	inet6 fe80::1bf4:554f:14b7:7682%utun0 prefixlen 64 scopeid 0xb
# 	nd6 options=201<PERFORMNUD,DAD>
# utun1: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 2000
# 	inet6 fe80::3c0f:5092:dba:a662%utun1 prefixlen 64 scopeid 0xc
# 	nd6 options=201<PERFORMNUD,DAD>
# utun2: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380
# 	inet6 fe80::4386:49f5:9568:1021%utun2 prefixlen 64 scopeid 0xd
# 	nd6 options=201<PERFORMNUD,DAD>
# utun3: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380
# 	inet6 fe80::8b64:6f2a:1fe:9608%utun3 prefixlen 64 scopeid 0xe
# 	nd6 options=201<PERFORMNUD,DAD>
# utun4: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380
# 	inet6 fe80::8170:afa1:7e81:b171%utun4 prefixlen 64 scopeid 0xf
# 	nd6 options=201<PERFORMNUD,DAD>
# utun5: flags=8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1380
# 	inet6 fe80::36d:698c:e3be:bbad%utun5 prefixlen 64 scopeid 0x10
# 	nd6 options=201<PERFORMNUD,DAD>