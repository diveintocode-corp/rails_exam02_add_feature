require Rails.root.join('app', 'services', 'base_service.rb')

module Movies
  class BaseService < ::BaseService
    include BaseServiceImpl
  end
end
