class PaymentsController < ApplicationController
  #include SessionsHelper
  respond_to :html, :json, :js


	def index

    if params[:query]
      @items = Item.where('cach=?', params[:query])
    else
      @items = Item.all
    end
    #@periodic = []
    #@payments.each do |payment|

    #end

    @items_by_date = @items.group_by(&:date )
    #@payments_per_week = @payments.period.where(:value=>2)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    respond_with(@items)

  end

  def show
    @payment = Payment.find(params[:id])

    respond_with(@payment)
  end

  # GET /payments/new
  # GET /payments/new.json
  def new
    @payment = Payment.new

    respond_with(@payment)
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
  end

  # POST /payments
  # POST /payments.json
  def create
	  @payment = Payment.new(params[:payment])
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
  end

  # PUT /payments/1
  # PUT /payments/1.json
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

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end
end
