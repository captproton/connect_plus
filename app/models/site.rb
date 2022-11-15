module FormSteps
  # http://api.rubyonrails.org/classes/Module.html#method-i-mattr_accessor
  mattr_accessor :form_steps do
    %w[initialize_model color_scheme add_details]
  end
end

class Site < ApplicationRecord
  include FormSteps
  belongs_to :user
  has_rich_text :content
  has_one_attached :logo  


  enum status: %i[initated processing published]

  def form_step
    @form_step ||= 'initialize_model'
  end

  # with_options if: -> {required_for_step?('color_scheme')} do |step|
  #   step.validates :brand_primary_color, presence: true
  # end

  # with_options if: -> {required_for_step?('add_details')} do |step|
  #   step.validates :subdomain, presence: true
  # end

  # def required_for_step?(step)
  #   # All fields are required if no form is present
  #   return true if form_step.nil?

  #   # All fields from the previous step are required if the
  #   # steps parameter appears before or we are on the current step
  #   return(true) if form_steps.index(step.to_s) <= form.steps.index(step.to_s)
  # end

end
