module Spree
  class DownloadablesController < ApplicationController

    def show
      @downloadable = Spree::Downloadable.find(params[:id])
      download_password_protected if @downloadable.password_protected?
      download_secret_link_protected if @downloadable.secret_links_only?
      send_doc if @downloadable.public?
    end

    private

    def download_password_protected
      if @downloadable.password_correct?(params[:password])
        send_doc
      else
        redirect_to :back, notice: I18n.t('incorrect_password_given')
      end
    end

    def download_secret_link_protected
      if @downloadable.secret_link_correct?(params[:secret])
        send_doc
      else
        redirect_to :back, notice: I18n.t('incorrect_secret_link')
      end
    end

    def send_doc
      send_file(@downloadable.path, { :filename => @downloadable.filename, :type => @downloadable.mime, :disposition => 'inline' })
    end
  end
end
