module ActsAsTaggableOn
  module Tagging
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      ##
      # Make a model be the tagging class. There should be only one.
      #
      # Example:
      #   class Tagging < ActiveRecord::Base
      #     is_tagging_class
      #   end
      def is_tagging_class(opts={})
        class_eval do
          attr_accessible :tag,
                          :tag_id,
                          :context,
                          :taggable,
                          :taggable_type,
                          :taggable_id,
                          :tagger,
                          :tagger_type,
                          :tagger_id

          belongs_to :tag, :class_name => 'Tag'
          belongs_to :taggable, :polymorphic => true
          belongs_to :tagger,   :polymorphic => true

          validates_presence_of :context
          validates_presence_of :tag_id

          validates_uniqueness_of :tag_id, :scope => [ :taggable_type, :taggable_id, :context, :tagger_id, :tagger_type ]
        end
      end
    end
  end
end
