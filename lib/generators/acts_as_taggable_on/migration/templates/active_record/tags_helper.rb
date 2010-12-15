module TagsHelper
  # See the README for an example using tag_cloud.
  def tag_cloud(tags, classes)
    tags = tags.all if tags.respond_to?(:all)

    return [] if tags.empty?

#   max_count = tags.sort_by(&:count).last.count.to_f
#   tags.each do |tag|
#      index = ((tag.count / max_count) * (classes.size - 1)).round
#      yield tag, classes[index]
#    end

    # use logs to get a better exponential curve
    min_log, max_log = lambda { |list| [list.first, list.last] }.call(tags.sort_by(&:count)).collect { |tag| Math.log(tag.count) }
    range_log = max_log - min_log
    range_log = 1 if max_log == min_log
    class_range = classes.size - 1
 
    tags.each do |tag|
      index = class_range * ((Math.log(tag.count) - min_log)/range_log).round
      yield tag, classes[index]
    end
  end
end
