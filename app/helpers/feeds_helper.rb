module FeedsHelper
  def post
    @post ||= Post.new
  end
end
