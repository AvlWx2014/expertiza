class RedisApi

  # by injecting a client object, we can test this with a mock
  def initialize(client)
    @client = client
  end

  # Get the value stored at [key].
  #
  # This method returns `nil?` if [key] is
  # not currently in the redis store.
  def get(key)
    client.get(key)
  end

  # Get the value stored at [key].
  #
  # This method returns `nil?` if [key] is
  # not currently in the redis store.
  #
  # @see get
  def [](key)
    get key
  end

  # Set [key] to [value]. If [key] already exists,
  # then the old value is clobbered.
  def set(key, value)
    client.set(key, value)
  end

  # Set [key] to [value]. If [key] already exists,
  # then the old value is clobbered.
  #
  # @see set
  def []=(key, value)
    set key, value
  end

  # Enqueue [value] at the tail of the list stored at
  # [key]. If [key] does not exist when this is called,
  # an empty list is first created with the same [key],
  # and then [value] is added to the tail.
  def enqueue(key, value)
    client.rpush(key, value)
  end

  # Enqueue [value] at the tail of the list stored at
  # [key]. If [key] does not exist when this is called,
  # an empty list is first created with the same [key],
  # and then [value] is added to the tail.
  #
  # @see enqueue
  def <<(key, value)
    enqueue key, value
  end

  # Dequeue the value at the head of the list stored at
  # [key]. If [key] does not exist, or the list is empty
  # this method returns nil.
  def dequeue(key)
    client.lpop(key)
  end

  # Dequeue the value at the head of the list stored at
  # [key]. If [key] does not exist, or the list is empty
  # this method returns nil.
  #
  # @see dequeue
  def >>(key)
    dequeue key
  end

  private

  attr_accessor :client

end
