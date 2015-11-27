# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "edt", id: false, :force => true do |t|
    t.integer "gid"
    t.integer  "id"
    t.string   "provincia"
    t.string   "localidad"
    t.decimal  "latitud", :precision => 15, :scale => 10
    t.decimal  "longitud", :precision => 15, :scale => 10
    t.decimal  "altura_snm"
    t.string   "sitio"
    # t.spatial  "geom", :limit => { :srid => 4326, :type => "geometry", :geographic => true }
    t.geometry "geom", :srid => 4326
    t.datetime "created_at"
    t.datetime "updated_at"
    t.primary_key "gid"
  end

# Could not dump table "edt" because of following StandardError
#   Unknown type 'geometry(Point,4326)' for column 'geom'

end
