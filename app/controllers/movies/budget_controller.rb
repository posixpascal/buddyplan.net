class Movies::BudgetController < ApplicationController
  before_action :set_movie
  before_action :authenticate_user!
  def show
    @transfers = @movie.movie_money_transfers
    @current_balance = @transfers.where(:budget_type => "income").sum(:budget_amount) - @transfers.where(:budget_type => "withdrawal").sum(:budget_amount)
  end

  def new
    @transfer = @movie.movie_money_transfers.new
  end

  def create
    @transfer = @movie.movie_money_transfers.new(budget_params)
    @transfer.user_id = current_user.id
    @transfer.budget_type = params[:budget_type]
    @transfer.budget_amount = (params[:movie_money_transfer][:budget_amount].to_f * 100)
    @transfer.save
    redirect_to movie_budget_path(@movie)
  end

  def destroy
    @transfer = @movie.movie_money_transfers.find(params[:id]).delete
    redirect_to movie_budget_path(@movie)
  end

  def budget_params
    params.require(:movie_money_transfer).permit(:budget_amount, :budget_type, :title, :actor_id, :item_id)
  end
end
