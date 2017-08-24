class ProjectsController < ApplicationController
    def index
        @projects = Project.order(:created_at)
      end
    
      def create
        if project_params[:title].mb_chars.length > 0
          @project = Project.create project_params
        end
      end
    
      def update
        @project = Project.find(params[:id])
        @project.update(project_params)
      end
    
      def destroy
        @project = Project.find(params[:id])
        @project.destroy
      end
    
      private
    
       def project_params
        params.require(:project).permit(:title)
      end
end
