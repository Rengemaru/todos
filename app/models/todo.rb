  class Todo < ApplicationRecord
    # default_scope -> { order(pinned: :desc, created_at: :desc) }

    # after_save :ensure_single_pinned_todo,
    #             if: -> { saved_change_to_pinned?(from: false, to: true) }

    # private

    # def ensure_single_pinned_todo
    #   Todo.where(pinned: true).where.not(id: id).update_all(pinned: false)
    # end
  end
