class Contact < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}

  validates :name,
    length: { minimum: 1, maximum: 10 };

  validates :phone,
  # phoneは数字のみ許可。ハイフンやカッコは認めない
  numericality: { only_integer: true};
  validates :content, presence: true;
end
