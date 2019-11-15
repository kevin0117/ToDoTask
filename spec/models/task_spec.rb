# create_table "tasks", force: :cascade do |t|
#   t.string "title"
#   t.text "content"
#   t.datetime "task_begin"
#   t.datetime "task_end"
#   t.integer "priority"
#   t.string "status"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:task_begin) }
    it { should validate_presence_of(:task_end) }
    it { should validate_presence_of(:priority) }
    it { should validate_presence_of(:status) }
  end


end
  # describe "Task Information" do
  #   it "is valid with a title, content, task date, priority, and status" do
  #     task = Task.new(title: "Shopping", 
  #                     content: "buy apple", 
  #                     task_begin: "2019-11-01 09:00:00",
  #                     task_end: "2019-11-01 00:00:00",
  #                     priority: "urgent",
  #                     status: "pending")
  #     expect(task).to be_valid
  #   end

  #   it "title field is blank" do
  #     task = Task.new(title: "", 
  #                     content: "buy apple", 
  #                     task_begin: "2019-11-01 09:00:00",
  #                     task_end: "2019-11-01 00:00:00",
  #                     priority: "urgent",
  #                     status: "pending")
  #       expect {
  #         expect(task).to be_valid
  #       }.to raise_exception(/Title can't be blank/)
  #   end

  #   it "is invalid without a title" do
  #     task = Task.new(title: nil)
  #     task.valid?
  #     expect(task.errors[:title]).to include("can't be blank")
  #   end
    
  #   it "content field is blank" do
  #     task = Task.new(title: "Shopping", 
  #                     content: "", 
  #                     task_begin: "2019-11-01 09:00:00",
  #                     task_end: "2019-11-01 00:00:00",
  #                     priority: "urgent",
  #                     status: "pending")
  #       expect {
  #         expect(task).to be_valid
  #       }.to raise_exception(/Content can't be blank/)
  #   end
    
  #   it "Task begin field is blank" do
  #     task = Task.new(title: "Shopping", 
  #                     content: "buy apple", 
  #                     task_begin: "",
  #                     task_end: "2019-11-01 00:00:00",
  #                     priority: "urgent",
  #                     status: "pending")
  #       expect {
  #         expect(task).to be_valid
  #       }.to raise_exception(/Task begin can't be blank/)
  #   end
    
  #   it "Task end field is blank" do
  #     task = Task.new(title: "Shopping", 
  #                     content: "buy apple", 
  #                     task_begin: "2019-11-01 09:00:00",
  #                     task_end: "",
  #                     priority: "urgent",
  #                     status: "pending")
  #       expect {
  #         expect(task).to be_valid
  #       }.to raise_exception(/Task end can't be blank/)
  #   end
    
  #   it "priority field is blank" do
  #     task = Task.new(title: "Shopping", 
  #                     content: "buy apple", 
  #                     task_begin: "2019-11-01 09:00:00",
  #                     task_end: "2019-11-01 00:00:00",
  #                     priority: "",
  #                     status: "pending")
  #       expect {
  #         expect(task).to be_valid
  #       }.to raise_exception(/Priority can't be blank/)
  #   end
    
  #   it "status field is blank" do
  #     task = Task.new(title: "Shopping", 
  #                     content: "buy apple", 
  #                     task_begin: "2019-11-01 09:00:00",
  #                     task_end: "2019-11-01 00:00:00",
  #                     priority: "urgent",
  #                     status: "")
  #       expect {
  #         expect(task).to be_valid
  #       }.to raise_exception(/Status can't be blank/)
  #   end           
  # end
