class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @name = @user.name
    @prototypes = @user.prototypes

  end


  private
  def user_params
    params.require(:comment).permit(:name, :profile, :occupation, :position).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end