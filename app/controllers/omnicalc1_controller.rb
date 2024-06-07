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
