class MapController < ApplicationController
  def sample
    # 地図
    @zoom = 15
    @center = { lat: '35.681298', lng: '139.766247' }
  
    # 円
    @radius = 100
  
    # マーカー
    @location = set_location
  
    # 情報ウィンドウ
    @window = set_window
  end
  
  private

  def set_location
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
  
    location = []
  
    base_data.each do |data|
      location.push(
          label: 'in',
          lat: data[:lat],
          lng: data[:lng],
          icon: 'http://mt.google.com/vt/icon/name=icons/spotlight/star_L_8x.png&scale=1'
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
          lat: data[:lat],
          lng: data[:lng]
      )
    end
  
    window
  end
  
end
