class PaymentsController < ApplicationController

  respond_to :html, :json, :js
  before_filter :find_payer, :only => [:create, :edit]


	def index

    @items = Item.accessory(params[:dep]).all

=begin
    unless current_user.admin?

      if params[:query]
        @items = Item.accessory(current_user.role).where('`items`.`cach`=? ', params[:query])
      else
        @items = Item.accessory(current_user.role).all
      end

    else
      if params[:query]
        @items = Item.accessory(params[:dep]).where('`items`.`cach`=? ', params[:query])
      else
        @items = Item.all
      end
    end
=end


    @items_by_date = @items.group_by(&:date )

    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    respond_with(@items)
    #binding.pry
  end

  def show
    @payment = Payment.find(params[:id])

    respond_with(@payment)
  end


  def new
    @payment = Payment.new

    respond_with(@payment)
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
  end


  def create
    #binding.pry
	  @payment = Payment.new(params[:payment])


    @payment.user_id = current_user.id
    @payment.department = @payer.name
    @payment.payer_id = @payer.id
	  period = params[:payment][:period]

	  respond_to do |format|
		  if @payment.save
			  if @payment.period.present?
				  i = 0
				  @payment.count ||= 1
				  while @payment.count>i do
					  #periods = Item.new(:date=>Date.today + i.month, :payment_id=>@payment.id)
					  if @payment.period.to_s == "month"
						  date_to = i.month
					  end
					  if @payment.period.to_s == "year"
						  date_to = i.year
					  end
					  if @payment.period.to_s == "day"
						  date_to = i.day
					  end

					  @payment.items.create(:date=>@payment.payment_date + date_to, :cach => @payment.cach)
					  i +=1
				  end

			  end


			  format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
			  format.json { render json: @payment, status: :created, location: @payment }
		  else
			  format.html { render action: "new" }
			  format.json { render json: @payment.errors, status: :unprocessable_entity }
		  end
    end
    #binding.pry
  end


  def update
    @payment = Payment.find(params[:id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end

  def find_payer
    @payer = Payer.find(params['payment']['payer_id'])
    #binding.pry
  end

end
