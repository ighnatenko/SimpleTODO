class ProjectsController < ApplicationController
    before_action :find_projects, only: [:update, :destroy]

    def index
        @projects = Project.order(:created_at)
      end
    
      def create
        if project_params[:title].mb_chars.length > 0
          @project = Project.create project_params
        end
      end
    
      def update
        @project.update(project_params)
      end
    
      def destroy
        @project.destroy
      end
    
      private
      
      def find_projects
        @project = Project.find(params[:id])  
      end

      def project_params
        params.require(:project).permit(:title)
      end
end
