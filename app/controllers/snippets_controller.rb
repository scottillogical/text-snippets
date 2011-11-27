class SnippetsController < ApplicationController
	def index
		Snippet.all
	end
end

