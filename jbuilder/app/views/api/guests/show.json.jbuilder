json.partial! 'api/guests/guest', guest: @guest
json.gifts @guest.gifts, partial: 'api/gifts/gift', as: :gift
