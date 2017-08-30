class TasksController < ApplicationController
  before_action :find_projects, only: [:create, :destroy, :update]
  before_action :find_tasks, only: [:destroy, :update]

  def create
    @task = @project.tasks.build task_params
    @task.position = @task.id

    respond_to do |format|
      if @task.save
        @task.position = @task.id  # Знаю что нельзя так делать, это временное решение!
        @task.save
        format.js  {}
      else
        format.js render body: nil
      end
    end
  end

  def destroy
    @task.destroy
  end

  def update
    @task.update(task_params)
  end

  def sort
    params[:task].each_with_index do |id, index|
      Task.where(id: id).update_all({position: index+1})
    end
    render body: nil
  end

  private

  def find_tasks
    @task = @project.tasks.find(params[:id])
  end

  def find_projects
    @project = Project.find(params[:project_id]) 
  end

  def task_params
    params.require(:task).permit(:title, :done, :date)
  end
end
