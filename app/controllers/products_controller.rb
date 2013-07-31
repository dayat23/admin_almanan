class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    # @products = Product.all
    @resource_title = "Daftar Produk"

    respond_to do |format|
      format.html # index.html.erb
      format.json {

        cols = ["code_product", "name_product", "stock", "products.status"]

        echo = params["sEcho"]
        iDisplayStart = params["iDisplayStart"]
        iDisplayLength = params["iDisplayLength"]
        iSortCol_0 = params["iSortCol_0"]
        sSortDir_0 = params["sSortDir_0"]
        sSearch = params["sSearch"]

        @products = {}
        @products["sEcho"] = echo
        @products["iTotalRecords"] = Product.includes(:category).where("code_product like ?", sSearch << "%").count
        @products["iTotalDisplayRecords"] = Product.includes(:category).where("code_product like ?", sSearch << "%").count

        if sSearch.blank?
          @products["aaData"] = Product.includes(:category).limit(iDisplayLength).offset(iDisplayStart).order("#{cols[iSortCol_0.to_i]} #{sSortDir_0.to_s}")
        else 
          @products["aaData"] = Product.includes(:category).where("code_product like ?", sSearch << "%").limit(iDisplayLength).offset(iDisplayStart).order("#{cols[iSortCol_0.to_i]} #{sSortDir_0.to_s}")
        end
      }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @resource_title = "Produk Baru"
    @product = Product.new
    @product.photo_products.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @resource_title = "Edit Produk"
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @resource_title = "Produk Baru"
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @resource_title = "Edit Produk"
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
