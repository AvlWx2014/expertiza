class StorageProxy
  require "redis"

  @api = RedisApi.new

  private

  attr_accessor :api
end