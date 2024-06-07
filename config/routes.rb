Rails.application.routes.draw do
  get("/square/new", {:controller => "omnicalc1", :action => "square_with_form"})
  get("/square_root/new", {:controller => "omnicalc1", :action => "square_root_with_form"})
  get("/payment/new", {:controller => "omnicalc1", :action => "payment_with_form"})
  get("/random/new", {:controller => "omnicalc1", :action => "random_with_form"})

  get("/square/results", {:controller => "omnicalc1", :action => "square_results"})
  get("/square_root/results", {:controller => "omnicalc1", :action => "square_root_results"})
  get("/payment/results", {:controller => "omnicalc1", :action => "payment_results"})
  get("/random/results", {:controller => "omnicalc1", :action => "random_results"})
end
