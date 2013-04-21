class HomeController < ApplicationController
  def index
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
          @searched_users<<users
        end
      end
    flash[:notice] = "Nothing found by that name!" unless results || @searched_users
    @pop_ideas = results if results
    end
    if @current_user
      all = []
      all = get_current_user.collaborated_ideas.find(:all)#:updated_at => Time.now)
      #written = get_current_user.collaborated_ideas
      written = get_current_user.ideas
      this = []
      # written.each do |idea|
      #   this += idea.comments#.find(:all)#:updated_at => Time.now)
      # end
      all += this

      @updated = all if all
    end
  end
end
