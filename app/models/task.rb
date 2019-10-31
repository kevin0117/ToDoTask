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

class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {maximum: 500}, presence: true
  validates :task_begin, presence: true  #基本驗證，步驟12要改為 task_begin < task_end
  validates :task_end, presence: true    #基本驗證，步驟12要改為 task_begin < task_end
  validates :priority, presence: true
  validates :status, presence: true
  enum priority: { low: 1, medium: 2, urgent:3 }
end