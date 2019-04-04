class Bootcamp
  def initialize(name, slogan, capacity)
    @name = name
    @slogan = slogan
    @student_capacity = capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |h,k| h[k] = [] }
  end

  def name
    @name
  end

  def grades
    @grades
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    @teachers.push(teacher)
  end

  def enroll(student)
    if @students.length < @student_capacity
      @students.push(student)
      true
    else
      false
    end
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    (@students.length / @teachers.length).floor
  end

  def add_grade(student, grade)
    if enrolled?(student)
      @grades[student].push(grade)
      true
    else
      false
    end
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    if enrolled?(student) && num_grades(student) > 0
      (@grades[student].sum/@grades[student].length).round
    end
  end
end

