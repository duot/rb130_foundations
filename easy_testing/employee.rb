class NoExperienceError < Exception; end

class Employee
  attr_reader :experience

  def hire
    raise NoExperienceError  unless experience
  end
end
