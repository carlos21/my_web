class BrandController < ApplicationController

  def string

    render text: ActiveSupport::Base64.encode64(open(Rails.public_path + "/cars_images/alfaromeo.png") { |io| io.read })
  end
  
  def get_all
    hash = {}
    hash['brands'] = []
    
    brands = Brand.where(status: 'A')

    brands.each do |b|
      brand_hash = b.attributes
      brand_hash['encoded_image'] = ActiveSupport::Base64.encode64(open(Rails.public_path + "/cars_images/" + b.image) { |io| io.read })
      brand_hash['models'] = []
      models = b.models

      models.each do |m|
        cars = m.cars
        model_hash = m.attributes
        model_hash['cars'] = cars
        brand_hash['models'] << model_hash
      end
      
      hash['brands'] << brand_hash
    end

    render :json => hash, :layout => false
  end

  # GET /brands
  # GET /brands.json
  def index
    @brands = Brand.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brands }
    end
  end

  # GET /brands/1
  # GET /brands/1.json
  def show
    @brand = Brand.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /brands/new
  # GET /brands/new.json
  def new
    @brand = Brand.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /brands/1/edit
  def edit
    @brand = Brand.find(params[:id])
  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = Brand.new(params[:brand])

    respond_to do |format|
      if @brand.save
        format.html { redirect_to @brand, notice: 'Brand was successfully created.' }
        format.json { render json: @brand, status: :created, location: @brand }
      else
        format.html { render action: "new" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brands/1
  # PUT /brands/1.json
  def update
    @brand = Brand.find(params[:id])

    respond_to do |format|
      if @brand.update_attributes(params[:brand])
        format.html { redirect_to @brand, notice: 'Brand was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to brands_url }
      format.json { head :no_content }
    end
  end
end
