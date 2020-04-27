require 'ostruct'

class TimeZoneController < ApplicationController
  TIME_ZONES_MAP = {
    'America/New York City (EST)' => 'US/Eastern',
    'America/Chicago (CST)' => 'US/Central',
    'America/Denver (MST)' => 'US/Mountain',
    'America/Los Angeles (PST)' => 'US/Pacific',
  }

  def index
    @time_zones = time_zones
    @selected_time_zone = find_time_zone
  end

  def time_zones
    [
     eastern_time,
     central_time,
     mountain_time,
     pacific_time,
    ]
  end

  def find_time_zone
    zone = params[:format]
    OpenStruct.new(name: zone, local: Time.current.in_time_zone(TIME_ZONES_MAP[zone]).strftime("%k:%M:%S"))
  end

  def eastern_time
    OpenStruct.new(name: 'America/New York City (EST)', local: Time.current.in_time_zone('US/Eastern').strftime("%k:%M:%S"))
  end

  def central_time
    OpenStruct.new(name: 'America/Chicago (CST)', local: Time.current.in_time_zone('US/Central').strftime("%k:%M:%S"))
  end

  def mountain_time
    OpenStruct.new(name: 'America/Denver (MST)', local: Time.current.in_time_zone('US/Mountain').strftime("%k:%M:%S"))
  end

  def pacific_time
    OpenStruct.new(name: 'America/Los Angeles (PST)', local: Time.current.in_time_zone('US/Pacific').strftime("%k:%M:%S"))
  end

end
