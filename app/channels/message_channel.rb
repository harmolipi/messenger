class MessageChannel < ApplicationCable::Channel
  # before_filter :authenticate_user!

  def subscribed
    stream_from 'message'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    data['user'] = current_user
    ActionCable.server.broadcast('message', data)
  end
end
