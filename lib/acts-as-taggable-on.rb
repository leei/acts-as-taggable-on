require "active_record"
require "action_view"

$LOAD_PATH.unshift(File.dirname(__FILE__))

require "acts_as_taggable_on/acts_as_taggable_on"
require "acts_as_taggable_on/acts_as_taggable_on/core"
require "acts_as_taggable_on/acts_as_taggable_on/collection"
require "acts_as_taggable_on/acts_as_taggable_on/cache"
require "acts_as_taggable_on/acts_as_taggable_on/ownership"
require "acts_as_taggable_on/acts_as_taggable_on/related"

require "acts_as_taggable_on/acts_as_tagger"
require "acts_as_taggable_on/tag"
require "acts_as_taggable_on/tag_list"
require "acts_as_taggable_on/tags_helper"
require "acts_as_taggable_on/tagging"

$LOAD_PATH.shift

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend ActsAsTaggableOn::Taggable
  ActiveRecord::Base.extend ActsAsTaggableOn::Tagging
  ActiveRecord::Base.extend ActsAsTaggableOn::Tag
  ActiveRecord::Base.send :include, ActsAsTaggableOn::Tagger
end

if defined?(ActionView::Base)
  ActionView::Base.send :include, ActsAsTaggableOn::TagsHelper
end