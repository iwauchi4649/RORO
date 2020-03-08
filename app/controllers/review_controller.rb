class ReviewController < ApplicationController
  def business
    @h2 = "BUSINESS"
  end

  def company
    @h2 = "COMPANY"
  end

  def contact
    @h2 = "CONTACT"
  end

  def message
    @h2 = "MESSAGE"
  end
end
