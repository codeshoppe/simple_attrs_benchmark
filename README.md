simple_attrs_benchmark
======================


There are many gems that aim to simplify attribute definition for plain old Ruby objects.  Many include rich features such as type checking, coercion and default values.  The goal of [SimpleAttrs](http://codeshoppe.io/simple_attrs/) is to provide a bare bones DSL to define attributes and add support for:

1. Mass assignment through the object initializer
2. Provide a reader/writter for every attribute defined


## Execute
0. Clone repo
0. `$ bundle install`
0. `$ bundle exec ruby ./benchmark_samples.rb`

## Results
Ran on MBP, Processor: 2.4GHz i5, Memory: 8GB

| Gem | 1 attr / 1 obj | 25 attrs / 1 obj | 1 attr / 100,000 objs | 25 attrs / 100,000 objs |
| ------------ | ------------ | ----------- | ------------ | ------------ |
| Attrio       |  `0.001390`  |  `0.000293` |  `1.234200`  |  `22.420148` |
| Attrs        |  `0.000013`  |  `0.000104` |  `0.177039`  |  `_4.367675` |
| Simple Attrs |  `0.000012`  |  `0.000010` |  `0.185468`  |  `_0.176154` |
| Virtus       |  `0.000256`  |  `0.000396` |  `0.763091`  |  `11.319977` |

`simple_attrs` can provide a huge performance gain if you plan on instantiating many objects.  

### Raw results

```
Running All Benchmarks: count[1]  full[false]
         Attrio  0.000000   0.000000   0.000000 (  0.001390)
          Attrs  0.000000   0.000000   0.000000 (  0.000013)
   Simple Attrs  0.000000   0.000000   0.000000 (  0.000012)
         Virtus  0.000000   0.000000   0.000000 (  0.000256)


Running All Benchmarks: count[1]  full[true]
         Attrio  0.000000   0.000000   0.000000 (  0.000293)
          Attrs  0.000000   0.000000   0.000000 (  0.000104)
   Simple Attrs  0.000000   0.000000   0.000000 (  0.000010)
         Virtus  0.010000   0.000000   0.010000 (  0.000396)


Running All Benchmarks: count[100000]  full[false]
         Attrio  1.230000   0.000000   1.230000 (  1.234200)
          Attrs  0.170000   0.000000   0.170000 (  0.177039)
   Simple Attrs  0.190000   0.000000   0.190000 (  0.185468)
         Virtus  0.760000   0.000000   0.760000 (  0.763091)


Running All Benchmarks: count[100000]  full[true]
         Attrio 22.400000   0.020000  22.420000 ( 22.420148)
          Attrs  4.360000   0.000000   4.360000 (  4.367675)
   Simple Attrs  0.180000   0.000000   0.180000 (  0.176154)
         Virtus 11.310000   0.010000  11.320000 ( 11.319977)
```

