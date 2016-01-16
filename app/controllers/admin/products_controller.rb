class Admin::ProductsController < ApplicationController
	layout 'admin'

  def index
  	@products = Product.where(is_child_product: false)
    @keyword = "%" + params[:keyword] + "%" if params[:keyword].present?
    @products = @products.where("name LIKE ?", @keyword) if params[:keyword].present? && params[:keyword] != '' && params[:keyword] != 'undefined'
    @products = @products.page(params[:page]).per(1)
  end

  def new
  	@product = Product.new
    @image = Image.new
    @images = Image.all
  end

  def create
    @product = Product.new
    @product.name = params[:name].to_s
    @product.brand_id = params[:brand_id].to_i
    @product.brief = params[:brief]
    @product.description = params[:description]
    @product.is_multi_option = params[:is_multi_option]
    @product.visible = params[:visible]
    @product.available = params[:available]
    @product.sku = params[:sku].to_s
    @product.list_price = params[:list_price].to_f
    @product.sale_price = params[:sale_price].to_f
    @product.stock = params[:stock].to_i
    @product.weight = params[:weight].to_f
    @product.height = params[:height].to_f
    @product.length = params[:length].to_f
    @product.width = params[:width].to_f
    @product.feature_image_id = params[:feature_image_id].to_i

    product_attributes = ActiveSupport::JSON.decode(params[:product_attributes])
    product_attributes.each do |pa|
      @product_attribute = @product.product_attributes.build({ name: pa["name"].to_s , value: pa["value"].to_s })
    end

    child_products = ActiveSupport::JSON.decode(params[:child_products])
    child_products.each do |cp|
      @child_product = @product.child_products.build({ name: cp["name"].to_s,
        brand_id: @product.brand_id, brief: @product.brief, description: @product.description,
        sku: @product.sku, list_price: @product.list_price, sale_price: @product.sale_price,
        stock: cp["stock"].to_i , weight: @product.weight, height: @product.height, length: @product.length,
        width: @product.width, is_child_product: true, visible: @product.visible, available: @product.available, feature_image_id: @product.feature_image_id  })
    end

    respond_to do |format|
      if @product.save
        flash[:success] = "成功創建產品"
        format.json { render json:
          {
            state: 'success',
            redirect_url: edit_admin_product_path(@product)
          }
        }
    	else
        format.json { render json:
          {
            state: 'error',
            error: @product.errors.full_messages
          }
        }
    	end
    end
  end

  def edit
  	@product = Product.find(params[:id])
    @feature_image_url = Image.find(@product.feature_image_id).image_url if @product.feature_image_id
    @child_products = @product.child_products
    @product_attributes = @product.product_attributes
    @image = Image.new
    @images = Image.all
  end

  def create_child_product
    product_id = params[:product_id].to_i if params[:product_id].present?
    @product = Product.find(product_id)
    @child_product = @product.child_products.build({ name: '請輸入名稱' })

    respond_to do |format|
      if @product.save
        format.json { render json:
          {
            state: 'success',
            product: @product,
            child_product: @child_product
          }
        }
      else
        format.json { render json:
          {
            state: 'error',
            error: @product.errors.full_messages
          }
        }
      end
    end
  end

  def delete_child_product
    product_id = params[:cp_id].to_i if params[:cp_id].present?
    @product = Product.find(product_id)

    respond_to do |format|
      if @product.destroy
        format.json { render json:
          {
            state: 'success',
            product: @product
          }
        }
      else
        format.json { render json:
          {
            state: 'error',
            error: @product.errors.full_messages
          }
        }
      end
    end
  end

  def create_attribute
    product_id = params[:product_id].to_i if params[:product_id].present?
    @product = Product.find(product_id)
    @product_attribute = @product.product_attributes.build({ name: '請輸入名稱', value: '請輸入值' })

    respond_to do |format|
      if @product.save
        format.json { render json:
          {
            state: 'success',
            product: @product,
            product_attribute: @product_attribute
          }
        }
      else
        format.json { render json:
          {
            state: 'error',
            error: @product.errors.full_messages
          }
        }
      end
    end
  end

  def delete_attribute
    @product_attribute = ProductAttribute.find(params[:pa_id].to_i)
    @product_attribute.destroy
    respond_to do |format|
      format.json { render json:
        {
          state: 'success',
          product_attribute: @product_attribute
        }
      }
    end
  end

  def update
	  @product = Product.find(params[:id])
    @product.update({ name: params[:name].to_s, brand_id: params[:brand_id].to_i, brief: params[:brief], description: params[:description], is_multi_option: params[:is_multi_option],
        sku: params[:sku].to_s, list_price: params[:list_price].to_f, sale_price: params[:sale_price].to_f,
        stock: params[:stock].to_i , weight: params[:weight].to_f, height: params[:height].to_f, length: params[:length].to_f,
        width: params[:width].to_f, is_child_product: true, visible: params[:visible], available: params[:available], feature_image_id: params[:feature_image_id]  })

    product_attributes = ActiveSupport::JSON.decode(params[:product_attributes])
    product_attributes.each do |pa|
      @product_attribute = ProductAttribute.find(pa["id"].to_i).update({ name: pa["name"].to_s , value: pa["value"].to_s })
    end

    child_products = ActiveSupport::JSON.decode(params[:child_products])
    child_products.each do |cp|
      @child_product = Product.find(cp["id"].to_i).update({ name: cp["name"].to_s, stock: cp["stock"].to_i })
    end

    respond_to do |format|
      if @product.save!
        flash[:success] = "成功儲存產品"
        format.json { render json:
          {
            state: 'success',
            redirect_url: edit_admin_product_path(@product)
          }
        }
      else
        format.json { render json:
          {
            state: 'error',
            error: @product.errors.full_messages
          }
        }
      end
    end
	end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.json { render json:
        {
          status: "Product was successfully deleted.",
          product: @product
        }
      }
    end
  end

  private

  def products_params
    params.require(:product).permit(:name, :brief, :description, :list_price, :sale_price, :stock, :sku, :weight, :height, :length, :width, :is_multi_option, :visible, :available, :brand_id, :is_child_product, :parent_product_id, :feature_image_id)
  end
end
