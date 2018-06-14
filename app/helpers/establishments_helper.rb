module EstablishmentsHelper

  def save_establishment(establishment)
    session[:establishment_id] = establishment.id
  end

  def current_establishment
    @current_establishment ||= Establishment.find_by(id: session[:establishment_id])
  end

end
