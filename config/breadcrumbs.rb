crumb :root do
  link "Home", root_path
end

# company
crumb :company do
  link "COMPANY", review_company_path
end

# business
crumb :business do
  link "BUSINESS", review_business_path
end

# message
crumb :message do
  link "MESSAGE", review_message_path
end

# contact
crumb :contact do
  link "CONTACT", review_contact_path
end