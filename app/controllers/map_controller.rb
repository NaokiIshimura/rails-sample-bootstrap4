class MapController < ApplicationController
  def sample
    # 地図
    @zoom   = 15
    @center = { lat: '35.681298', lng: '139.766247' }
    
    # 円
    @radius = 100
    
    # マーカー
    @location = set_location
  end
  
  def filter
    # 地図
    @zoom   = 15
    @center = { lat: '35.681298', lng: '139.766247' }
    
    # 円
    @radius = 100
    
    #フィルタ
    @filter_list = %w(filter_1 filter_2 filter_3 filter_4)
    
    @filter = params[:filter]
    @filter ||= 'filter_1'
    
    # マーカー
    @location = set_location(@filter)
  end
  
  
  private
  
  def set_location(filter = nil)
    
    p filter
    
    base_data = []
    
    if filter == nil
      base_data = [
          { lat: 35.681298 + 0.005, lng: 139.766247 },
          { lat: 35.681298 - 0.005, lng: 139.766247 },
          { lat: 35.681298, lng: 139.766247 + 0.005 },
          { lat: 35.681298, lng: 139.766247 - 0.005 },
          { lat: 35.681298 + 0.01, lng: 139.766247 },
          { lat: 35.681298 - 0.01, lng: 139.766247 },
          { lat: 35.681298, lng: 139.766247 + 0.01 },
          { lat: 35.681298, lng: 139.766247 - 0.01 },
      ]
    
    elsif filter[-1].to_i.odd? == true
      base_data = [
          { lat: 35.681298 + 0.005, lng: 139.766247 },
          { lat: 35.681298 - 0.005, lng: 139.766247 },
          { lat: 35.681298, lng: 139.766247 + 0.005 },
          { lat: 35.681298, lng: 139.766247 - 0.005 },
      ]
    else
      base_data = [
          { lat: 35.681298 + 0.01, lng: 139.766247 },
          { lat: 35.681298 - 0.01, lng: 139.766247 },
          { lat: 35.681298, lng: 139.766247 + 0.01 },
          { lat: 35.681298, lng: 139.766247 - 0.01 },
      ]
    end
    
    location = []
    
    base_data.each do |data|
      location.push(
          label: 'in',
          lat:   data[:lat],
          lng:   data[:lng],
          icon:  'http://mt.google.com/vt/icon/name=icons/spotlight/star_L_8x.png&scale=1'
      )
    end
    
    location
  end
  
  def set_window
    base_data = [
        { lat: 35.681298 + 0.0025, lng: 139.766247 },
        { lat: 35.681298 - 0.0025, lng: 139.766247 },
        { lat: 35.681298, lng: 139.766247 + 0.0025 },
        { lat: 35.681298, lng: 139.766247 - 0.0025 }
    ]
    
    window = []
    
    base_data.each do |data|
      window.push(
          label: 'out',
          lat:   data[:lat],
          lng:   data[:lng]
      )
    end
    
    window
  end

end
