# Ruby priority queue implementation

[![Build Status](https://travis-ci.org/ldonnet/priority_queue.png)](http://travis-ci.org/ldonnet/priority_queue?branch=master) [![Dependency Status](https://gemnasium.com/ldonnet/priority_queue.png)](https://gemnasium.com/ldonnet/priority_queue) [![Code Climate](https://codeclimate.com/github/ldonnet/priority_queue.png)](https://codeclimate.com/github/ldonnet/priority_queue)

This is a fibonacci-heap priority-queue implementation. That means

    insert:                      O(1)
    decrease_priority: Amortized O(1)
    delete_min:        Amortized O(log n)

This project is different from K. Kodamas PQueue in that it allows a decrease
key operation.  That makes PriorityQueue usable for algorithms like dijkstras
shortest path algorithm, while PQueue is more suitable for Heapsort and the
like.

## Requirements
 * Ruby 1.8 or later
 * c Compiler

## Installation

### Installing from source

De-compress archive and enter its top directory.
Then type:

```sh
bundle exec rake setup
```

### Installing a ruby gem

```sh
gem install priority_queue
```
 
## Usage

In this priority queue implementation the queue behaves similarly to a hash
that maps objects onto priorities.

### Hash Interface
    require 'priority_queue'

    q = PriorityQueue.new
    q["node1"] = 0
    q["node2"] = 1
    q.min #=> "node1"
    q[q.min] #=> 0
    q.min_value #=> 0

    q["node2"] = -1
    q.delete_min #=> "node2", 1
    q["node2"] #= nil
    q["node3"] = 1

    q.delete("node3") #=> "node3", 1
    q.delete("node2") #=> nil


### Queue Interface
    require 'priority_queue'

    q = PriorityQueue.new
    q.push "node1", 0 
    q.push "node2", 1

    q.min #=> "node1"

    q.decrease_priority("node2", -1)

    q.pop_min #=> "node2"
    q.min     #=> "node1"

for more exmples look into the documentation, the unit tests and the benchmark
suite.

### Dijkstras shortest path algorithm
    def dijkstra(start_node)
      # Nodes that may have neighbours wich can be relaxed further
      active = PriorityQueue.new         
      # Best distances found so far
      distances = Hash.new { 1.0 / 0.0 } 
      # Parent pointers describing shortest paths for all nodes
      parents = Hash.new                 

      # Initialize with start node
      active[start_node] = 0
      until active.empty?
	      u, distance = active.delete_min
	      distances[u] = distance
	      d = distance + 1
  	    u.neighbours.each do | v |
	        next unless d < distances[v] # we can't relax this one
	        active[v] = distances[v] = d
	        parents[v] = u
       	end    
      end
      parents
    end

## Performance
The benchmark directory contains an example where a random graph is created and
the shortests paths from a random node in this graph to all other nodes are
calculated with dijkstras shortests path algorithm. The algorithm is used to
compare the three different priority queue implementations in this package.

  * PoorPriorityQueue: A minimal priority queue implementation wich has
    delete_min in O(n).
  * RubyPriorityQueue: An efficent implementation in pure ruby.
  * CPriorityQueue: The same efficent implementation as a c extension.
  
The results are shown here

![Runtime for graphs of up to 8_000 Nodes](doc/compare_small.png "Runtime for graphs of up to 8_000 Nodes")

![Runtime for graphs of up to 600_000 Nodes](doc/compare_big.png "Runtime for graphs of up to 600_000 Nodes")

More Information
----------------

More information can be found on the [project website on GitHub](.).
There is extensive usage documentation available [on the wiki](../../wiki).

License
-------

This project is licensed under the MIT license, a copy of which can be found in the [LICENSE](./LICENSE.md) file.

Release Notes
-------------

The release notes can be found in [CHANGELOG](./CHANGELOG.md) file

Support
-------

Users looking for support should file an issue on the GitHub [issue tracking page](../../issues), or file a [pull request](../../pulls) if you have a fix available.
