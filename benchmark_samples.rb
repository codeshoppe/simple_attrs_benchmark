require 'benchmark'
require './lib/attrio_sample'
require './lib/attrs_sample'
require './lib/simple_attrs_sample'
require './lib/virtus_sample'


module Perform
  module_function
  def attrio(count, full = false)
    stat_type = full ? "FullStat" : "SmallStat"
    klass = AttrioSample.const_get(stat_type)

    count.times {
      # No built in support for mass assignment
      s = klass.new
      s.stat_1 = 3
      s
    }
  end

  def attrs(count, full = false)
    stat_type = full ? "FullStat" : "SmallStat"
    klass = AttrsSample.const_get(stat_type)

    count.times {
      stat_type = full ? "FullStat" : "SmallStat"
      klass.new(stat_1: 3)
    }
  end

  def simple_attrs(count, full = false)
    stat_type = full ? "FullStat" : "SmallStat"
    klass = SimpleAttrsSample.const_get(stat_type)

    count.times {
      klass.new(stat_1: 3)
    }
  end

  def virtus(count, full = false)
    stat_type = full ? "FullStat" : "SmallStat"
    klass = VirtusSample.const_get(stat_type)

    count.times {
      klass.new(stat_1: 3)
    }
  end

  def all(count, full = false)
    puts "Running All Benchmarks: count[#{count}]  full[#{full.inspect}]"
    print 'Attrio'.rjust(15)
    puts Benchmark.measure { Perform.attrio(count, full) }

    print 'Attrs'.rjust(15)
    puts Benchmark.measure { Perform.attrs(count, full) }

    print 'Simple Attrs'.rjust(15)
    puts Benchmark.measure { Perform.simple_attrs(count, full) }

    print 'Virtus'.rjust(15)
    puts Benchmark.measure { Perform.virtus(count, full) }
    puts "\n\n"
  end
end

Perform.all(1, false)
Perform.all(1, true)

Perform.all(100000, false)
Perform.all(100000, true)
