class HomeController < ApplicationController
  def index
  	@pop_ideas = Idea.all(:order =>'title', :conditions => {:privacy => 'public'})
    # search_condition = "%" + params[:search] + "%"
    # @pop_ideas = Idea.find(:all, :conditions => ['title LIKE ?', search_condition])
    results = []
  	if !params[:search].nil?
	  	if ideas = Idea.find_by_title(params[:search])
        if ideas.is_a?Array
          results += ideas
        else
          results<<ideas
        end
      end
      @searched_users = []
      if users = User.find_by_username(params[:search])
        if users.is_a?Array
          @searched_users += users
        else
          (@searched_users<<users).flatten
        end
      end
    flash[:notice] = "Nothing found by that name!" unless results || @searched_users
    @pop_ideas = results if results
    end
    if @current_user
      user = get_current_user
      @updated = []
      @updated += user.commented_ideas.where("ideas.updated_at >= :date", date: user.last_login).all
      @updated += user.collaborated_ideas.where("updated_at >= :date", date: user.last_login).all



      # written = get_current_user.collaborated_ideas
      # written = get_current_user.ideas
      # this = []
      # written.each do |idea|
      #   # written.comments.find(:all, :conditions => {:created_at => Time.now}) do |comment|
      #   written.comments.find(:all) do |comment|
      #     if comment.created_at < get_current_user.last_seen
      #       this += comment
      #     end
      #   end
      # end
      # all += written
    end
  end

  def last_seen
    if DateTime.now < get_current_user.last_seen
      get_current_user.last_seen = DateTime.now
      get_current_user.save
    end
  end
end
