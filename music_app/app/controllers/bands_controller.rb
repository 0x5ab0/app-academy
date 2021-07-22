class BandsController < ApplicationController
    def index # bands_url (GET) /bands
        @bands = Band.all
        render :index
    end

    def show # band_url (GET) /bands/:id
        @band = Band.find(params[:id])
        render :show
    end

    def new # new_band_url (GET) /bands/new
        @band = Band.new
        render :new
    end

    def create # bands_url (POST) /bands
        @band = Band.new(band_params)

        if @band.save
            redirect_to band_url(@band)
        else
            flash.now[:errors] = @band.errors.full_messages
            render :new
        end
    end

    def edit # edit_band_url (GET) /bands/:id/edit
        @band = Band.find_by_id(params[:id])
        if @band
            render :edit
        else
            flash[:errors] = ["No band with ID ##{params[:id]}."]
            redirect_to bands_url
        end
    end

    def update # bands_url (PATCH / PUT) /bands/:id
        @band = Band.find(params[:id])

        if @band
            @band.update_attributes(band_params)
            redirect_to band_url(@band)
        else
            flash.now[:errors] = @band.errors.full_messages
            render :edit
        end
    end

    def destroy # bands_url (DELETE) /bands/:id
        @band = Band.find(params[:id])
        @band.destroy
        redirect_to bands_url
    end

    private

    def band_params
        params.require(:band).permit(:name)
    end
end
