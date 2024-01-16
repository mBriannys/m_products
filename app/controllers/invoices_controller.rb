class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      flash[:notice] = 'Invoice was successfully created.'
      redirect_to invoices_path
    else
      flash[:alert] = "Invoice was not created. #{@invoice.errors.full_messages}"
      redirect_to new_invoices_path
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @cart_items = @invoice.cart_items
    if @invoice.destroy!
      @cart_items.update_all(invoice_id: nil)
      flash[:notice] = 'Invoice was successfully removed.'
      redirect_to invoices_path
    else
      flash[:alert] = "Invoice was not removed."
      redirect_to invoices_path
    end
  end

  private
  def invoice_params
    params.require(:invoice).permit(:status)
  end
end
