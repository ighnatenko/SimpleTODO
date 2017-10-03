require 'rails_helper'

RSpec.describe Project, type: :model do
  it "create a project successfully" do
    project = Project.create title: "Test title" 

    expect(project.title).to eq "Test title"
    expect(project).to be_valid
  end

  it "cannot create a project without title" do
    project = Project.create

    expect(project.errors[:title]).to eq ["can't be blank"]
  end

  it "create a project with a task successfully" do
    project = Project.create title: "Test title" 
    project.tasks.create title: "Title task"

    expect(project.save).to eq true
    expect(project.tasks.first.title).to eq "Title task"
  end
end
