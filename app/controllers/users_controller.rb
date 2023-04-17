class UsersController < ApplicationController
  def index
    @users = User.all
  end
#ここからアクションを記入する
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:title, :startDate, :endDate, :allDay, :memo))
    if @user.save
      flash[:success] = "スケジュールの登録に成功しました"
      redirect_to :users
    else
      flash[:delete] = "スケジュールの登録に失敗しました"
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.allDay == true
      puts "○"
    else
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title, :startDate, :endDate, :allDay, :memo))
      flash[:success] = "スケジュールを更新しました"
      redirect_to :users
    else
      flash[:delete] = "スケジュールの更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :users
  end
end
