class Antenna < ActiveRecord::Base

  self.table_name = "edt"

  alias_attribute :identifier, :gid
  alias_attribute :name, :sitio

  alias_attribute :province, :provincia
  alias_attribute :location, :localidad

  alias_attribute :latitude, :latitud
  alias_attribute :longitude, :longitud

  alias_attribute :height, :altura_snm

  validates :name, presence: true
  validates :province, presence: true
  validates :location, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  before_save :fill_geom

  def self.closest_to lng, lat
    order("ST_Distance(geom, ST_GeomFromText('POINT(#{lng} #{lat})', 4326)) ASC").first
  end

  def distance_to lng, lat
    another_point = geom_factory.point lng, lat
    geom.distance another_point
  end

  def fill_geom
    self.geom = geom_factory.point longitude, latitude
  end

  protected

  def geom_factory
    RGeo::Geographic.spherical_factory srid: 4326
  end

end
