require 'wicked'

class Sites::BuildController < ApplicationController
  include Wicked::Wizard    
  # Asterisk means variable number of arguments
  steps(*Site.new.form_steps)

  before_action :set_site

  def show
    # @site = current_user.sites.find(params[:site_id])
    logo_url = params[:logo_url] || "default_logo"

    render_wizard
  end


  def update
    # @site = current_user.sites.find(params[:site_id])
# color.split('(').last.split(')').first
    # case step
    # when 'color_scheme'
    #   @site.onboarding_params(step)
      
    # when 'add_details'
    # end

    @site = Site.find(params[:site_id])
    @form_steps_links = Site.new.form_steps.drop(1)

    case step
    when 'initialize_model'
      skip_step if @site.persisted?
    when 'color_scheme'
      link_classes = "nav-link active"
      aria_hash     = Hash.new

      aria_hash[:current] = 'page'
      # store only the hsl values as a comma-seperated string
      site_params[:brand_primary_color] = site_params[:brand_primary_color].split('(').last.split(')').first
      if @site.update(site_params)
        render_wizard @site
      else
        render_wizard @site, status: :unprocessable_entity
      end

    when 'add_details'
      link_classes = "nav-link active"
      aria_hash     = Hash.new
      aria_hash[:current] = 'page'

        
      if @site.update(site_params)
        render_wizard @site
      else
        render_wizard @site, status: :unprocessable_entity
      end

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
                    :brand_primary_color, 
                    :subdomain,
                    :status,
                    :logo)
  end
  
end
