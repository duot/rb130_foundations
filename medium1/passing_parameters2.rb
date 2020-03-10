birds = %w(raven finch hawk eagle)
def just_raptors arr
  yield arr
end
 

 just_raptors(birds) { |_, _, *raptors|
 puts raptors
 }

