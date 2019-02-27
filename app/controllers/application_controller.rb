class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :ensure_json_request
  before_action :ensure_json_content_type

  def ensure_json_request
    return if request.headers['Accept'] =~ /vnd\.api\+json/

    render nothing: true, status: 406
  end

  def ensure_json_content_type
    unless request.get?
      return if request.headers['Content-Type'] =~ /vnd\.api\+json/

      render nothing: true, status: 415
    end
  end
end
