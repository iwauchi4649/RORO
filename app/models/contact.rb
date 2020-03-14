class Contact < ApplicationRecord

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :mail, {presence: true, format: { with: VALID_EMAIL_REGEX }}

validates :name,
  length: { minimum: 1, maximum: 10 };

VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
  
validates :content, presence: true;
end
