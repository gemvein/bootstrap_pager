DataMapper.setup(:default, 'sqlite::memory:')

class DataMapper::Collection
  def default_per_page
    model.default_per_page
  end
end