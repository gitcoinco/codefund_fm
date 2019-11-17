class OmniauthCallbacksController < ApplicationController
  include OmniConcern

  %w[twitter github linkedin].each do |meth|
    define_method(meth) do
      create
    end
  end

  def failure
    redirect_to root_url
  end
end
