class TasksController < ApplicationController

# class RestaurantsController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index # VIEW
    @tasks = Task.all
  end

  def show # VIEW
  end

  def new # VIEW
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit # VIEW
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def show_me_the_reviews
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  # These are 'strong params', Rails is asking us to 'whitelist'
  # all the params it will accept when assigning params to the
  # fields in a task
  def task_params
    params.require(:task).permit(:name, :status)
  end
end
