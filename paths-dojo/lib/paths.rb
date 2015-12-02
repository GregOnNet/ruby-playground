class Paths
  def initialize separator = "/"
    @separator = separator
  end
  def proceed path
    return nil if path.nil?
    validate path

    directories = path
      .split(@separator)
      .reject { |dir| dir.empty? }
      .map    { |dir| @separator + dir }

    directories
  end

  private
  def validate argument
    raise ArgumentError.new "Please pass a String." unless argument.is_a?(String)
  end
end
