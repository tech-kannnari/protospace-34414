class PrototypesController < ApplicationController
  
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    # prototypeテーブルに投稿を保存するという記述
    # if 文を使用し、保存ができたら、ホームに戻るという記述
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit 
    @prototype = Prototype.find(params[:id])
    # unlessと同様の意味がある記述↓
    if current_user != @prototype.user
      redirect_to root_path
    end
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path(prototype.id)
    else
      render :edit
    end 
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    # prototypeテーブルの現在ログインしているユーザーの情報のみを取得するという記述, permitの中は取得するカラム名
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image, ).merge(user_id: current_user.id,) 
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end


end
