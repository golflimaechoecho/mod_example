# example custom fact
Facter.add(:rubypath) do
  confine :kernel do |value|
    value == 'Linux'
  end
  setcode 'which ruby'
end

Facter.add(:rubypath) do
  confine :osfamily do |value|
    value == 'Windows'
  end
  # Windows uses 'where' instead of 'which'
  setcode 'where ruby'
end
