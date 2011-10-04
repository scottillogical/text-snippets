class SnippetsController < ApplicationController
	def index
		Snippets.all
	end
end

