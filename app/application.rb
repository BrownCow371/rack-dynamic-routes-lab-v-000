class Application

@@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_req = req.path.split("/items/").last
      item_object = @@items.find{|item| item.name == item_req}
      #binding.pry
      if !!item_object
        item_object.price
        #binding.pry
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end

end
