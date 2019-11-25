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
  validate :date_validator
  enum priority: { low: 1, medium: 2, urgent:3 }
  enum status: { pending: 1, proceeding: 2, done:3 }

  def date_validator
    if self.task_begin >= self.task_end
      errors.add(:task, "任務結束日期不能比開始日期早")
    end
  end
end