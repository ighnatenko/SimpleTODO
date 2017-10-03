require 'rails_helper'

RSpec.describe Task, type: :model do
    it "create a task successfully" do
        task = Task.create title: "Test title" 

        expect(task.title).to eq "Test title"
    end

    it "cannot create a task without title" do
        task = Task.create

        expect(task.errors[:title]).to eq ["can't be blank"]
    end
end
