require 'v1/group_api'

module Api
  class API < Grape::API
    mount GroupApi::APIv1

    route :any, '*path' do
      error!({ error:  'Not Found',
               detail: "No such route '#{request.path}'",
               status: '404' },
             404)
    end
  end
end
