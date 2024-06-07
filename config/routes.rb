Rails.application.routes.draw do
  get("/square/new", {:controller => "omnicalc1", :action => "square_with_form"})
  get("/square_root/new", {:controller => "omnicalc1", :action => "square_root_with_form"})
  get("/payment/new", {:controller => "omnicalc1", :action => "payment_with_form"})
  get("/random/new", {:controller => "omnicalc1", :action => "random_with_form"})

  get("/square/result", {:controller => "omnicalc1", :action => "square_result"})
  get("/square_root/result", {:controller => "omnicalc1", :action => "square_root_result"})
  get("/payment/result", {:controller => "omnicalc1", :action => "payment_result"})
  get("/random/result", {:controller => "omnicalc1", :action => "random_result"})
end
