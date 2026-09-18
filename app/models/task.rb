class Task < ApplicationRecord
  validates :title, presence: { message: "課題名を入力してください" }
  validates :subject, presence: { message: "科目名を入力してください" }
  validates :deadline, presence: { message: "提出期限を入力してください" }

  validates :title, length: {
    maximum: 100,
    message: "課題名は100文字以内で入力してください"
  }

  validates :subject, length: {
    maximum: 50,
    message: "科目名は50文字以内で入力してください"
  }

  validates :memo, length: {
    maximum: 1000,
    message: "メモは1000文字以内で入力してください"
  }

    validate :deadline_cannot_be_in_the_past

  private

  def deadline_cannot_be_in_the_past
    return if deadline.blank?

    if deadline < Date.current
      errors.add(:deadline, "提出期限は今日以降の日付にしてください")
    end
  end
end