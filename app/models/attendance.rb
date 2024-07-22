class Attendance < ApplicationRecord
  belongs_to :employee

  validates :latitude, :longitude, presence: true
  validate :within_company_radius

  private

  def within_company_radius

    @latitude = self.latitude
    @longitude = self.longitude

    @company_latitude = employee.company.latitude 
    @company_longitude = employee.company.longitude

    return unless @latitude.present? && @longitude.present? && @company_latitude.present? && @company_longitude.present?

    distance = calculate_distance(@company_latitude, @company_longitude, @latitude, @longitude)

    if distance <= employee.company.radius
      errors.add(:base, "Check-in location is outside the company's allowable radius.")
    end
  end

  # Haversine formula to calculate distance between two points
  def calculate_distance(lat1, lon1, lat2, lon2)
    rad_per_deg = Math::PI / 180
    rkm = 6371 # Earth radius in kilometers
    rm = rkm * 1000 # Radius in meters

    dlat_rad = (lat2 - lat1) * rad_per_deg
    dlon_rad = (lon2 - lon1) * rad_per_deg

    lat1_rad = lat1 * rad_per_deg
    lat2_rad = lat2 * rad_per_deg

    a = Math.sin(dlat_rad / 2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad / 2)**2
    c = 2 * Math::atan2(Math.sqrt(a), Math.sqrt(1 - a))

    # rm * c # Delta in meters
    rkm * c #in kilometer
  end
end
