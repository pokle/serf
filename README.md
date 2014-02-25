serf
====

Helps you get started with Serf for service discovery quickly - http://www.serfdom.io/

Getting started
---------------

- You'll need Docker - https://www.docker.io
- Clone this repository

		git clone https://github.com/pokle/serf.git
		cd serf
- Build the poklet/serf docker image

		./scripts/build.sh


Start a cluster of 7 containers
--------------------------------

	$ ./scripts/run 7

This will spit out the container ids - which you can thankfully ignore because the containers are named serf1, serf2... serf10. You can see their IP addresses by running:

	$ ./scripts/ips.sh

	172.17.0.8 serf2
	172.17.0.7 serf3
	172.17.0.6 serf4
	172.17.0.5 serf5
	172.17.0.4 serf6
	172.17.0.3 serf7
	172.17.0.2 serf1

You can now run 'serf members -rpc-addr=x.x.x.x:7373' against any of these containers if you have serf installed locally. Or, you can use my little script:


	$ ./scripts/members.sh

	serf1     172.17.0.2:7946    alive    
	serf7     172.17.0.3:7946    alive    
	serf6     172.17.0.4:7946    alive    
	serf5     172.17.0.5:7946    alive    
	serf4     172.17.0.6:7946    alive    
	serf3     172.17.0.7:7946    alive    
	serf2     172.17.0.8:7946    alive


Clean up
--------

To clean up these containers, simply run:

	./scripts/nuke.sh 7


TODO
----

Stay tuned for more!

- A sample with custom event handlers
- A demo of how to cluster a dynamic number of webapps with a load balancer

