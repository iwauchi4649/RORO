class ReviewController < ApplicationController
  def business
    @h2 = "BUSINESS"
  end

  def company
    @h2 = "COMPANY"
  end

  def contact
    @h2 = "CONTACT"
    @contact = Contact.new

  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.valid?
      render :action => 'confirm'
    else
      render :action => 'contact'
    end
  end
 
  def done
    @contact = Contact.new(contact_params)
    if params[:back]
      render :action => 'contact'
    else
      ContactMailer.send_mail(@contact).deliver_now
      render :action => 'done'
    end
  end
  
  private
  def contact_params
    params.require(:contact).permit(:name, :mail, :phone, :content)
  end

  def message
    @h2 = "MESSAGE"
  end
end
