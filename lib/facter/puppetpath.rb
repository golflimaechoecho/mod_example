# example custom fact
Facter.add(:puppetpath) do
  setcode do
    Facter::Core::Execution.which('puppet')
  end
end
