require 'attrs'

module AttrsSample
  SMALL_STATS = [:stat_1]
  FULL_STATS = [
    :stat_1, :stat_2, :stat_3, :stat_4, :stat_5,
    :stat_6, :stat_7, :stat_8, :stat_9, :stat_10,
    :stat_11, :stat_12, :stat_13, :stat_14, :stat_15,
    :stat_16, :stat_17, :stat_18, :stat_19, :stat_20,
    :stat_21, :stat_22, :stat_23, :stat_24, :stat_25
  ]

  class SmallStat < Attrs(*SMALL_STATS)
  end

  class FullStat < Attrs(*FULL_STATS)
    private
    FULL_STATS.each do |attr_name|
      define_method("default_#{attr_name}") do
        nil
      end
    end
  end
end
