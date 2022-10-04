class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(users_params)
    # @users_id = current_user.id
    # @users.role_ids = params['user']['role_ids'].reject(&:empty?).map(&:to_i)

    if @users.save
      @users.add_role Role.find(params['user']['role_ids'].reject(&:empty?).map(&:to_i)[0]).name
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def ban
    @user = User.find(params[:id])
    if @user.access_locked?
      @user.unlock_access!
    else
      @user.lock_access!
    end
    redirect_to users_path,notice: "User access lock: #{@user.access_locked?}"
  end

  private
  def users_params
    params.require(:user).permit( :firstname, :lastname, :phone, :email, :password)
  end

end