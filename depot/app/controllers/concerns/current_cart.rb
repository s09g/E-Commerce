module CurrentCart
  private

    def set_cart
      puts "Hello World\n\n\n\n\n"
      puts session[:id]
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart_id
    end
end
