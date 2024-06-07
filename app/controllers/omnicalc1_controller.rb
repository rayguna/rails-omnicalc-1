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
