module SnippetsHelper
	def snippet(name, options={})
		content = options[:default]
		Snippet.save_default(name, content)
		snippet = Snippet.find_recent_by_name("todos.title.index")
		if snippet
			return snippet.content
		end
		content 
	end
end

