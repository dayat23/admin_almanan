class DashboardsController < ApplicationController
  
  def index
  	@totaluser = AccountMember.all.count

    @totalprice = Order.find(:all, conditions: ["orders.status = ? AND order_transactions.success = ?", 1, 1],
                              :joins => "INNER JOIN order_transactions ON order_transactions.order_id = orders.id",
                              :select => "SUM(orders.total_all_price) as total"
                            )

    @totalprice.each do |total|
      @price = total[:total]
    end

    @totalreview = ReviewProduct.all.count
    @totaltestimonial = Testimonial.all.count
  end

  def edit_password
  	@admin_user = AdminUser.new()

  	respond_to do |format|
  		format.html { render 'dashboards/edit_password' }
  	end
  end

  def update_password
  	newpassword = params[:newpassword]

    @admin_user = AdminUser.find(current_admin_user.id)
    if @admin_user.blank?
      flash[:notice] = "Tidak Ditemukan"
      redirect_to changepass_path
    else
      if newpassword.length >= 6
        @admin_user.update_attribute :password, newpassword
        sign_in @admin_user, bypass: true
        flash[:notice] = "Sukses Ganti Password"
        redirect_to changepass_path      	
      else
        flash[:notice] = "Password minimum 6 huruf"
        redirect_to changepass_path
      end
    end
  end
end
