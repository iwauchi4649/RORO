class ReviewController < ApplicationController
  def business
    @h2 = "BUSINESS"
  end

  def company
    @h2 = "COMPANY"
  end

  def message
    @h2 = "MESSAGE"
  end

  def contact
    @h2 = "CONTACT"
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if verify_recaptcha(model: @contact) && @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      render :action => 'done'
    else
      render 'contact'
    end
  end

  def done
  end
  
  private
  def contact_params
    params.require(:contact).permit(:name, :mail, :phone, :content)
  end

end
