# Difference between proxy server and reverse proxy server

  

up vote 1153 down vote [favorite](https://stackoverflow.com/questions/224664
/difference-between-proxy-server-and-reverse-proxy-server/366212#)

**678**

What is the difference between proxy server and reverse proxy server?

[proxy](https://stackoverflow.com/questions/tagged/proxy)
[webserver](https://stackoverflow.com/questions/tagged/webserver)
[terminology](https://stackoverflow.com/questions/tagged/terminology)
[reverse-proxy](https://stackoverflow.com/questions/tagged/reverse-proxy)

[share](https://stackoverflow.com/q/224664)|[improve this
question](https://stackoverflow.com/posts/224664/edit)

[edited Nov 9 '15 at 11:06](https://stackoverflow.com/posts/224664/revisions)

![](Difference between proxy server and reverse
p_files/820c611835bb6eea4851c318a3b73345.png)

[laike9m](https://stackoverflow.com/users/2142577/laike9m)

6,55044073

asked Oct 22 '08 at 6:27

Vicky

30



It's well explained in [Apache
docs](http://httpd.apache.org/docs/2.4/mod/mod_proxy.html#forwardreverse),
too. – [Paolo](https://stackoverflow.com/users/573034/paolo) [Sep 25 '12 at
19:52](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment16967072_224664)

3



@Paolo that made it _much_ easier to understand than the Wikipedia article.
Perhaps I should get around to editing some of that info into the Wikipedia
article eventually... –
[RastaJedi](https://stackoverflow.com/users/1701799/rastajedi) [Jul 17 '16 at
17:32](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment64254575_224664)





Lets say I have host A which needs to connect to host C, but doesn't directly.
Instead, it is configured as a with host entry or possibly dns, to call B
which forwards the request to C. C doesn't care or know about B. Is this a
forward proxy or a reverse proxy? – [Daniel
Leach](https://stackoverflow.com/users/6611106/daniel-leach) [Apr 12 at
17:07](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment73813611_224664)





upvoted to 1111!!!! –
[SuperUberDuper](https://stackoverflow.com/users/3915717/superuberduper) [Aug
24 at 14:25](https://stackoverflow.com/questions/224664/difference-between-
proxy-server-and-reverse-proxy-server/366212#comment78686704_224664)





If host A can't get to host C without being configured to first contact host
B, then host B is a traditional forward or "outbound" proxy server. –
[TaylorMonacelli](https://stackoverflow.com/users/1495086/taylormonacelli)
[Aug 27 at 22:25](https://stackoverflow.com/questions/224664/difference-
between-proxy-server-and-reverse-proxy-server/366212#comment78778434_224664)

[show **1** more comment](https://stackoverflow.com/questions/224664
/difference-between-proxy-server-and-reverse-proxy-server/366212#)

##  16 Answers

[ active](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server?answertab=active#tab-top) [
oldest](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server?answertab=oldest#tab-top) [
votes](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server?answertab=votes#tab-top)

up vote 2191 down vote

The previous answers were accurate, but perhaps too terse. I will try to add
some examples.

First of all, the word "proxy" describes someone or something acting on behalf
of someone else.

In the computer realm, we are talking about one server acting on the behalf of
another computer.

For the purposes of accessibility, I will limit my discussion to web proxies -
however, the idea of a proxy is not limited to web sites.

# FORWARD proxy

Most discussion of web proxies refers to the type of proxy known as a "forward
proxy."

The proxy event in this case is that the "forward proxy" retrieves data from
another web site on behalf of the original requestee.

## A tale of 3 computers (part I)

For an example, I will list three computers connected to the internet.

  * X = your computer, or "client" computer on the internet
  * Y = the proxy web site, proxy.example.org
  * Z = the web site you want to visit, www.example.net

Normally, one would connect directly from `X --> Z.`

However, in some scenarios, it is better for `Y --> Z` on behalf of `X`, which
chains as follows: `X --> Y --> Z`.

## Reasons why X would want to use a forward proxy server:

Here is a (very) partial list of uses of a forward proxy server.

  * 1) X is unable to access Z directly because

    * a) Someone with administration authority over `X`'s internet connection has decided to block all access to site `Z`. 

      * Examples:

        * The Storm Worm virus is spreading by tricking people into visiting `familypostcards2008.com`, so the system administrator has blocked access to the site to prevent users from inadvertently infecting themselves.

        * Employees at a large company have been wasting too much time on `facebook.com`, so management wants access blocked during business hours.

        * A local elementary school disallows internet access to the `playboy.com` web site.

        * A government is unable to control the publishing of news, so it controls access to news instead, by blocking sites such as `wikipedia.org`. See [TOR](http://www.onion-router.net/) or [FreeNet](http://freenetproject.org/).

    * b) The administrator of `Z` has blocked `X`.

      * Examples:

        * The administrator of Z has noticed hacking attempts coming from X, so the administrator has decided to block X's ip address (and/or netrange).

        * Z is a forum web site. `X` is spamming the forum. Z blocks X.

# REVERSE proxy

## A tale of 3 computers (part II)

For this example, I will list three computers connected to the internet.

  * X = your computer, or "client" computer on the internet
  * Y = the reverse proxy web site, proxy.example.com
  * Z = the web site you want to visit, www.example.net

Normally, one would connect directly from `X --> Z.`

However, in some scenarios, it is better for the administrator of `Z` to
restrict or disallow direct access, and force visitors to go through Y first.
So, as before, we have data being retrieved by `Y --> Z` on behalf of `X`,
which chains as follows: `X --> Y --> Z`.

What is different this time compared to a "forward proxy," is that this time
the user `X` does not know he is accessing Z, because the user `X` only sees
he is communicating with `Y`. The server `Z` is invisible to clients and only
the reverse proxy `Y` is visible externally. A reverse proxy requires no
(proxy) configuration on the client side.

The client `X` thinks he is only communicating with `Y` (`X --> Y`), but the
reality is that `Y` forwarding all communication (`X --> Y --> Z` again).

## Reasons why Z would want to set up a reverse proxy server:

  * 1) Z wants to force all traffic to its web site to pass through Y first. 
    * a) Z has a large web site that millions of people want to see, but a single web server cannot handle all the traffic. So Z sets up many servers, and puts a reverse proxy on the internet that will send users to the server closest to them when they try to visit Z. This is part of how the Content Distribution Network (CDN) concept works. 
      * Examples: 
        * [Apple Trailers](http://www.apple.com/trailers/) uses [Akamai](http://www.akamai.com/)
        * Jquery.com hosts its javascript files using [CloudFront CDN](http://aws.amazon.com/s3/) ([sample](http://static.jquery.com/files/rocker/scripts/custom.js)).
        * etc.
  * 2) The administrator of Z is worried about retaliation for content hosted on the server and does not want to expose the main server directly to the public. 
    * a) Owners of Spam brands such as "Canadian Pharmacy" appear to have thousands of servers, while in reality having most websites hosted on far fewer servers. Additionally, abuse complaints about the spam will only shut down the public servers, not the main server.

In the above scenarios, `Z` has the ability to choose `Y`.

# Links to topics from the post:

## Content Delivery Network

  * Lists of CDNs 
    * <http://www.mytestbox.com/miscellaneous/content-delivery-networks-cdn-list/>
    * <http://blog.streamingmedia.com/the_business_of_online_vi/2008/01/updated-list-of.html>

## forward proxy software (server side)

  * [cgi-proxy](http://www.jmarshall.com/tools/cgiproxy/)
  * [phproxy](http://sourceforge.net/projects/poxy) (discontinued) 
  * [glype](http://www.glype.com/)
  * [Internet censorship wiki: List of Web Proxies](http://en.cship.org/wiki/Category:Webproxy)
  * [squid](http://www.squid-cache.org/) (apparently, can also work as a reverse proxy)

## reverse proxy software for HTTP (server side)

  * [apache mod_proxy](http://wiki.apache.org/cocoon/ApacheModProxy) (can also work as a forward proxy for HTTP)
  * [nginx](http://nginx.net/) (used on hulu.com, spam sites, etc.)
  * [HAProxy](http://haproxy.1wt.eu/)
  * [lighthttpd](http://redmine.lighttpd.net/projects/lighttpd)
  * [perlbal](http://www.danga.com/perlbal/) (written for livejournal)
  * [portfusion](http://portfusion.sf.net/)
  * [pound](http://www.apsis.ch/pound/)
  * [varnish cache](http://varnish-cache.org/) (written by a [freebsd kernel guru](https://info.varnish-software.com/blog/celebrating-10-years-of-varnish-cache-qa-with-the-man-behind-the-idea))
  * [repose](http://wiki.openrepose.org/display/REPOSE/Getting+Started+with+Repose)

## reverse proxy software for TCP (server side)

  * [balance](http://www.inlab.de/balance.html)
  * [delegate](http://www.delegate.org/delegate/nvproxy/)
  * [pen](http://siag.nu/pen/)
  * [portfusion](http://portfusion.sf.net/)
  * [pure load balancer](http://web.archive.org/web/20080113185334/http://plb.sunsite.dk/index.html) (web site defunct)
  * [python director](http://pythondirector.sourceforge.net/)

## see also:

  * [Wikipedia - Content Delivery Network](http://en.wikipedia.org/wiki/Content_Delivery_Network)
  * [Wikipedia - Category:Reverse_proxy](http://en.wikipedia.org/wiki/Category:Reverse_proxy)
  * [Wikipedia - Load Balancing](http://en.wikipedia.org/wiki/Load_balancing_\(computing\))
  * [Wikipedia - Scalability](http://en.wikipedia.org/wiki/Scalability)

[share](https://stackoverflow.com/a/366212)|[improve this
answer](https://stackoverflow.com/posts/366212/edit)

[edited Jan 9 at 19:40](https://stackoverflow.com/posts/366212/revisions)

community wiki

  

[ 19 revs, 13 users 94%  
](https://stackoverflow.com/posts/366212/revisions)[qyb2zm302](https://stackov
erflow.com/users/44862)

1



TAM (tivoli access manager) is also a reverse proxy server, right? – [Clark
Bao](https://stackoverflow.com/users/785566/clark-bao) [Aug 29 '11 at
6:16](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment8688236_366212)





what about open-proxy?? –
[AminM](https://stackoverflow.com/users/1275574/aminm) [Jul 19 '14 at
7:26](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment38563833_366212)

1



Conceptually then, we could refer to or think of a "reverse proxy" then as a
"forced" proxy? – [Thomas](https://stackoverflow.com/users/3469725/thomas)
[Mar 5 '15 at 21:06](https://stackoverflow.com/questions/224664/difference-
between-proxy-server-and-reverse-proxy-server/366212#comment46036643_366212)

1



"that will send users to the server closest to them" \- What is the point? All
the traffic will go through that proxy server, right? So it does not matter
where location of 'local' server behind it is. Or I am missing something? –
[Pavel](https://stackoverflow.com/users/916497/pavel) [May 3 '16 at
5:11](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment61545650_366212)

1



@Pavel probably "server closest to them" isn't the best description. More like
"distribute load to pool of servers" is better description. This example was
describing a reverse proxy load balancer. –
[JDS](https://stackoverflow.com/users/391851/jds) [Oct 24 '16 at
14:37](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment67705680_366212)

[show **7** more comments](https://stackoverflow.com/questions/224664
/difference-between-proxy-server-and-reverse-proxy-server/366212#)

up vote 372 down vote

A pair of simple definition would be

Forward Proxy: Acting on behalf of a requestor (or service consumer)

Reverse Proxy: Acting on behalf of service/content producer.

[share](https://stackoverflow.com/a/11903901)|[improve this
answer](https://stackoverflow.com/posts/11903901/edit)

[edited Aug 10 '12 at
19:22](https://stackoverflow.com/posts/11903901/revisions)

![](Difference between proxy server and reverse
p_files/c80e295c8f9d603d771873e1997e3f85.jpg)

[Tetsujin no Oni](https://stackoverflow.com/users/93922/tetsujin-no-oni)

5,95511944

answered Aug 10 '12 at 14:35

![](Difference between proxy server and reverse
p_files/f930e4454536fb05ba7ed987cd67da3f.png)

[Krishna Bheemanakatte](https://stackoverflow.com/users/1590531/krishna-
bheemanakatte)

3,729172

53



+1 for keeping it simple –
[Calimo](https://stackoverflow.com/users/333599/calimo) [Jun 17 '13 at
7:58](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment24811275_11903901)

5



+1 - Only thing I would add is that the difference between the two is more
about deployment than implementation. – [Robert
Christian](https://stackoverflow.com/users/433344/robert-christian) [Feb 24
'14 at 0:54](https://stackoverflow.com/questions/224664/difference-between-
proxy-server-and-reverse-proxy-server/366212#comment33302685_11903901)

4



I would totally upvote this.. but it's currently at 69. Thanks for the simple
answer! – [Vnge](https://stackoverflow.com/users/1888585/vnge) [Dec 29 '14 at
18:00](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment43800625_11903901)

2



The previous mopst voted answer was informative but so not to the point. This
is the one. Thanks. Clear and simple. –
[pabloelustondo](https://stackoverflow.com/users/1173878/pabloelustondo) [Nov
23 '15 at 19:20](https://stackoverflow.com/questions/224664/difference-
between-proxy-server-and-reverse-proxy-server/366212#comment55521796_11903901)





Thanks for so simple but clear answer. –
[pkk](https://stackoverflow.com/users/4894157/pkk) [Nov 24 '15 at
11:33](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment55548082_11903901)

[show **2** more comments](https://stackoverflow.com/questions/224664
/difference-between-proxy-server-and-reverse-proxy-server/366212#)

up vote 154 down vote

+50

qyb2zm302's answer nicely details applications of proxies but slips up on the
fundamental concept between forward and reverse proxies. For the reverse
proxy, X -> Y -> Z, X knows about Y and not Z, rather than vice versa.

<http://www.jscape.com/blog/bid/87783/Forward-Proxy-vs-Reverse-Proxy> explains
the difference between forward and reverse proxies very clearly.

A proxy is simply a middleman for communication(requests+responses). Client
<-> Proxy <-> Server

  * Client proxy: **(** Client <-> Proxy **)** <-> Server

The proxy acts on behalf of the client. Client knows about all 3 machines
involved in chain. Server doesn't.

  * Server proxy: Client <-> **(** Proxy <-> Server **)**

The proxy acts on behalf of the server. Client only knows about proxy. Server
knows whole chain.

Seems to me that _forward_ and _reverse_ are simply confusing, perspective-
dependent names for _client_ and _server_ proxy. I suggest abandoning the
former for the latter, for explicit communication.

Of course, to further complicate the matter, not every machine is exclusively
a client or a server. If there is an ambiguity in context, it's best to
explicitly specify where the proxy lies, and the communications that it
tunnels.

[share](https://stackoverflow.com/a/14190390)|[improve this
answer](https://stackoverflow.com/posts/14190390/edit)

[edited Jan 16 '15 at
20:19](https://stackoverflow.com/posts/14190390/revisions)

answered Jan 7 '13 at 5:29

![](Difference between proxy server and reverse
p_files/159c6e054766726fa0b23348c81ae487.png)

[Protongun](https://stackoverflow.com/users/944387/protongun)

1,9431910

3



This answer is in line with [httpd.apache.org/docs/2.0/mod/mod_proxy.html#forw
ardreverse](http://httpd.apache.org/docs/2.0/mod/mod_proxy.html#forwardreverse
) and helps explain it clearly – [Greg
Woods](https://stackoverflow.com/users/105396/greg-woods) [Jun 7 '13 at
8:42](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment24527207_14190390)





Thanks! the same understanding :) I just got confused when reading the reverse
proxy example in the most up-voted answer from @qyb2zm302. Hope someone whose
native language is English could help edit that answer. – [Roy
Ling](https://stackoverflow.com/users/1533884/roy-ling) [Jan 15 '15 at
5:53](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment44309322_14190390)

3



it seems that the most relevant feature in this comparison is who-knows-who.
forward proxy: client knows both proxy (it has it configured in fact) and
target server (as it makes request to url of server), while, in the case of
reverse proxy, the client knows of the proxy as a target server (it does not
know what the proxy is actually calling; it can be one server or more). with a
forward proxy, the server does not know who the clients really are, as the
proxy "forwards" request to it. forward proxy: hide client(s). reverse proxy:
hide server(s). – [Belun](https://stackoverflow.com/users/339228/belun) [Mar
10 '15 at 4:44](https://stackoverflow.com/questions/224664/difference-between-
proxy-server-and-reverse-proxy-server/366212#comment46165750_14190390)

1



I highly agree with the suggested naming change to client and server proxy. To
me, "reverse" is too loaded of a term for the functionality of a "reverse
proxy" server! – [dleve123](https://stackoverflow.com/users/2658526/dleve123)
[Jun 11 '15 at 14:29](https://stackoverflow.com/questions/224664/difference-
between-proxy-server-and-reverse-proxy-server/366212#comment49617317_14190390)

3



+50 for this answer, it's my favorite. Not that the other answers weren't
clear, but I really like the terminology change here. When I read about a
"reverse proxy", I mentally substitute "server-side proxy" (or client-side),
and it works much better as a mental model. – [John
C](https://stackoverflow.com/users/78409/john-c) [Apr 19 '16 at
12:27](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment61021874_14190390)

[show **5** more comments](https://stackoverflow.com/questions/224664
/difference-between-proxy-server-and-reverse-proxy-server/366212#)

up vote 109 down vote

Some diagrams might help:

**Forward proxy**

![Forward proxy](Difference between proxy server and reverse
p_files/MPQAt.png)

**Reverse proxy**

![Reverse proxy](Difference between proxy server and reverse
p_files/xrOba.png)

[share](https://stackoverflow.com/a/28001462)|[improve this
answer](https://stackoverflow.com/posts/28001462/edit)

[edited Feb 23 '15 at
4:41](https://stackoverflow.com/posts/28001462/revisions)

answered Jan 17 '15 at 16:14

![](Difference between proxy server and reverse
p_files/64812738cde2103e3694c16911633316.png)

[Maria Ines Parnisari](https://stackoverflow.com/users/1623249/maria-ines-
parnisari)

7,75533971

11



Best answer so far. –
[ThinkingInBits](https://stackoverflow.com/users/324243/thinkinginbits) [Oct
17 '15 at 22:52](https://stackoverflow.com/questions/224664/difference-
between-proxy-server-and-reverse-proxy-server/366212#comment54190619_28001462)

5



Is it? They look the same! What is so special about re-writing a response that
makes a proxy a "reverse" proxy? –
[8bitjunkie](https://stackoverflow.com/users/653708/8bitjunkie) [Feb 29 '16 at
15:31](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment59083262_28001462)

2



@8bitjunkie Its about perspective. Notice that, for the forward proxy, the
client knows it is communicating with a proxy server. For the reverse proxy,
the client thinks it is communicating directly with home.com. The proxies also
have different implementations. The reverse proxy can be pretty stupid. All it
has to do is change the address and pass the call along. More networking logic
on client, less on the proxy. The forward proxy, on the other hand, needs to
somehow know that a request for proxy.com() requires a call to service.com.
Less networking logic on client, more on the proxy. –
[Kevin](https://stackoverflow.com/users/3176480/kevin) [Mar 23 '16 at
14:39](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment59997444_28001462)





What is meant by "**translate** myhome.myhosting.com to hom.com" I don't get
the translate part. Like re-write part of the response header or something? –
[1252748](https://stackoverflow.com/users/1252748/1252748) [Nov 4 '16 at
22:51](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment68114076_28001462)

3



Don't let all my questions lead you to believe I don't like this answer! The
diagrams are super helpful thanks! (-: –
[1252748](https://stackoverflow.com/users/1252748/1252748) [Nov 4 '16 at
22:54](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment68114134_28001462)

[show **2** more comments](https://stackoverflow.com/questions/224664
/difference-between-proxy-server-and-reverse-proxy-server/366212#)

up vote 99 down vote

I found this diagram to be very helpful. It just shows the Architecture of a
Forward vs Reverse proxy setup with a **complete** perspective i.e from My
Computer to Internet. This image will help you to understand qyb2zm302's
[post](https://stackoverflow.com/a/366212/452102) better.

It reminds you of the classic proverb:

> A picture is worth 1000 words.

![Forward Proxy vs Reverse Proxy](Difference between proxy server and reverse
p_files/0qpxZ.png)

Source: <https://www.quora.com/Whats-the-difference-between-a-reverse-proxy-
and-forward-proxy>. All credits to the person who created this diagram.

[share](https://stackoverflow.com/a/39241016)|[improve this
answer](https://stackoverflow.com/posts/39241016/edit)

[edited May 23 at 12:34](https://stackoverflow.com/posts/39241016/revisions)

![](Difference between proxy server and reverse
p_files/a007be5a61f6aa8f3e85ae2fc18dd66e.png)

[Community](https://stackoverflow.com/users/-1/community)♦

11

answered Aug 31 '16 at 4:55

![](Difference between proxy server and reverse p_files/6Rcyo.jpg)

[Nishant](https://stackoverflow.com/users/452102/nishant)

5,23153747

2



This is really wonderful. –
[DrunkenMaster](https://stackoverflow.com/users/3796318/drunkenmaster) [Oct 4
'16 at 18:54](https://stackoverflow.com/questions/224664/difference-between-
proxy-server-and-reverse-proxy-server/366212#comment67007399_39241016)

1



This is really all you need to look at. Setting up a proxy in your browser so
that Netflix doesn't know what country you're in is a forward proxy; an
upstream service that directs an incoming request (perhaps you want to send
one request to two servers) is a reverse proxy. – [Kyle
Chadha](https://stackoverflow.com/users/3081480/kyle-chadha) [Dec 9 '16 at
15:29](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment69334522_39241016)





Yeah. When you are requesting something, you don't directly go there, instead
you send someone else on your behalf = Forward Proxy. When you are requesting
something, the server doesn't directly give you, instead someone else on the
servers behalf gives you = Reverse Proxy. –
[Nishant](https://stackoverflow.com/users/452102/nishant) [Jan 12 at
7:54](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment70417173_39241016)

2



Forward proxy can be on internet as well –
[mac](https://stackoverflow.com/users/815944/mac) [Mar 3 at
7:39](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment72279645_39241016)

2



The best picture in the last answer. Thanks. :) A reverse proxy is also known
as "Load Balancer" and acts on the server-side (distribute load to different
servers), while a forward proxy supports the client side. –
[codepleb](https://stackoverflow.com/users/2311557/codepleb) [Apr 12 at
20:53](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment73821026_39241016)

add a comment

up vote 57 down vote

The difference is primarily in deployment. Web forward and reverse proxies all
have the same underlying features, they accept requests for HTTP requests in
various formats and provide a response, usually by accessing the origin or
contact server.

Fully featured servers usually have access control, caching, and some link-
mapping features.

A forward proxy is a proxy that is accessed by configuring the client machine.
The client needs protocol support for proxy features (redirection, proxy auth,
etc.). The proxy is transparent to the user experience, but not to the
application.

A reverse proxy is a proxy that is deployed as a web server and behaves like a
web server, with the exception that instead of locally composing the content
from programs and disk, it forwards the request to an origin server. From the
client perspective it IS a web server, so the user experience is completely
transparent.

In fact, a single proxy instance can run as a forward and reverse proxy at the
same time for different client populations.

That's the short version, I can clarify if people want to comment.

[share](https://stackoverflow.com/a/227985)|[improve this
answer](https://stackoverflow.com/posts/227985/edit)

[edited Jul 17 '16 at 17:35](https://stackoverflow.com/posts/227985/revisions)

community wiki

  

[ 3 revs, 3 users 80%  
](https://stackoverflow.com/posts/227985/revisions)[benc](https://stackoverflo
w.com/users/2910)





Just to be sure, a forward proxy is client-side and a reverse proxy is server-
side? – [Yves](https://stackoverflow.com/users/1303917/yves) [Jul 28 '14 at
13:13](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment38862695_227985)

2



@yves. a proxy is also a server. It is just that client need a local
configuration so that they can communicate. While a reverse proxy requires
configuration at the server itself. Their physical nodes are both at the
'server side'. – [whiteletters in
blankpapers](https://stackoverflow.com/users/1276136/whiteletters-in-
blankpapers) [Nov 10 '14 at 12:15](https://stackoverflow.com/questions/224664
/difference-between-proxy-server-and-reverse-proxy-
server/366212#comment42250471_227985)





Just for general info, not _all_ proxies can operate as forward and reverse,
e.g., SOCKS can, but not HTTP proxies. –
[RastaJedi](https://stackoverflow.com/users/1701799/rastajedi) [Jul 17 '16 at
17:37](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment64254706_227985)

add a comment

up vote 28 down vote

A proxy server proxies (and optionally caches) outgoing network requests to
various not-necessarily-related public resources across the Internet. A
reverse proxy captures (and optionally caches) incoming requests from the
Internet and distributes them to various internal private resources, usually
for HA purposes.

[share](https://stackoverflow.com/a/224697)|[improve this
answer](https://stackoverflow.com/posts/224697/edit)

answered Oct 22 '08 at 6:45

![](Difference between proxy server and reverse
p_files/2343ae368d3241278581ce6c87f62a25.jpg)

[Ignacio Vazquez-Abrams](https://stackoverflow.com/users/20862/ignacio-
vazquez-abrams)

506k829161057

1



Sorry, but what is 'HA'? –
[RastaJedi](https://stackoverflow.com/users/1701799/rastajedi) [Jul 17 '16 at
17:29](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment64254509_224697)

2



@RastaJedi: High Availability. – [Ignacio Vazquez-
Abrams](https://stackoverflow.com/users/20862/ignacio-vazquez-abrams) [Jul 17
'16 at 17:32](https://stackoverflow.com/questions/224664/difference-between-
proxy-server-and-reverse-proxy-server/366212#comment64254570_224697)

add a comment

up vote 25 down vote

Best explanation [here](http://www.jscape.com/blog/bid/87783/Forward-Proxy-vs-
Reverse-Proxy) with diagrams:

While a **_forward proxy_** proxies in behalf of clients **(** or requesting
hosts **)**, a **_reverse proxy_** proxies in behalf of servers

In effect, whereas a **_forward proxy_** hides the identities of clients, a
**_reverse proxy_** hides the identities of servers

[share](https://stackoverflow.com/a/38760079)|[improve this
answer](https://stackoverflow.com/posts/38760079/edit)

answered Aug 4 '16 at 6:36

![](Difference between proxy server and reverse
p_files/f1a155df4d4fbe2d7fafbe8470f83e37.png)

[Farhan](https://stackoverflow.com/users/345138/farhan)

8801020

add a comment

up vote 24 down vote

Proxy : It is making the request on behalf of the client. So, the server will
return the response to the proxy and the proxy will forward the response to
the client. In fact, the server will never "learn" who the client was
(client's IP), it will only know the proxy. However, the client definitely
knows the server, since it essentially formats the HTTP request destined for
the server, but it just hands it to the proxy.

![enter image description here](Difference between proxy server and reverse
p_files/eeQP2.png)

Reverse Proxy : It is receiving the request on behalf of the server. It
forwards the request to the server, receives the response and then returns the
response to the client. In this case, the client will never "learn" who was
the actual server (server's IP) (with some exceptions), it will only know the
proxy. The server will or won't know the actual client, depending on the
configurations of the reverse proxy.

![enter image description here](Difference between proxy server and reverse
p_files/zOvvx.png)

[share](https://stackoverflow.com/a/35523676)|[improve this
answer](https://stackoverflow.com/posts/35523676/edit)

[edited Feb 29 '16 at
16:59](https://stackoverflow.com/posts/35523676/revisions)

answered Feb 20 '16 at 13:06

![](Difference between proxy server and reverse p_files/4mxIS.jpg)

[Dimos](https://stackoverflow.com/users/3531794/dimos)

3,4191226

1



I feel like I could copy and paste your definitions backwards and that they
would still be true. I don't think this explains any key difference or
clarifies what is so "reverse" about a reverse proxy? –
[8bitjunkie](https://stackoverflow.com/users/653708/8bitjunkie) [Feb 29 '16 at
15:35](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment59083422_35523676)

2



The proxy will always act on behalf of someone (hiding its identity from the
other party). The "reverse" refers to reversing the side of which is "hidden",
with it being client on the first case (regular proxy) and server on the
second case (reverse proxy). Indeed, the terms could be used interchangeably,
it's just a matter of convention having selected the first case as the regular
proxy (probably for historic reasons). Hope this makes sense. –
[Dimos](https://stackoverflow.com/users/3531794/dimos) [Feb 29 '16 at
17:02](https://stackoverflow.com/questions/224664/difference-between-proxy-
server-and-reverse-proxy-server/366212#comment59087106_35523676)

add a comment

up vote 20 down vote

An ordinary **_forward proxy_** is an intermediate server that sits between
the client and the origin server. In order to get content from the origin
server, the client sends a request to the proxy naming the origin server as
the target and the proxy then requests the content from the origin server and
returns it to the client. **The client must be specially configured to use the
forward proxy to access other sites.**

A **_reverse proxy (or gateway)_**, by contrast, appears to the client just
like an ordinary web server. No special configuration on the client is
necessary. The client makes ordinary requests for content in the name-space of
the reverse proxy. The reverse proxy then decides where to send those
requests, and returns the content as if it was itself the origin.

A typical usage of a reverse proxy is to provide Internet users **access to a
server that is behind a firewall.** Reverse proxies can also be used to
balance load among several back-end servers, or to provide caching for a
slower back-end server. In addition, reverse proxies can be used simply to
bring several servers into the same URL space.

for more info visit : [Apache
Docs](http://httpd.apache.org/docs/2.4/mod/mod_proxy.html#page-header)

[share](https://stackoverflow.com/a/24776382)|[improve this
answer](https://stackoverflow.com/posts/24776382/edit)

answered Jul 16 '14 at 8:54

![](Difference between proxy server and reverse p_files/IkXxP.jpg)

[ironman_ma](https://stackoverflow.com/users/2404098/ironman-ma)

31128

add a comment

up vote 15 down vote

This is a great read to understand the differences between a Forward and
Reverse PROXY <http://www.jscape.com/blog/bid/87783/Forward-Proxy-vs-Reverse-
Proxy>

A forward proxy hides the identities of clients(users) whereas a reverse proxy
hides the identities of your servers.

[share](https://stackoverflow.com/a/22974802)|[improve this
answer](https://stackoverflow.com/posts/22974802/edit)

answered Apr 9 '14 at 22:00

![](Difference between proxy server and reverse
p_files/2b3a19592b4d1e8d1ff35be17b5ce298.png)

[Bonnie Varghese](https://stackoverflow.com/users/2526120/bonnie-varghese)

972811

add a comment

up vote 8 down vote

As per my understanding..........

To start with, as everyone knows proxy means "The authority to represent
someone else". Now there are two things Forward and Reverse proxy.

FORWARD PROXY Suppose you want to access "google" and "google" in turn will
have n number of servers to respond to that particular request.

Now in this case while you are requesting for something from google and you
don’t want google to see your IP address then you will use a forward proxy, as
explained below.

A----->B----->C

Now here you are A sending a request through B, So C will think that the
request is coming from B, not A. In this way you can prevent your clients IP
not to be exposed to outer world.

REVERSE PROXY. Now in this case, to make you understand we will take the same
case of forward proxy. Here you have requested for something to google which
in turn going to send the one request to the app server or another proxy
server to get the response. So these things will happen as explained below.

A----->B----->C

    
    
              C------>D
    
              C<------D
    

A<\-----B<\-----C From the above diagram you can see that a request has been
sent to C from B not from A.Then from C there will be one Request send to D.
Similarly the response will go to C from D and then to B and A.

The above diagram says its only the context which matters although both the
proxies are acting the same way but client side proxy is hiding client
information whereas server side proxy will hide server side information.

Please comment if you feel the above explanation is wrong.

[share](https://stackoverflow.com/a/13780821)|[improve this
answer](https://stackoverflow.com/posts/13780821/edit)

answered Dec 8 '12 at 19:00

![](Difference between proxy server and reverse
p_files/d1afe65fe00e9ce076578b430a3f2625.png)

[Sourabh Sharma](https://stackoverflow.com/users/1869245/sourabh-sharma)

10624

add a comment

up vote 7 down vote

Heres an example of a reverse proxy (as a load balancer).

A client surfs to website.com and the server it hits has a reverse proxy
running on it. The reverse proxy happens to be
[pound](https://en.wikipedia.org/wiki/Pound_%28networking%29). Pound takes the
request and sends it to one of the three application servers sitting behind
it. In this example Pound is a load balancer. ie. it is balancing load between
three application servers. The application servers serve up the website
content back to the client.

[share](https://stackoverflow.com/a/1058249)|[improve this
answer](https://stackoverflow.com/posts/1058249/edit)

[edited Jan 23 '16 at
14:17](https://stackoverflow.com/posts/1058249/revisions)

![](Difference between proxy server and reverse p_files/51lxh.jpg)

[whoan](https://stackoverflow.com/users/4095830/whoan)

5,50841939

answered Jun 29 '09 at 13:19

![](Difference between proxy server and reverse
p_files/ba6f06f526adc196e17b755a8c7ab790.png)

[ae.](https://stackoverflow.com/users/130399/ae)

1,0151918

add a comment

up vote 6 down vote

Although my understanding from an apache perspective is that Proxy means that
if site x proxies for site y, then requests for x return y.

The reverse proxy means that the response from y is adjusted so that all
references to y become x.

So that the user cannot tell that a proxy is involved...

[share](https://stackoverflow.com/a/224679)|[improve this
answer](https://stackoverflow.com/posts/224679/edit)

answered Oct 22 '08 at 6:33

![](Difference between proxy server and reverse
p_files/2f8d64945b3ebd2705950a9775f2232a.jpg)

[Chris Kimpton](https://stackoverflow.com/users/48310/chris-kimpton)

4,18743965

add a comment

up vote 3 down vote

**Proxy (Forward Proxy):** When computers on your LAN connect to a proxy server that accesses the internet. Benefits include, only the server being exposed to the internet. People on the outside are unable to access the computers directly. Forward proxies can improve internet access for users by caching downloads. They can also be used to restrict access to certain sites. Also, only the proxy server would need a public address, not the clients connecting to it.

**Reverse Proxy:** A reverse proxy is the opposite of a forward proxy. Instead it acts as a proxy on behalf of the servers being connected to. Instead of accessing a remote server directly, a user would go through the reverse proxy and get directed to the appropriate server from there. Only the reverse proxy would need an SSL certificate, only one public IP address would be needed and it can handle load balancing of incoming requests to enhance the overall user experience. 

![enter image description here](Difference between proxy server and reverse
p_files/J7PA8.jpg) _Image Source:
[docs.microsoft.com](https://docs.microsoft.com/en-us/iis/extensions
/configuring-application-request-routing-arr/creating-a-forward-proxy-using-
application-request-routing)_

[share](https://stackoverflow.com/a/46508865)|[improve this
answer](https://stackoverflow.com/posts/46508865/edit)

answered Oct 1 at 3:08

![](Difference between proxy server and reverse p_files/4x60x.jpg)

[JSON C11](https://stackoverflow.com/users/1244127/json-c11)

1,88742127

add a comment

up vote 1 down vote

**Forward proxies** grant the client anonymity (i.e, think Tor).

**Reverse proxies** grant back end servers anonymity (i.e, think servers behind a DMZ).

[share](https://stackoverflow.com/a/45959054)|[improve this
answer](https://stackoverflow.com/posts/45959054/edit)

answered Aug 30 at 11:21

![](Difference between proxy server and reverse p_files/bch50.jpg)

[8bitjunkie](https://stackoverflow.com/users/653708/8bitjunkie)

6,54063254

add a comment

##  **protected** by
[Community](https://stackoverflow.com/users/-1/community)♦ Jan 11 '13 at 18:28

Thank you for your interest in this question. Because it has attracted low-
quality or spam answers that had to be removed, posting an answer now requires
10 [reputation](https://stackoverflow.com/help/whats-reputation) on this site
(the [association bonus does not
count](https://stackoverflow.com/help/privileges/new-user)).  
  
Would you like to answer one of these [unanswered
questions](https://stackoverflow.com/unanswered?fromProtectedNotice=true)
instead?

  

 

