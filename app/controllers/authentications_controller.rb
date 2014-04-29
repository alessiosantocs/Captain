class AuthenticationsController < ApplicationController
  before_action :set_authentication, only: [:show, :edit, :update, :destroy]

  # GET /authentications
  # GET /authentications.json
  def index
    @authentications = Authentication.all
  end

  # GET /authentications/1
  # GET /authentications/1.json
  def show
  end

  # GET /authentications/new
  def new
    @authentication = Authentication.new
  end

  # GET /authentications/1/edit
  def edit
  end

  # POST /authentications
  # POST /authentications.json
  def create

    @auth = request.env["omniauth.auth"]

    provider      = @auth.provider
    uid           = @auth.uid
    access_token  = @auth.credentials.token
    token_secret  = @auth.credentials.secret
    consumer_key  = ""
    consumer_secret  = ""

    if provider == "bitbucket"
      consumer_key = @auth.extra.access_token.consumer.key
      consumer_secret = @auth.extra.access_token.consumer.secret
    end

    @authentication = Authentication.find_by_provider_and_uid(provider, uid)

    if @authentication.present?
      # The authentication is already there
      # Get the user
      user = @authentication.user

      # And sign him in
      flash[:notice] = "Signed in successfully"
      sign_in_and_redirect :user, user

    elsif current_user.present?
      # There's no authentication in db, but the user is present

      # Create an authentication for the user and redirect
      current_user.authentications.create! :provider => provider, 
                                           :uid => uid, 
                                           :access_token => access_token,
                                           :token_secret => token_secret,
                                           :consumer_key => consumer_key,
                                           :consumer_secret => consumer_secret
      redirect_to authentications_url, :notice => "Successfully added authentication."

    else
      # There is no @auth and no user
      # So create a new user
      user = User.new

      # Create an authentication for the new user
      user.apply_omniauth(@auth)

      if user.save
        # Sign him in if no errors
        flash[:notice] = "Signed in successfully"
        flash[:just_signed_up] = true
        sign_in_and_redirect :user, user
      else
        # Complete registration if any errors
        session[:omniauth] = @auth.except('extra')
        redirect_to new_user_registration_url
      end
    end

  end

  # PATCH/PUT /authentications/1
  # PATCH/PUT /authentications/1.json
  # def update
  #   respond_to do |format|
  #     if @authentication.update(authentication_params)
  #       format.html { redirect_to @authentication, notice: 'Authentication was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @authentication.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /authentications/1
  # DELETE /authentications/1.json
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    
    respond_to do |format|
      format.html { 
        redirect_to authentications_url, :notice => "Successfully destroyed authentication." 
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authentication
      @authentication = Authentication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authentication_params
      params.require(:authentication).permit(:user_id, :provider, :uid, :access_token)
    end
end
