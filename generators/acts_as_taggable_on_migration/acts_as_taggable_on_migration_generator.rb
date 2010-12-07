class ActsAsTaggableOnMigrationGenerator < Rails::Generator::Base 
  def manifest 
    record do |m| 
      m.migration_template 'migration.rb', 'db/migrate', :migration_file_name => "acts_as_taggable_on_migration"
      m.file "tag.rb", "app/models/tag.rb"
      m.file "tagging.rb", "app/models/tagging.rb"
      m.file "tags_helper.rb", "app/helpers/tags_helper.rb"
    end
  end
end
