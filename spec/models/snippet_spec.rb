require 'spec_helper'

describe Snippet do 

  it "saves" do 
    Snippet.create(:name => "homepage.hello", :content => "hi!")
  end

  it "loads" do 
    Snippet.find(:name => "homepage.hello")
  end

  it "basic operations" do 
    Snippet.save_default("homepage.hello", "default") 
    snippet = Snippet.find_recent_by_name("homepage.hello")
    snippet.content.should eql "default"
    snippet.version.should eql 1 

    Snippet.update_snippet_content("homepage.hello", "new content")
    snippet = Snippet.find_recent_by_name("homepage.hello")
    snippet.content.should eql "new content"
    snippet.version.should eql 2 

    # a no-op, won't affect production
    Snippet.save_default("homepage.hello", "new default") 
    snippet = Snippet.find_recent_by_name("homepage.hello")
    snippet.content.should eql "new content"
    snippet.version.should eql 2 
  end

  it "returns distinct snippets" do 
    Snippet.save_default("homepage.title", "default") 
    Snippet.update_snippet_content("homepage.title", "new content")
    Snippet.save_default("homepage.hello", "default") 
    Snippet.update_snippet_content("homepage.hello", "new content")
    snippets = Snippet.all_distinct
    snippets.count.should eql 2
  end
  pending "supports versioning" do 
  end

  pending "variable replacement" do 
  end
end
