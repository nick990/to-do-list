class TasksController < ApplicationController
  before_action :set_task, only: [:destroy, :complete]
  def index
    render json: {tasks: Task.all}, status: :ok
  end

  def create
    pp task_params
    task = Task.new(task_params)
    if task.save
      render json: {task: task}, status: :created
    else
      render json: {messages: task.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    render json: {message: "Task destroyed succesfully"}, status: :ok
  end

  def complete
    if @task.update(completed: true)
      render json: {task: @task}, status: :ok
    else
      render json: {messages: @task.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private 

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title)
  end
end
