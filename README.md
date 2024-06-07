# rails-omnicalc-1

Target: https://omnicalc-1.matchthetarget.com/

RCAV flowchart: https://learn.firstdraft.com/lessons/120-rcav-flowchart

Lesson tutorials: https://learn.firstdraft.com/lessons/123

#### Notes:

1. Initially running the command bin/server resulted in an error message, gems not found. Resolved issue by typing bundle install.
2. Run the app with the command bin/server.
3. Apply RCAV.
- Fix the route within config/routes.rb. Remember to set the routes accordingly (e.g., /square/new). -- R
```
Rails.application.routes.draw do
  get("/square/new", {:controller => "omnicalc1", :action => "square_with_form"})
  get("/square_root/new", {:controller => "omnicalc1", :action => "square_root_with_form"})
  get("/payment/new", {:controller => "omnicalc1", :action => "payment_with_form"})
  get("/random/new", {:controller => "omnicalc1", :action => "random_with_form"})
end
```
- Fix the controller:
- The views/layouts/application.html.erb already contains the table header to link to the various routes. -- R
- create the class and method within a newly created app/controllers/omnicalc1_controller.rb -- CA
```
class Omnicalc1Controller < ApplicationController
  def square_with_form
    render({:template => "omnicalc1_templates/square_with_form"})
  end

  def square_root_with_form
    render({:template => "omnicalc1_templates/square_root_with_form"})
  end

  def payment_with_form
    render({:template => "omnicalc1_templates/payment_with_form"})
  end

  def random_with_form
    render({:template => "omnicalc1_templates/random_with_form"})
  end
end
```

- Create the default page called calculator.html.erb within views/layouts/omnicalc1_templates/square_with_form.html.erb. -- V
```
<form action="/square/results">
  <div>
    <label for="user_number">Enter a number</label>
  </div>
  <div>
    <input type="text" name="number" id="user_number" placeholder="What number do you want to take the square of?">
  </div>
  <button>Calculate square</button>
</form>
```

Troubleshooting TIPS:
- Note to place hash values within quotations
- Place the html in a subfolder, e.g., views/omnicalc1_templates/*.html.erb. Pay attention to the folder hierarchy/folder structure. 

4. Create the three additional html files for square_root_with_form, payment_with_form, and random_with_form and link them from config/routes.rb and app/controllers/omnicalc1_controller.rb (updated in the above). 

5. Create the resuls page for each calculation routine within views/omnicalc1_templates. Embed the codes for calculation within the respective html pages.
- In the main html pages where the forms are, note the route where the form is subsequently directed. You need to specify these routes in the config/routes.rb file. -- R

config/routes.rb
```
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
```

- Consequently, you need to update the methods in the app/controllers/omnicalc1_controller.rb -- CA

```
class Omnicalc1Controller < ApplicationController
  def square_with_form
    render({:template => "omnicalc1_templates/square_with_form"})
  end

  def square_root_with_form
    render({:template => "omnicalc1_templates/square_root_with_form"})
  end

  def payment_with_form
    render({:template => "omnicalc1_templates/payment_with_form"})
  end

  def random_with_form
    render({:template => "omnicalc1_templates/random_with_form"})
  end

  def square_with_form
    render({:template => "omnicalc1_templates/square_result"})
  end

  def square_root_with_form
    render({:template => "omnicalc1_templates/square_root_result"})
  end

  def payment_with_form
    render({:template => "omnicalc1_templates/payment_result"})
  end

  def random_with_form
    render({:template => "omnicalc1_templates/random_result"})
  end

end
```
