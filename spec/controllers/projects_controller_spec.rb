require 'rails_helper'


RSpec.describe ProjectsController, type: :controller do
    let(:valid_attributes) {
        {title: "Hello test"}
    }
    
    describe "GET #index" do
        context "with valid params" do
            it "returns a success response" do
                project = Project.create! valid_attributes
                get :index, params: {}
                expect(response).to be_success
                expect(assigns(:projects)).to eq([project])
            end
    
            it "has a 200 status code" do
                get :index
                expect(response.status).to eq(200)
            end
        end
    end
end
