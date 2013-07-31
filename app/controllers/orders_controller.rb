class OrdersController < ApplicationController

  # GET /orders
  # GET /orders.json
  def index
    @resource_title = "Daftar Order"
    # @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json {

        cols = ["account_members.first_name", "account_members.last_name", "code_order", "order_transactions.success", "status"]

        echo = params["sEcho"]
        iDisplayStart = params["iDisplayStart"]
        iDisplayLength = params["iDisplayLength"]
        iSortCol_0 = params["iSortCol_0"]
        sSortDir_0 = params["sSortDir_0"]
        sSearch = params["sSearch"]

        @orders = {}
        @orders["sEcho"] = echo
        @orders["iTotalRecords"] = Order.includes(:account_member, :transactions, :line_items).where("order_transactions.success = ?", 1)
.count
        @orders["iTotalDisplayRecords"] = Order.includes(:account_member, :transactions, :line_items).where("order_transactions.success = ?", 1)
.count

        if sSearch.blank?
          @orders["aaData"] = Order.includes(:account_member, :transactions, :line_items).where("order_transactions.success = ?", 1).limit(iDisplayLength).offset(iDisplayStart).order("#{cols[iSortCol_0.to_i]} #{sSortDir_0.to_s}")
        else 
          @orders["aaData"] = Order.includes(:account_member, :transactions, :line_items).where("order_transactions.success = ?", 1)
.limit(iDisplayLength).offset(iDisplayStart).order("#{cols[iSortCol_0.to_i]} #{sSortDir_0.to_s}")
        end
      }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  def print_order
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html { render 'orders/print', layout: false }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path, notice: 'Order berhasil, tunggu untuk konfirmasi selanjutnya' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
