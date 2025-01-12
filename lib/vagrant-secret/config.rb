class Config < Vagrant.plugin(2, :config)
  attr_accessor :vagrant_secrets

  def initialize
    @vagrant_secrets = UNSET_VALUE
  end

  def finalize!
    @vagrant_secrets = lambda { } if @vagrant_secrets == UNSET_VALUE
  end

  def validate(machine)
    errors = _detected_errors
    if ! @vagrant_secrets.is_a?(lambda)
      errors << "vagrant_secrets must be a lambda returning a hash"
    end

    { "foo" => errors }
  end
end
