class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]
  before_action :authenticate_user!, only: [:new, :destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    prototype = Prototype.new(prototype_params)
    if prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path(prototype)
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.destroy
      redirect_to root_path
    end
    
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
    unless current_user.id == @prototype.user.id
      redirect_to action: :index
    end
  end
  

end
