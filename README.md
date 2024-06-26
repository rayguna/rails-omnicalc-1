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

  get("/square/results", {:controller => "omnicalc1", :action => "square_results"})
  get("/square_root/results", {:controller => "omnicalc1", :action => "square_root_results"})
  get("/payment/results", {:controller => "omnicalc1", :action => "payment_results"})
  get("/random/results", {:controller => "omnicalc1", :action => "random_results"})
end
```

- Consequently, need to update the methods in the app/controllers/omnicalc1_controller.rb -- CA

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
#-------------------------
  def square_results
    render({:template => "omnicalc1_templates/square_results"})
  end

  def square_root_results
    render({:template => "omnicalc1_templates/square_root_results"})
  end

  def payment_results
    render({:template => "omnicalc1_templates/payment_results"})
  end

  def random_results
    render({:template => "omnicalc1_templates/random_results"})
  end

end
```

Troubleshooting TIPS: make sure all the names are consistent and correct for each of the RCAV components. 

6. Check what parameters are being passed to theresults page by adding the <%=params%> tag.
```
<h1>
  Square Results
</h1>

<%=params%>

<dl>
  <dt>
    Number
  </dt>
  <dd>
    5
  </dd>

  <dt>
    Square
  </dt>
  <dd>
    25.0
  </dd>
</dl>

<a href="/square/new">
  Calculate another square
</a>
```

Here is the output: {"number"=>"9", "controller"=>"omnicalc1", "action"=>"square_results"}

7. Embed the calcuation script directly into the html page. Note that to display the result, you must add an equal sign (e.g., <%=@my_variable>). Also, the variable must be preceeded with a @. If it is ust ruby code, simply embed with <% some_ruby_codes %>.   

square_results.html.erb
```
<h1>
  Square Results
</h1>

<%@number = params.fetch("number").to_f%>
<%@result = @number**2%>

<dl>
  <dt>
    Number
  </dt>
  <dd>
    <%=@number%>
  </dd>

  <dt>
    Square
  </dt>
  <dd>
    <%=@result%>
  </dd>
</dl>

<a href="/square/new">
  Calculate another square
</a>
```
8. For calculating monthly payment, round the numbers to 2 or 4 decimals using the command sprintf. Also, make sure to convert the fetched data to float using the method .to_f. 
```
<h1>
  Payment Results
</h1>

<%@apr=params.fetch("user_apr").to_f%>
<%@years=params.fetch("user_years").to_f%>
<%@pv=params.fetch("user_pv").to_f%>


<%def payment(apr, pv, years)%>
  <% r = apr / 1200 %>
  <% n = years*12 %>

  <% numerator = r*pv %>
  <% denominator= 1-(1+r)**-n %>

  <% res = numerator/denominator #format to two decimal places %>

  <% return res %>
<% end %>

<% @the_result = payment(@apr, @pv, @years) %>

<dl>
  <dt>
    APR
  </dt>
  <dd>
    <%=sprintf("%.4f",@apr)%>%
  </dd>

  <dt>
    Number of years
  </dt>
  <dd>
    <%=@years%>
  </dd>

  <dt>
    Principal
  </dt>
  <dd>
    <%=number_to_currency(@pv, :unit => "$")%>
  </dd>

  <dt>
    Payment
  </dt>
  <dd>
    <%=number_to_currency(@the_result, :unit => "$")%>
  </dd>
</dl>

<a href="/payment/new">
  Calculate another payment
</a>
```
To convert float to currency format, use: number_to_currency(money_value, :unit => "$")

9. Passed all tests.

***
