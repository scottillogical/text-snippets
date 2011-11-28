class SnippetsController < ApplicationController
	def index
		@snippets = Snippet.all
	end
end

