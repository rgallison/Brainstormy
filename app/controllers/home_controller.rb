class HomeController < ApplicationController
  skip_before_filter :check_login, :only => [:index]
  def index
    @messages = get_messages.keep_if { |m| m.status == "unread"} if @current_user
  	@pop_ideas = Idea.all(:order =>'title', :conditions => {:privacy => 'public'})
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
      @searched_users = []
      if users = User.find_by_username(params[:search])
        if users.is_a?Array
          @searched_users = [users]
        else
          (@searched_users<<users).flatten
        end
      end
      #Colin added 5/2:
      if tag = Tag.find_by_category(params[:search])
        results=results+tag.ideas
      end
    flash[:notice] = "Nothing found by that name!" unless results || @searched_users
    @pop_ideas = results if results
    end
    if @current_user
      @updated = get_updated
    end
  end
end
