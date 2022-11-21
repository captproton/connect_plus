require 'wicked'

class SiteCreationWizardController < ApplicationController
  include Wicked::Wizard    
  # Asterisk means variable number of arguments
  steps(*Site.new.form_steps)

  before_action :set_site

  def show
    @site = Sites.find(params[:site_id])

    render_wizard
  end


  def update
    # @site = current_user.sites.find(params[:site_id])

    case step
    when 'color_scheme'
      @site.onboarding_params(step)
      
    when 'add_details'
    end
  end


  def create
    @site = Site.create
    redirect_to wizard_path(steps.first, site_id: @site.id)
  end

  private

  def finish_wizard_path
    root_path
  end

  def creation_params(step = 'color_scheme')
    
  end

  def set_site
    @site = Site.find(params[:site_id])
  end

  def site_params
    params  .require(:site)
            .permit(:name, 
                    :subject, 
                    :preview, 
                    :sender_name, 
                    :sender_email, 
                    :recipients_group, 
                    :send_at, 
                    :initialized, 
                    :content, 
                    :status, 
                    :publication_id)
  end
  
end
