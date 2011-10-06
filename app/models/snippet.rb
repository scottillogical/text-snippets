require 'ohm/contrib'
class Snippet < Ohm::Model
  include Ohm::Callbacks
  include Ohm::Timestamping
  include Ohm::Typecast
  attribute :name
  attribute :content
  attribute :version, Integer
  index :version
  index :name

  def self.find_recent_by_name(name)
    self.find(:name => name).sort_by(:version, :order => "DESC").first
  end

  def self.update_snippet_content(name, content) 
    latest_version = self.find_recent_by_name(name)
    return if latest_version.content == content
    self.create(:name => name, :content => content, :version => latest_version.version + 1)
  end

  def self.save_default(name, content)
    self.create(:name => name, :content => content, :version => 1)
  end

  def self.all_distinct
    all_distinct = []
    all_distinct_names = []
    self.all.sort_by(:version, :order => "DESC").each do |s| 
      next if all_distinct_names.include? s.name
      all_distinct << s 
      all_distinct_names << s.name
    end
    all_distinct
  end
end
