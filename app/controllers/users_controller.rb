class UsersController < ApplicationController
  # def index

  # end

  def new
  	@user = User.new

  	respond_to do |format|
  		format.html  # new.html.erb
    	format.json  { render :json => @user }
    end
  end

  def create
  	user_info = params[:user]
  	if !user_info.value? ""
	  	if user_info[:password] == user_info[:password2] and user_info[:email] == user_info[:email2]
	  		user_info.delete("password2")
	  		user_info.delete("email2")
	  		@user = User.new(user_info)

	  	  	respond_to do |format|
	  			if @user.save
	  				format.html  { redirect_to(@user, :notice => 'User was successfully created.') }
	    		else
	      			format.html  { render :action => "new" }
	    		end
	    	end
      end
  	end
  	flash[:warning] = "Please try again"
  	redirect_to home_index_path
  	
  end

  def show
    #Rachel
    id = params[:id]
    @movie = User.find(id)
  end
  
end
