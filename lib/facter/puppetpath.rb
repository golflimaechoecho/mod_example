# example custom fact
Facter.add(:puppetpath) do
  confine :kernel do |value|
    value == 'Linux'
  end
  setcode 'which puppet'
end

Facter.add(:puppetpath) do
  confine :osfamily do |value|
    value == 'Windows'
  end
  # Windows uses 'where' instead of 'which'
  setcode 'where puppet'
end
