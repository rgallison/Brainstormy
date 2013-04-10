class HomeController < ApplicationController
  def index
  	@pop_ideas = Idea.order('title')
    # search_condition = "%" + params[:search] + "%"
    # @pop_ideas = Idea.find(:all, :conditions => ['title LIKE ?', search_condition])
    results = []
  	if !params[:search].nil?
	  	if ideas = Idea.find_by_title(params[:search])
        if ideas.is_a?Array
          results + ideas
        else
          results<<ideas
        end
      end
      if users = User.find_by_username(params[:search])
        if users.is_a?Array
          results + users
        else
          results<<users
        end
      end
    flash[:notice] = "Nothing found by that name!" if results
    @pop_ideas = results
    end
  end
end
