  class Todo < ApplicationRecord
    # default_scope -> { order(pinned: :desc, created_at: :desc) }

    # after_save :ensure_single_pinned_todo,
    #             if: -> { saved_change_to_pinned?(from: false, to: true) }

    # private

    # def ensure_single_pinned_todo
    #   Todo.where(pinned: true).where.not(id: id).update_all(pinned: false)
    # end
    # attr_accessor :set_date
    def formatted_date
      date ? date.strftime("%m月 %d日") : "日付未設定"
    end
  end
